from SimilaritMatrixCreation import *
from plot_network import *
from plot_era_network import *
import numpy as np
#from mpl_toolkits.basemap import Basemap
import matplotlib.pyplot as plt

def network_for_era(timeline):
    
    # setup Lambert Conformal basemap.
    #m = Basemap(width=1200000,height=900000,projection='lcc',
    #            resolution='i',lat_0=37,lon_0=25,suppress_ticks=True)


    NormalizationFlag = 1 # 0 is normalizing by norm, 1 is scale it, 2 is make it in between [0,1]
    SimilarityFlag = 1 #0 if euclidean DISTANCE (note distance and similarity), 1 if RKHS (mean embedding) with linear kernel, 2 if RKHS with Gaussian kernel
    

    
    if timeline == "All_filtered":
   	filepath = "/Site_specific_data/"
   	thres=10**(-4.5)
    elif timeline == "1050_on_ward":
   	filepath = "/Site_Specific_data_Truncated_by_ERA/1050_on_ward/"
   	thres=10**(-5)
    elif timeline == "1199_1050":
   	filepath = "/Site_Specific_data_Truncated_by_ERA/1199_1050/"
   	thres=10**(-5)
    elif timeline == "1299_1200":
   	filepath = "/Site_Specific_data_Truncated_by_ERA/1299_1200/"
   	thres=10**(-5)
    elif timeline == "1399_1300":
   	filepath = "/Site_Specific_data_Truncated_by_ERA/1399_1300/"
   	thres=10**(-5)
    elif timeline == "4000_1400":
   	filepath = "/Site_Specific_data_Truncated_by_ERA/4000_1400/"
   	thres=10**(-5)
    
    
    Sim, datasetTotal = getSimilarityMatrix(NormalizationFlag,SimilarityFlag,filepath)
    
    Sim1 = np.log(Sim)/np.log(10)
    X = Sim1.ravel()
    n, bins, patches = plt.hist(X, 100, facecolor='g', alpha=0.75)
    #
    plt.title('Histogram of sim')
    plt.grid(True)
    plt.savefig('hist_'+timeline+'.png')
    
    
    filepath = "/Site_specific_data_with_ERA/"
    SimEra = getSimilarityMatrixEra(NormalizationFlag,SimilarityFlag,filepath)
    print SimEra
    S_direction=np.zeros([SimEra.shape[0],SimEra.shape[1]])
    S_direction[SimEra > 10**(-4.5) ]=1
    S_direction[SimEra<= -10**(-4.5)]=-1
    print S_direction
    #plot_network(Sim,plot_type='geo',timeline=timeline,thres=thres,label_type='numbers')
    plot_era_network(abs(SimEra),plot_type='plain',timeline=timeline,thres=thres,label_type='names')
    #plot_network(S_direction,plot_type='geo',timeline=timeline,thres=thres,label_type='numbers')