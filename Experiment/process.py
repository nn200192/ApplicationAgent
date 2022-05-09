import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import datetime as dt
import matplotlib.ticker
import os



#pd.set_option("display.max_rows",None, "display.max_columns",None)

#FILE PROCESSING
def process_file(directory):
    df_list=[]

    #Retrieve files and sort by date
    os.chdir(directory)
    files = [f for f in os.listdir(".") if os.path.isfile(f) and f.endswith(".log")]
    files.sort(key=os.path.getmtime)

    #Going through each log file
    for file in files:
        with open(file) as f:
            lines = f.readlines()
            
        user=[]
        pid=[]
        ppid=[]
        percent_mem=[]
        cmd=[]

        for line in lines[1:]:
            user.append(line.split()[0])
            pid.append(line.split()[1])
            ppid.append(line.split()[2])
            percent_mem.append(float(line.split()[3]))
            cmd.append(line.strip().split()[4:])
        
        f.close()

        dictionary={}
        dictionary['user']=user
        dictionary['pid']=pid
        dictionary['ppid']=ppid
        dictionary['%mem']=percent_mem
        dictionary['cmd']=cmd

        df = pd.DataFrame(dictionary)

        #Only filter user and not root activities
        df = df[df['user'].str.contains('user')]

        #Sort by memory usage
        df = df.sort_values(by=['%mem'], ascending=False)

        df_list.append(df)
        
    return df_list

    


#AGGREGATING DATA
def aggregate_data(df_list, time_interval):
    print(df_list)
    count=0
    x_axis=[] #Store timestamp
    y_axis=[] #Store memory
    text_axis=[] #Store annotated texts

    for df in df_list:
        user_list=df['user'].tolist()
        pid_list=df['pid'].tolist()
        ppid_list=df['ppid'].tolist()
        mem_list=df['%mem'].tolist()
        cmd_list=df['cmd'].tolist()
        for i in range(len(mem_list)):
            #Ignore insignificant memory usage that is less than 0.5% of memory
            if mem_list[i] < 0.5: 
                continue
            x_axis.append(count)
            y_axis.append(mem_list[i])
            text=str(mem_list[i]) + ":" + user_list[i] + ":"
            for j in range(len(cmd_list[i])):
                text = text + cmd_list[i][j] + " "
                if j == len(cmd_list[i])-1 or j == 0:
                    text_axis.append(text.strip())
                    break
                        
        count = count + time_interval
    
    return x_axis, y_axis, text_axis


#VISUALIZING AGGREGATED LOG FILES 
def visualize_data(x_axis, y_axis, text_axis):
    #Filter text_axis
    text_filter=[]
    text_final=[]
    for text in text_axis:
        if text in text_filter:
            text_filter.append("")
        else:
            text_filter.append(text)

    for text in text_filter:
        if text == "":
            text_final.append(text)   
        else:
            text_final.append(':'.join(text.split(":")[1:]))
            

    y_axis=[float(item) for item in y_axis]
    

    #PLOT DATA
    plt.margins(x=0)
    plt.scatter(x_axis, y_axis, c=y_axis, s=8)
    texts = []
    for i, txt in enumerate(text_final):
        plt.annotate(txt, (x_axis[i], y_axis[i]), fontsize=7)

    plt.xlabel("Timestamp (seconds)")
    plt.ylabel("% Memory usage")

    plt.tight_layout()
    plt.show()


if __name__ == "__main__":
    df_list = process_file(".")
    x_axis, y_axis, text_axis = aggregate_data(df_list, 30) #Data was collected every 30s
    visualize_data(x_axis, y_axis, text_axis)
    




