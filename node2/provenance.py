import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import datetime as dt
import matplotlib.ticker
import os
import re
import networkx as nx
import csv
import sys



#pd.set_option("display.max_rows",None, "display.max_columns",None)
# A class to represent a graph object



def sort_files(directory):
    os.chdir(directory)
    #Retrieve files and sort by date
    files = [f for f in os.listdir(".") if os.path.isfile(f) and f.endswith(".log")]
    files.sort(key=os.path.getmtime)

    return files
    
#FILE PROCESSING
def process_file(files, directory):
    os.chdir(directory)
    
    df_list=[]
    pid_ppid_list=[]
    timelines=[]
    dates=[]

    
    #Going through each log file
    for file in files:
        with open(file) as f:
            lines = f.readlines()
            
        user=[]
        pid=[]
        ppid=[]
        percent_mem=[]
        percent_cpu=[]
        cmd=[]

        for line in lines[1:]:
            user.append(line.split()[0])
            pid.append(line.split()[1])
            ppid.append(line.split()[2])
            percent_mem.append(float(line.split()[3]))
            percent_cpu.append(float(line.split()[4]))
            cmd.append(line.strip().split()[5:])
        
        f.close()

        dictionary={}
        dictionary['user']=user
        dictionary['pid']=pid
        dictionary['ppid']=ppid
        dictionary['%mem']=percent_mem
        dictionary['%cpu']=percent_cpu
        dictionary['cmd']=cmd

        df = pd.DataFrame(dictionary)

        df_list.append(df)
        timelines.append(file[11:-4])
        dates.append(file[0:10])
        
    return dates,timelines,df_list

def remove_duplicates(l):
    return list(set(l))

def create_directed_graph(df):
    labels={}
    job_IDs=[]
    graphs=[]
    root_parents=[]
    parents=[]
    childs=[]
    
    for i in range(len(df)):
        user=df.loc[i, 'user']
        pid=df.loc[i, 'pid']
        ppid=df.loc[i, 'ppid']
        cmd=df.loc[i, 'cmd']         
        if cmd[0] == "slurmstepd:" and len(cmd) >= 2:
            #Check for pattern [jobID.batch] or [jobID.0]
            if re.search(r'[[0-9]*.batch]', cmd[1]) or re.search(r'[[0-9]*.0]', cmd[1]):
                job_IDs.append(cmd[1][cmd[1].index('[')+1:cmd[1].index('.')])
                parents.append(pid)
                graphs.append(nx.DiGraph())
                labels[pid]=process_cmd(cmd) 

    for i in range(len(parents)):
        root_parents.append(parents[i])
        graphs[i].add_node(parents[i])


    while len(parents) > 0:
        for i in range(len(df)):
            pid=df.loc[i, 'pid']
            ppid=df.loc[i, 'ppid']
            cmd=df.loc[i, 'cmd'] 
            if ppid in parents:
                for j in range(len(graphs)):
                    if ppid in graphs[j].nodes:
                        graphs[j].add_edge(ppid,pid)
                        childs.append(pid)
                        labels[pid]=process_cmd(cmd)
                        
            
        childs=remove_duplicates(childs)              
        parents=childs
        childs=[]
        

    return labels, job_IDs, root_parents, graphs

    
        
def process_cmd(cmd):
    text=""
    for c in cmd:
        text=text + c + " "
    return text.strip()

def process_cmd_2(cmd):
    text=""
    for c in cmd:
        if len(text) > 40:
            text = text +"..."
            break
        text=text + c + " "   
    return text.strip()
    

def process_data(timeline, df, job_IDs, root_parents, graphs):
    count=0
    x_axis=[] #Store timestamp
    y_axis=[] #Store memory
    z_axis=[] #cpu utilization
    labels=[] #Store annotated texts
    texts=[] #Store full texts
    full_texts=[]

    for i, graph in enumerate(graphs):
        for node in graph.nodes:
            index = df.loc[df['pid'] == node].index[0]
            job_ID=job_IDs[i]

            user=df.loc[index,'user']
            pid=df.loc[index, 'pid']
            percent_mem=df.loc[index, '%mem']
            percent_cpu=df.loc[index, '%cpu']
            cmd=df.loc[index,'cmd']
            x_axis.append(timeline)
            y_axis.append(percent_mem)
            z_axis.append(percent_cpu)
            labels.append(pid)
            texts.append(user+ ":j" + job_ID + ":p" + pid + ":" + process_cmd_2(cmd))
            full_texts.append(user+ ":j" + job_ID + ":p" + pid + ":" + process_cmd(cmd))

    return x_axis, y_axis, z_axis, labels, texts, full_texts

