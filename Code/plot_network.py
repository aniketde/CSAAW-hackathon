
# Imports

import numpy
import matplotlib.pyplot as plt
import networkx as nx
from copy import copy
from mpl_toolkits.basemap import Basemap
import csv

def plot_network(Sim,plot_type='geo',thres=10**(-5),timeline="All_filtered",label_type='names'):

    matrix_type='sim'
    
    low_values_indices = Sim < thres # Where values are low
    high_values_indices = Sim >= thres # Where values are high
    
    S_binary=copy(Sim)
    if matrix_type == 'dist':
        S_binary[low_values_indices] = 1 
        S_binary[high_values_indices] = 0
    elif matrix_type == 'sim':
        S_binary[low_values_indices] = 0 
        S_binary[high_values_indices] = 1
    
    print S_binary
    #Draw the random graph
    g=nx.from_numpy_matrix(S_binary)
    #Sim
    plt.figure()
    zoomparameter = 1
    if plot_type=='geo':
        if zoomparameter == 1:
            m = Basemap(
                projection='merc',
                llcrnrlon=18,
                llcrnrlat=33,
                urcrnrlon=35,
                urcrnrlat=40,
                lat_ts=0,
                resolution='f',
                suppress_ticks=True)
            
        elif zoomparameter ==2:
                
            #        
            m = Basemap(
                projection='merc',
                llcrnrlon=21,
                llcrnrlat=34.5,
                urcrnrlon=24.5,
                urcrnrlat=38.7,
                lat_ts=0,
                resolution='i',
                suppress_ticks=True)
        elif zoomparameter == 3:
            #        
            m = Basemap(
                projection='merc',
                llcrnrlon=22,
                llcrnrlat=37.25,
                urcrnrlon=23.5,
                urcrnrlat=38.25,
                lat_ts=0,
                resolution='i',
                suppress_ticks=True)

    
        with open('coordinates_'+timeline+'.csv', mode='r') as infile:
            reader = csv.reader(infile)
            next(reader, None)  # skip the headers
            positions={}
            names={}
            mapping={}
            count=0
            for rows in reader:
                mx,my=m(float(rows[2]),float(rows[1]))
                positions.update({int(rows[0]):(mx,my)})
                names.update({int(rows[0]):rows[3]})
                mapping.update({count: int(rows[0])})
                count +=1

        g=nx.relabel_nodes(g,mapping) 
        if label_type=='names':     
            nx.draw_networkx(g, pos=positions,labels=names,node_size=5,node_color='#dddddd',edge_color='b')
        elif label_type=='numbers':
            nx.draw_networkx(g, pos=positions,node_color='#dddddd',edge_color='b')

        # draw coastlines.
        #m.drawcoastlines()
        # draw a boundary around the map, fill the background.
        # this background will end up being the ocean color, since
        # the continents will be drawn on top.
        #m.drawmapboundary(fill_color='aqua')
        #m.fillcontinents(color='coral',lake_color='aqua')
        #m.drawcountries()
        #m.drawstates()
        #m.bluemarble()
        m.shadedrelief()
        #m.etopo()
        #m.drawlsmask(land_color='coral',ocean_color='aqua',lakes=True)

    elif plot_type=='plain':

        
        with open('coordinates_'+timeline+'.csv', mode='r') as infile:
            reader = csv.reader(infile)
            next(reader, None)  # skip the headers
            names={}
            mapping={}
            count=0
            for rows in reader:
                names.update({int(rows[0]):rows[3]})
                mapping.update({count: int(rows[0])})
                count +=1
             
            print names
            print mapping
                 
        g=nx.relabel_nodes(g,mapping) 
        positions = nx.spring_layout(g, iterations=1000)   
        if label_type=='names':     
            nx.draw_networkx(g, pos=positions,labels=names,node_size=5,node_color='#dddddd',edge_color='b')
        elif label_type=='numbers':
            nx.draw_networkx(g, pos=positions,node_color='#dddddd',edge_color='b')

    plt.savefig(timeline+'_'+plot_type+'.png')

