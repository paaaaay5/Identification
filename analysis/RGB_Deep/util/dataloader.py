import pandas as pd
import numpy as np
import os
import torch.utils.data as data
import torch
from torchvision import transforms as transforms
import random

def get_path(path4):
    target_files = []

    for root, dirs, files in os.walk(path4):
        targets = [os.path.join(root, f) for f in files]
        target_files.extend(targets)
    return target_files




def mat2py(path):
    df=pd.read_csv(path)
    df=df.values

    n=int(len(df[1])/71)
    Box=[]
    for i in range(n):
        Box.append(df[:,71*i:71*(i+1)])
    return Box




def img2py(path):
    df=pd.read_csv(path)
    df=df.values
    return df



def exmat(target_files):
  csv_files=[]
  for i in range(len(target_files)):
    if "csv" in target_files[i]:
      csv_files.append(target_files[i])
  return csv_files


class DataTransform():

    def __init__(self):

        self.data_transform = {
            'train': Compose([
                imgpad(),
                rotate90(),
                np2tensor2()
            ]),
            'val': Compose([
                imgpad(),
                np2tensor2()
            ])
        }

    def __call__(self, phase,img):
        
        img = self.data_transform[phase](img)

        return img
    
    
    
class Compose(object):
    def __init__(self, transforms):
        self.transforms = transforms

    def __call__(self,img):
        for t in self.transforms:
            img = t(img)

        return img



class rotate90(object):

    def __call__(self,img):
        a=random.randint(0,3)
        if not(a==0):
            img=np.rot90(img,a)
        return img



class mat2seq(object):
    def __init__(self):
        self.M=[]

    def __call__(self,A):
        for i in range(len(A)):
            I=np.pad(A[i],((47,46),(76,77)))
            pad=np.zeros((224,224,2))
            D=np.dstack([I,pad])
            self.M.append(D)

        img=np.stack([self.M[0],self.M[1],self.M[2],self.M[3],self.M[4]],3)
        return img



class mat2img(object):
    def __init__(self):
        self.M=[]

    def __call__(self,A):
        for i in range(len(A)):
            II=A[i]
            I=np.pad(II[65:,:],((79,79),(76,77)))
            pad=np.zeros((224,224,2))
            D=np.dstack([I,pad])
            self.M.append(D)

        img=self.M[2]
        return img



class imgpad(object):
    def __init__(self):
        self.pad=np.zeros((224,224,2))
        
    def __call__(self,img):
        I=np.pad(img,((77,77),(76,77)))
        D=np.dstack([I,self.pad])
        return D




class np2tensor(object):
    def __call__(self,img):
        x = torch.from_numpy(img.astype(np.float32)).clone()
        x = x.permute(2,0,1,3)
        return x




class np2tensor2(object):
    def __call__(self,img):
        x = torch.from_numpy(img.astype(np.float32)).clone()
        x = x.permute(2,0,1)
        return x



#フォルダ名からラベルを作成 (key:number ,value:indivisual number)
def makelabels(path):
    #フォルダ名を取得
    label_list=os.listdir(path)
    label_files=[]

    for i in range(len(label_list)):
        if not("MATLAB" in label_list[i]):
            label_files.append(label_list[i])

    #dicに格納
    lable_dic={}
    for j in range(len(label_files)):
        lable_dic[str(j)]=label_files[j]

    return lable_dic


class COWPredicter():

    def __init__(self,classindex):
        self.classindex = classindex

    def predict_max(self,out):
        max_id=np.argmax(out.detach().numpy())
        predicted_label_name=self.classindex[str(max_id)]

        return predicted_label_name



import torch.utils.data as data

class CowDataset(data.Dataset):

    def __init__(self,target_files,phase,transform,classindex):
        self.phase=phase
        self.transform=transform
        self.target_files=target_files
        self.classindex=classindex

    def __len__(self):
        return len(self.target_files)

    def __getitem__(self,index):
        img,one_hot = self.pull_item(index)
        return img,one_hot

    def pull_item(self,index):
        self.path=self.target_files[index]

        #onehot label
        if self.phase=="train":
            label=self.path[34:51]
        else:
            label=self.path[32:49]

        key = [k for k, v in self.classindex.items() if v == label]
        one_hot=int(key[0])

        #cow image
        #img=mat2py(self.path)
        img=img2py(self.path)
        img=self.transform(self.phase,img)

        return img,one_hot
