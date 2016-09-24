from SimilaritMatrixCreation import *
from plot_network import *
import csv




thres=0.04
matrix_type='dist'

NormalizationFlag = 1 # 0 is normalizing by norm, 1 is scale it, 2 is make it in between [0,1]
SimilarityFlag = 1 #0 if euclidean DISTANCE (note distance and similarity), 1 if RKHS (mean embedding) with linear kernel, 2 if RKHS with Gaussian kernel
Sim = getSimilarityMatrix(NormalizationFlag,SimilarityFlag)


with open('coordinates.csv', mode='r') as infile:
    reader = csv.reader(infile)
    next(reader, None)  # skip the headers
    mydict = {rows[3]:(float(rows[1]),float(rows[2])) for rows in reader}
    names=[rows[3] for rows in reader ]

#Sim
#plot_network(Sim,pos,thres,matrix_type)


