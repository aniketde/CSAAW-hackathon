

from SimilaritMatrixCreation import *
from plot_network import *
import numpy as np
from mpl_toolkits.basemap import Basemap
import matplotlib.pyplot as plt
filepath = "/Site_specific_data_with_ERA/"


NormalizationFlag = 1 # 0 is normalizing by norm, 1 is scale it, 2 is make it in between [0,1]
SimilarityFlag = 1 #0 if euclidean DISTANCE (note distance and similarity), 1 if RKHS (mean embedding) with linear kernel, 2 if RKHS with Gaussian kernel
    


SimEra = getSimilarityMatrixEra(NormalizationFlag,SimilarityFlag,filepath)
    
plot_network(abs(SimEra),plot_type='plain',label_type='numbers')