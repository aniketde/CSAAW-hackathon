import numpy as np
import matplotlib.pyplot as plt

Sim1 = np.log(Sim)/np.log(10)
X = Sim1.ravel()
n, bins, patches = plt.hist(X, 100, facecolor='g', alpha=0.75)

plt.title('Histogram of sim')
plt.grid(True)
plt.show()
