'''
CSAAW Hackathon

'''

import numpy as np
from numpy import genfromtxt
from sklearn.metrics.pairwise import euclidean_distances
from sklearn import preprocessing 
import glob


NormalizationFlag = 0 #
dataset_list = []
for files in glob.glob("*.csv"):
    dataset_list.append(files)
    #print files 
    
N = len(dataset_list)
for site in range(0,N):
    
    dataset_file = dataset_list[site]
    dataset = genfromtxt(dataset_file, delimiter=',')
    
    ## (??) Write normalization
    if NormalizationFlag == 0:
        dataset_normalized = preprocessing.normalize(dataset, norm='l2')
    elif NormalizationFlag == 1:
        dataset_normalized = preprocessing.scale(dataset)
    
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


print S
        
