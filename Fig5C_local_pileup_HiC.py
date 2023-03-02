import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import multiprocess as mp
import bioframe
import cooler
import itertools
import click
import cooltools
import cooltools.eigdecomp
import cooltools.expected
import cooltools.saddle
from dask.distributed import Client, LocalCluster
from scipy.linalg import toeplitz
import scipy.ndimage
import fnmatch
import os

obsmin= 0.8
obsmax= 1.2
        
for file in os.listdir('.'):
    if fnmatch.fnmatch(file, '*.txt'):
        pileupfile=file
        prefix=pileupfile.split('.')[0]
        mat=np.loadtxt(pileupfile)

        scale='linear'
        dpi= 300
        colormap='coolwarm'
        
        pdfout=prefix+'_'+ str(obsmin) + '_'+ str(obsmax) +'.pdf'
        pngout=prefix+'_'+ str(obsmin) + '_'+ str(obsmax) +'.png'

        plt.figure(figsize=(10,10))
        plt.gcf().canvas.set_window_title("pileup".format())
        plt.title("loop pileup")
        plt.imshow(mat, interpolation="none", vmin=obsmin,vmax=obsmax, cmap=colormap)

        cb = plt.colorbar()
        cb.set_label({"linear": "relative contact frequency",
            "log2": "log 2 ( relative contact frequency )",
            "log10": "log 10 ( relative contact frequency )",
            }[scale])
        plt.savefig(pdfout, dpi=dpi, format='pdf')
        plt.savefig(pngout, dpi=dpi, format='png')
        plt.close()
