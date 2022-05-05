import csv
import pandas as pd




def csv2movie(path):
    f = open(path,'r')
    reader = csv.reader(f)
    l = [row for row in reader]
    f.close()

    C=[]
    for i in range(int(len(l)/134)):
        A=[]
        B=[]
        for j in range(132):
            B=l[134*i+j]
            B=B[:-1]
            for k in range(len(B)):
                A.append(float(B[k]))

        A=np.array(A)
        A=A.reshape(132,176)
        C.append(A)
    return C



def csv2img(path):
    f = open(path,'r')
    reader = csv.reader(f)
    l = [row for row in reader]
    f.close()
    C=[]
    
    for i in range(int(len(l)/2)):
        k=l[2*i]
        A=[]
        
        for j in range(len(k)-1):
            A.append(float(k[j]))
            
        A=np.array(A)
        A=A.reshape(132,176)
        C.append(A)
        
    return C


def mat2py(path):
    df=pd.read_csv(path)
    df=df.values

    Box=[]
    for i in range(0,7):
        Box.append(df[:,71*i:71*(i+1)])
    return Box


import xml.etree.ElementTree as ET 
import os

def get_path(path4):
    target_files = []

    for root, dirs, files in os.walk(path4):
        targets = [os.path.join(root, f) for f in files]
        target_files.extend(targets)
    return target_files



def exmat(target_files):
  csv_files=[]
  for i in range(len(target_files)):
    if "csv" in target_files[i]:
      csv_files.append(target_files[i])
  return csv_files



def read_data(train_path,val_path):
    train_files = get_path(train_path)
    val_files=get_path(val_path)

    train_files = exmat(train_files)
    val_files = exmat(val_files)
    return train_files,val_files