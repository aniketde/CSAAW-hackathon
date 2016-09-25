from SimilaritMatrixCreation import *
from plot_network import *

from mpl_toolkits.basemap import Basemap
import matplotlib.pyplot as plt

# setup Lambert Conformal basemap.
#m = Basemap(width=1200000,height=900000,projection='lcc',
#            resolution='i',lat_0=37,lon_0=25,suppress_ticks=True)


NormalizationFlag = 1 # 0 is normalizing by norm, 1 is scale it, 2 is make it in between [0,1]
SimilarityFlag = 1 #0 if euclidean DISTANCE (note distance and similarity), 1 if RKHS (mean embedding) with linear kernel, 2 if RKHS with Gaussian kernel

timeline = "1050_on_ward"
if timeline == "All_filtered":
	filepath = "/Site_specific_data/"
elif timeline == "1050_on_ward":
	filepath = "/Site_Specific_data_Truncated_by_ERA/1050_on_ward/"
elif timeline == "1199_1050":
	filepath = "/Site_Specific_data_Truncated_by_ERA/1199_1050/"
elif timeline == "1299_1200":
	filepath = "/Site_Specific_data_Truncated_by_ERA/1299_1200/"
elif timeline == "1399_1300":
	filepath = "/Site_Specific_data_Truncated_by_ERA/1399_1300/"
elif timeline == "4000_1400":
	filepath = "/Site_Specific_data_Truncated_by_ERA/4000_1400/"


Sim, datasetTotal = getSimilarityMatrix(NormalizationFlag,SimilarityFlag,filepath)


filepath = "/Site_specific_data_with_ERA/"
SimEra = getSimilarityMatrixEra(NormalizationFlag,SimilarityFlag,filepath)

plot_network(Sim,plot_type='geo',timeline=timeline)
