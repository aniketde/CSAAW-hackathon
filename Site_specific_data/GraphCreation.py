'''
CSAAW Hackathon

'''

import numpy as np
from numpy import genfromtxt
from sklearn.metrics.pairwise import euclidean_distances
from sklearn import preprocessing 
import glob


NormalizationFlag = 2 # 0 is normalizing by norm, 1 is scale it, 2 is make it in between [0,1]
dataset_list = []
for files in glob.glob("*.csv"):
    dataset_list.append(files)
    #print files 
    
N = len(dataset_list)
for site in range(0,N):
    
    dataset_file = dataset_list[site]
    dataset = genfromtxt(dataset_file, delimiter=',')
    
    if len(dataset.shape) == 2:
        datasetX = dataset[:,:-1]
        datasetID = dataset[:,-1]
    else: 
        dataset = dataset[np.newaxis,:]
        datasetX = dataset[:,:-1]
        datasetID = dataset[:,-1]
    
    if NormalizationFlag == 0:
        dataset_normalized = preprocessing.normalize(datasetX, norm='l2')
    elif NormalizationFlag == 1:
        dataset_normalized = preprocessing.scale(datasetX)
    elif NormalizationFlag == 2:
        min_max_scaler = preprocessing.MinMaxScaler(feature_range=(0, 1))
        dataset_normalized = min_max_scaler.fit_transform(datasetX)
        
    dataset_site = 'dataset' + str(site)
    exec (dataset_site + " = dataset_normalized")
    

S = np.zeros([N,N])
for ii in range(0,N):
    dataset_ii = 'dataset' + str(ii)
    for jj in range(0,N):
        dataset_jj = 'dataset' + str(jj)
        
        ## (??) Kernelize This 
        M = euclidean_distances(eval(dataset_ii),eval(dataset_jj)) 
        #print M
        S[ii,jj] = np.linalg.norm(M,ord = 'fro')/(float(M.shape[0])*float(M.shape[1]))


#print S
        
