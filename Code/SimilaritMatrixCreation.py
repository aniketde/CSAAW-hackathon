'''
CSAAW Hackathon

'''

import numpy as np
from numpy import genfromtxt
from sklearn.metrics.pairwise import euclidean_distances
import sklearn.metrics.pairwise as Kern
from sklearn import preprocessing
import glob
import os

def getSigma(X,sigmaType):
    [n,d] = X.shape

    shat = np.var(X)
    if sigmaType == 'Scott':
        sigma = np.mean(n ** (-1.0/(d+4) * shat))
    elif sigmaType == 'Silverman':
        sigma = np.mean(n ** (-1/(d+4))*shat*(4.0/(d+2.0))**(1.0/(d+4.0)))

    return sigma

def getSimilarityMatrix(NormalizationFlag,SimilarityFlag,filepath):
    dataset_list = []
    cwd = os.getcwd()
    for files in glob.glob(cwd +filepath+ "*.csv"):
        dataset_list.append(files)

    N = len(dataset_list)
    print N
    dataset = genfromtxt(dataset_list[1], delimiter=',')
    datasetTotal = np.zeros([1,dataset.shape[1]-1])
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

    datasetTotal = datasetTotal[1:,:]
    bw_prob = getSigma(datasetTotal,'Scott')
    print bw_prob
    Sim = np.zeros([N,N])
    for ii in range(0,N):
        dataset_ii = 'dataset' + str(ii)
        X_ii = eval(dataset_ii)
        for jj in range(0,N):
            dataset_jj = 'dataset' + str(jj)
            X_jj = eval(dataset_jj)
            if SimilarityFlag == 0:
                SimWithinSite = euclidean_distances(X_ii,X_jj)
                Sim[ii,jj] = np.linalg.norm(SimWithinSite,ord = 'fro')/(float(M.shape[0])*float(M.shape[1]))
            elif SimilarityFlag == 1:
                SimWithinSite = Kern.rbf_kernel(X_ii,X_jj,bw_prob)
                Sim[ii,jj] = np.mean(SimWithinSite)

    if SimilarityFlag == 2:
        SimFinal = np.zeros([N,N])
        for ii in range(0,N):
            dataset_ii = 'dataset' + str(ii)
            for jj in range(0,N):
                dataset_jj = 'dataset' + str(jj)
                if SimilarityFlag == 0:
                    SimFinal[ii,jj] = Sim[ii,jj]
                elif SimilarityFlag == 1:
                    expVar = Sim[i,i] + Sim[j,j] - 2*Sim[i,j]
                    SimFinal[ii,jj] = np.exp(-sim*bwFinal)
        Sim = np.copy(SimFinal)
    return Sim, datasetTotal


def getSimilarityMatrixEra(NormalizationFlag,SimilarityFlag,filepath):
    dataset_list = []
    cwd = os.getcwd()
    for files in glob.glob(cwd + filepath+"*.csv"):
        dataset_list.append(files)

    N = len(dataset_list)
    dataset = genfromtxt(dataset_list[1], delimiter=',')
    datasetTotal = np.zeros([1,dataset.shape[1]-2])
    for site in range(0,N):

        dataset_file = dataset_list[site]
        dataset = genfromtxt(dataset_file, delimiter=',')

        if len(dataset.shape) == 2:
            datasetX = dataset[:,:-2]
            datasetERA = dataset[:,-1]
            datasetID = dataset[:,-2]
        else:
            dataset = dataset[np.newaxis,:]
            datasetX = dataset[:,:-2]
            datasetERA = dataset[:,-1]
            datasetID = dataset[:,-2]

        if NormalizationFlag == 0:
            dataset_normalized = preprocessing.normalize(datasetX, norm='l2')
        elif NormalizationFlag == 1:
            dataset_normalized = preprocessing.scale(datasetX)
        elif NormalizationFlag == 2:
            min_max_scaler = preprocessing.MinMaxScaler(feature_range=(0, 1))
            dataset_normalized = min_max_scaler.fit_transform(datasetX)

        dataset_site = 'dataset' + str(site)
        exec (dataset_site + " = dataset_normalized")

        dataset_site_era = 'dataset_era' + str(site)
        exec (dataset_site_era + " = datasetERA" )

        datasetTotal = np.concatenate((datasetTotal,dataset_normalized),axis = 0)

    datasetTotal = datasetTotal[1:,:]
    bw_prob = getSigma(datasetTotal,'Scott')
    print bw_prob
    Sim = np.zeros([N,N])
    for ii in range(0,N):
        dataset_ii = 'dataset' + str(ii)
        X_iiEra = eval('dataset_era' + str(ii))
        X_ii = eval(dataset_ii)
        for jj in range(0,N):
            dataset_jj = 'dataset' + str(jj)
            X_jjEra = eval('dataset_era' + str(jj))
            X_jj = eval(dataset_jj)
            if SimilarityFlag == 0:
                SimWithinSite = euclidean_distances(X_ii,X_jj)
                Sim[ii,jj] = np.linalg.norm(SimWithinSite,ord = 'fro')/(float(M.shape[0])*float(M.shape[1]))
            elif SimilarityFlag == 1:
                SimWithinSite = Kern.rbf_kernel(X_ii,X_jj,bw_prob)
                EraSim = np.zeros([X_ii.shape[0],X_jj.shape[0]])
                for pp in range(0,X_ii.shape[0]):
                    for qq in range(0,X_jj.shape[0]):
                        EraSim[pp,qq] = np.sign(X_iiEra[pp] - X_jjEra[qq])


                Sim[ii,jj] = np.mean(SimWithinSite*EraSim)
    return Sim


