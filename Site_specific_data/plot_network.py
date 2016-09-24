
# Imports

import numpy
import matplotlib.pyplot as plt
import networkx as nx
from copy import copy



def plot_network(S,thres,matrix_type):
    low_values_indices = S < thres # Where values are low
    high_values_indices = S >= thres # Where values are high

    S_binary=copy(S)
    if matrix_type == 'dist':
        S_binary[low_values_indices] = 1 
        S_binary[high_values_indices] = 0
    elif matrix_type == 'sim':
        S_binary[low_values_indices] = 0 
        S_binary[high_values_indices] = 1

    #Draw the random graph
    g=nx.from_numpy_matrix(S_binary)
    #g_layout = nx.spring_layout(g, iterations=1000)
    #nx.draw_networkx(g, pos=g_layout, node_color='#dddddd')

    g_layout = nx.spring_layout(g, iterations=1000)
    nx.draw_networkx(g, pos=g_layout, node_color='#dddddd')


