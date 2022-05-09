import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import datetime as dt
import matplotlib.ticker
import os
import re
import csv
import sys


def get_exe_dict(directory):
    os.chdir(directory)
    files = [f for f in os.listdir(".") if os.path.isfile(f) and f.endswith(".log")]
    exe_lib_dict = {}
    exe_boolean = 0
    
    for file in files:
        with open(file) as f:
            lines = f.readlines()

        current_key=""
        lib_list = []
        for line in lines:
            if line.startswith("==>"):
                x = line.replace('==>','')
                x = x.replace('<==','')
                x = x.replace('/proc/','')
                x = x.replace('/maps','')
                x = x.strip()
                exe_boolean = 1
            elif len(line.strip()) == 0:
                if exe_boolean == 1:
                    exe_boolean = 0
            else:
                if exe_boolean == 1:
                    exe_boolean = 0
                    current_key = line.split()[-1]
                    exe_lib_dict[current_key] = [current_key]
                else:
                    if ".so" in line.split()[-1]:
                        exe_lib_dict[current_key].append(line.split()[-1])


        for key in exe_lib_dict:
            exe_lib_dict[key] = list(set(exe_lib_dict[key]))

            
    return exe_lib_dict

def check_exe_lib(exe_lib_dict, exe_file, lib_file):
    with open(exe_file) as f:
        exe_list = f.read().splitlines()
    with open(lib_file) as f:
        lib_list = f.read().splitlines()


    existing_exe_list = [] #save the .exe for yearly update since it is already in the list
    new_lib_list=[]
    updated_dict=[]
    for key, value in exe_lib_dict.items():
        if key in exe_list:
            existing_exe_list.append(key)
        else:
            updated_dict[key] = value #Insert new key and value from this dict
            new_lib_list = new_lib_list + value

    existing_exe_list = list(set(existing_exe_list))
    new_lib_list = list(set(new_lib_list))


    rpm_list = [] #The new library that we need to call rpm -qf to get package name
    for lib in new_lib_list:
        if lib not in lib_list:
            rpm_list.append(lib)

    
    with open('rpm_list.txt', 'a') as f:
        for item in rpm_list:
            f.write(item + '\n')
    
    return updated_dict

    #Compute node server will call rpm -qf on the rpm_list.txt file
    #After that it sends back the os package name to us

    #MAKE SURE TO MAKE PYTHON SLEEP WHILE WAITING FOR COMPUTE NODE TO COLLECT DATA BEFORE CALLING NEXT FUNCTION

def insert_new_lib(date, updated_dict, rpm_file, os_file):
    with open(rpm_file) as f:
        rpm_list = f.read().splitlines()
    with open(os_file) as f:
        os_list = f.read().splitlines()


    row = []
    rows = []
    for key, value in updated_dict.items():
        for lib in value:
            if lib in rpm_list:
                index = rpm_list.index(lib)
                os_package = os_list[index]
            else:
                os_package = "" #os command get package from the field in SQL#
            row = [date, key, lib, os_package]
            rows.append(row)

    fields = ["Date","App","Library","Package"]

    with open('insert_library_versioning.csv', 'w') as f: 
        write = csv.writer(f) 
        write.writerow(fields)
        write.writerows(rows)
                
        #os.command ( insert csv file into library)



def clean_up(updated_dict, rpm_file, exe_file, lib_file):
    with open(rpm_file) as f:
        rpm_list = f.read().splitlines()

    with open(exe_file, 'a') as f:
        for key in updated_dict: #Add all the keys already updated to a list of existing executables
            f.write(item + '\n')

    with open(lib_file, 'a') as f:
        for item in rpm_list:   #Add the new shared object file that we needed to run rpm on
            f.write(item + '\n')

    os.remove(rpm_file)
    


if __name__ == "__main__":
    directory=str(sys.argv[1])
    exe_file = "/Users/nhinguyen/Downloads/Experiment/exe_file.txt"
    lib_file = "/Users/nhinguyen/Downloads/Experiment/lib_file.txt"
    
    exe_lib_dict = get_exe_dict(directory)
    #check_exe_lib(exe_lib_dict, exe_file, lib_file)
                
                
                    
            
    
