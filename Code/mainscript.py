from SimilaritMatrixCreation import *
from plot_network import *

from mpl_toolkits.basemap import Basemap
import matplotlib.pyplot as plt

# setup Lambert Conformal basemap.
#m = Basemap(width=1200000,height=900000,projection='lcc',
#            resolution='i',lat_0=37,lon_0=25,suppress_ticks=True)


NormalizationFlag = 1 # 0 is normalizing by norm, 1 is scale it, 2 is make it in between [0,1]
SimilarityFlag = 1 #0 if euclidean DISTANCE (note distance and similarity), 1 if RKHS (mean embedding) with linear kernel, 2 if RKHS with Gaussian kernel
Sim, datasetTotal = getSimilarityMatrix(NormalizationFlag,SimilarityFlag)

SimEra = getSimilarityMatrixEra(NormalizationFlag,SimilarityFlag)

plot_network(SimEra,plot_type='geo')