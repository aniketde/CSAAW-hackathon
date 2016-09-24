
# Imports

import numpy
import matplotlib.pyplot as plt
import networkx as nx
from copy import copy
from mpl_toolkits.basemap import Basemap
import csv

def plot_network(Sim,plot_type='geo'):
    thres=1e-3
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
    
    #Draw the random graph
    g=nx.from_numpy_matrix(S_binary)
    #Sim
    plt.figure()
    
    if plot_type=='geo':
        m = Basemap(
            projection='merc',
            llcrnrlon=18,
            llcrnrlat=33,
            urcrnrlon=35,
            urcrnrlat=40,
            lat_ts=0,
            resolution='i',
            suppress_ticks=True)
            
            
            
        #        
        m = Basemap(
            projection='merc',
            llcrnrlon=21,
            llcrnrlat=34.5,
            urcrnrlon=24.5,
            urcrnrlat=38.7,
            lat_ts=0,
            resolution='h',
            suppress_ticks=True)
        #        
        #m = Basemap(
        #    projection='merc',
        #    llcrnrlon=22,
        #    llcrnrlat=37.25,
        #    urcrnrlon=23.5,
        #    urcrnrlat=38.25,
        #    lat_ts=0,
        #    resolution='i',
        #    suppress_ticks=True)

    
        with open('coordinates.csv', mode='r') as infile:
            reader = csv.reader(infile)
            next(reader, None)  # skip the headers
            positions={}
            names={}
            for rows in reader:
            
                mx,my=m(float(rows[2]),float(rows[1]))
                positions.update({int(rows[0]):(mx,my)})
                names.update({int(rows[0]):rows[3]})
                
        nx.draw_networkx(g, pos=positions,labels=names,node_size=5,node_color='#dddddd',edge_color='b')

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
        m.drawlsmask(land_color='coral',ocean_color='aqua',lakes=True)

    elif plot_type=='plain':
        #Draw the random graph
        positions = nx.spring_layout(g, iterations=1000)

        nx.draw_networkx(g, pos=positions,node_color='#dddddd',edge_color='b',arrows=True)
    
    
  
    
    plt.show()