def filter_data(x_axis, y_axis, z_axis, labels, texts, full_texts):
    x = []
    y = []
    z = []
    l = []
    t = []
    f_t =[]
    for i in range(len(x_axis)):
        #if y_axis[i] >= 0:
        x.append(x_axis[i])
        y.append(y_axis[i])
        z.append(z_axis[i])
        l.append(labels[i])
        t.append(texts[i])
        f_t.append(full_texts[i])

    return x,y,z,l,t,f_t


def first_write_to_R(filename):
    f = open(filename, "a")
    f.write("library(ggpubr) \nlibrary(ggdag) \nlibrary(dagitty) \nlibrary(ggplot2) \ntheme_set(theme_dag()) \n")

def last_write_to_R(filename, length, plotname):
    f = open(filename, "a")

    count=0
    for x in range(0, length, 3):
        if x < length:
            ncol = 1
        if x + 1 < length:
            ncol = 2
        if x + 2 < length:
            ncol = 3
        if ncol == 1:
            f.write("arrange" + str(count) + " <- ggarrange(p" + str(x) + ", ncol =1, nrow = 1) \n")
        if ncol == 2:
            f.write("arrange" + str(count) + " <- ggarrange(p" + str(x) + ", p" + str(x+1) + ", ncol =2, nrow = 1) \n")
        if ncol == 3:
            f.write("arrange" + str(count) + " <- ggarrange(p" + str(x) + ", p" + str(x+1) + ", p" + str(x+2) + ", ncol =3, nrow = 1) \n")
        count=count+1

    f.write("\n")
    f.write("myplots=list(")
    for i in range(count):
        if i == count-1:
            f.write("arrange" + str(i) + ") \n")

        else:
            f.write("arrange" + str(i) + ", ")

    f.write('pdf( \"' + plotname + '.pdf\", height=7, width=15) \n')
    f.write('myplots \n')
    
        
        

def write_to_R(labels, graphs, filename, timeline, counter):
    f = open(filename, "a")
    f.write("dag <- dagify( \n")
    for graph in graphs:
        for edge in graph.edges:
            f.write(edge[1] + " ~ " + edge[0] + "," + "\n")
    f.write("labels = c(")

    count = 0
    for key,value in labels.items():
            if count == 0:
                count=count+1
                f.write('\"' + key + '\"' + "=" + '\"' + value + '\"')
            else:
                f.write(',')
                f.write('\"' + key + '\"' + "=" + '\"' + value + '\"')
    
            
    f.write(")) \n")
    f.write("p" + str(counter) + " <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + \n")
    f.write('geom_dag_point(colour = "DarkBlue", size=14) + \n')
    f.write('geom_dag_edges(edge_width=0.3,edge_colour="black") + \n')
    f.write('geom_dag_text(colour = "white",size=4) + \n')
    f.write('geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + \n')
    f.write('ggtitle(\"' + timeline + '\") + \n')
    f.write('theme_dag() \n \n')

    f.write('\n \n \n')

    f.close()


def write_to_csv(dates, filename, x_axis, y_axis, z_axis, labels, texts, full_texts, dag):
    rows=[]
    for i in range(len(x_axis)):
        row=[dates[i], x_axis[i], y_axis[i], z_axis[i], labels[i], texts[i], full_texts[i], dag[i]]
        rows.append(row)

    with open(filename, 'a', encoding='UTF8') as csvfile:  
        # creating a csv writer object 
        csvwriter = csv.writer(csvfile) 
        
        # writing the data rows 
        csvwriter.writerows(rows)
    

def get_DAG_if_root(graphs,labels,root_parents):
    dag = []
    for label in labels:
        if label.strip() in root_parents:
            index = root_parents.index(label.strip())
            dag.append(str(graphs[index].edges))
        else:
            dag.append("")

    return dag
            

