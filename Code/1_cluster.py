import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from sklearn.cluster import KMeans

from SimilaritMatrixCreation import *

# Load the dataset
filepath = "/Site_specific_data/"
NormalizationFlag = 1 # 0 is normalizing by norm, 1 is scale it, 2 is make it in between [0,1]
SimilarityFlag = 1 #0 if euclidean DISTANCE (note distance and similarity), 1 if RKHS (mean embedding) with linear kernel, 2 if RKHS with Gaussian kernel

Sim, datasetTotal = getSimilarityMatrix(NormalizationFlag,SimilarityFlag,filepath)

# Clustering, ref: http://stackoverflow.com/questions/31150982/pca-output-looks-weird-for-a-kmeans-scatter-plot
# PCA transformation:
pca_transformer = PCA(n_components=2)
X_2d = pca_transformer.fit_transform(datasetTotal)
pca_transformer.explained_variance_ratio_


# clustering using Kmeans:
estimator =  KMeans(n_clusters=5, random_state=0)
estimator.fit(X_2d)

labels = estimator.labels_


colors = ['#000000','#FFFFFF','#FF0000','#00FF00','#0000FF']
col_map=dict(zip(set(labels),colors))
label_color = [col_map[l] for l in labels]

fig, ax = plt.subplots()
ax.scatter(X_2d[:,0], X_2d[:,1], c=label_color)
ax.scatter(estimator.cluster_centers_[:,0], estimator.cluster_centers_[:,1], marker='x', s=50, c='r')