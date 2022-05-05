#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import torch
import torch.nn as nn
from torch.nn import init
import torchvision
import numpy as np

class ConvLSTM(nn.Module):
    def __init__(self):
        super(ConvLSTM,self).__init__()

        #Convモジュール
        self.conv=Convnet()
        #LSTMモジュール
        self.rnn = nn.LSTM(input_size=1000, hidden_size=500, num_layers=5,batch_first = True)
        #Dense
        self.output_layer = nn.Linear(500, 200)  
        
    def forward(self,x,hidden0=None):
        saved=[]
        for i in range(5):
            out=self.conv(x[:,:,:,:,i])
            saved.append(out)
                          
        out1=torch.stack((saved[0],saved[1],saved[2],saved[3],saved[4]),1)    
        out2,(hidden,cell)=self.rnn(out1,hidden0)
        out3=self.output_layer(out2[:,-1,:])
        return out1
    
class Convnet(nn.Module):
    def __init__(self):
        super(Convnet,self).__init__()
        self.vgg19 = torchvision.models.vgg19(pretrained=True)
        
    def forward(self, x):
        outputs = self.vgg19(x)
        return outputs   
    

