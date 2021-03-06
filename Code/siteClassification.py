import numpy as np
from numpy import genfromtxt
from sklearn.metrics.pairwise import euclidean_distances
import sklearn.metrics.pairwise as Kern
from sklearn import preprocessing 
import glob
import os

def datasetLabels(NormalizationFlag,SimilarityFlag,filepath):
    dataset_list = []
    cwd = os.getcwd()
    for files in glob.glob(cwd +filepath+ "*.csv"):
        dataset_list.append(files)
    
    N = len(dataset_list)
    dataset = genfromtxt(dataset_list[1], delimiter=',')
    datasetTotal = np.zeros([1,dataset.shape[1]-1])
    print dataset.shape
    labelTotal = np.zeros([1])
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
        datasetTotal = np.concatenate((datasetTotal,dataset_normalized),axis = 0)
        labels = site*np.ones([dataset_normalized.shape[0]])
        labelTotal = np.concatenate((labelTotal,labels),axis = 0)
        
    datasetTotal = datasetTotal[1:,:]
    labelTotal = labelTotal[1:]
    
    return datasetTotal, labelTotal

filepath = "/Site_specific_data/"


NormalizationFlag = 1 # 0 is normalizing by norm, 1 is scale it, 2 is make it in between [0,1]
SimilarityFlag = 1 #0 if euclidean DISTANCE (note distance and similarity), 1 if RKHS (mean embedding) with linear kernel, 2 if RKHS with Gaussian kernel
    

datasetTotal, labelTotal = datasetLabels(NormalizationFlag,SimilarityFlag,filepath)