def process_map_file(files, directory):
    os.chdir(directory)
    
    df_list=[]
    timelines=[]
    dates=[]

    
    #Going through each log file
    for file in files:
        with open(file) as f:
            lines = f.readlines()

        date=[]
        time=[]
        pid=[]    
        address=[]
        permission=[]
        offset=[]
        device=[]
        inode=[]
        pathname=[]

        
        current_pid = 1
        for line in lines:
            if line.startswith("==> /proc"):
                current_pid = line.split("/")[2] #Get the process ID
            elif len(line.strip()) == 0:
                current_pid = current_pid
            else:
                date.append(file[0:10])
                time.append(file[11:-9])
                pid.append(current_pid)
                address.append(line.split()[0])
                permission.append(line.split()[1])
                offset.append(line.split()[2])
                device.append(line.split()[3])
                inode.append(line.split()[4])
                if len(line.split()[5:]) == 0:
                    pathname.append("")
                else:   
                    pathname.append(line.split()[5:])
        
        f.close()

        dictionary={}
        dictionary['date']=date
        dictionary['time']=time
        dictionary['pid']=pid
        dictionary['address']=address
        dictionary['permission']=permission
        dictionary['offset']=offset
        dictionary['device']=device
        dictionary['inode']=inode
        dictionary['pathname']=pathname 
        

        df = pd.DataFrame(dictionary)    
        df_list.append(df)
        
        
    return df_list
        
def write_maps_to_csv(df, filename, graphs):
    node_list=[]
    for graph in graphs:
        node_list = node_list + list(graph.nodes)

    node_list = remove_duplicates(node_list)
    df_filtered = df.loc[(df['pid'].isin(node_list))]
    df_filtered.to_csv(filename,encoding='utf-8', index=False, mode='a', header=False)

    
    
if __name__ == "__main__":
    directory=str(sys.argv[1])
    
    #A list of all possible files sorted by date
    files = sort_files(directory + "/logs")
    files_maps = sort_files(directory + "/maps_logs")

    #Aggregate every 20 files in a list of all files. Each batch contains 20 files
    batches = [files[x:x+20] for x in range(0, len(files), 20)]
    batches_maps = [files_maps[x:x+20] for x in range(0, len(files_maps), 20)]

    for batch, batch_map in zip(batches,batches_maps):
        dates, timelines, df_list = process_file(batch, directory + "/logs")
        df_maps_list = process_map_file(batch_map, directory + "/maps_logs")

        fields=["Date", "Time", "Mem", "CPU", "Labels","Annotations", "Full_Annotations","DAG_if_root"]
        with open(directory +"/csv/plot" + timelines[0] + ".csv", 'a', encoding='UTF8') as csvfile:  
            csvwriter = csv.writer(csvfile) 
            csvwriter.writerow(fields)

        fields_maps=["Date","Time","Pid","Address","Permission","Offset","Device","Inode","Pathname"]
        with open(directory +"/csv/maps" + timelines[0] + ".csv", 'a', encoding='UTF8') as csvfile:  
            csvwriter = csv.writer(csvfile) 
            csvwriter.writerow(fields_maps)

        counter = 0
        for timeline, df, df_map in zip(timelines,df_list, df_maps_list):
            labels, job_IDs, root_parents, graphs = create_directed_graph(df)
            if len(labels) == 0:
                continue
            x_axis, y_axis, z_axis, my_labels, texts, full_texts = process_data(timeline, df, job_IDs, root_parents, graphs)
            x, y, z, l, t, f_t = filter_data(x_axis, y_axis, z_axis, my_labels, texts, full_texts)
            dag = get_DAG_if_root(graphs, my_labels,root_parents)

            if counter == 0:
                first_write_to_R(directory + "/Rscripts/plot" + str(timelines[0]) + ".R")
            write_maps_to_csv(df_map, directory + "/csv/maps" + str(timelines[0]) + ".csv",graphs)              
            write_to_R(labels, graphs, directory + "/Rscripts/plot" + str(timelines[0]) + ".R", timeline, counter)
            write_to_csv(dates, directory +"/csv/plot" + timelines[0] + ".csv", x, y, z, l, t, f_t, dag)
            counter = counter+1
        last_write_to_R(directory + "/Rscripts/plot" + str(timelines[0]) + ".R", counter, directory +"/graphs/plot" + timelines[0])
