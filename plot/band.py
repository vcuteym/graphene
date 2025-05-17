import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('band.dat')
ks = data[:,0]
E1 = data[:,1]
E2 = data[:,2]
plt.figure()
plt.plot(ks,E1,label='Band 1')
plt.plot(ks,E2,label='Band 2')
plt.xlabel('k-path index')
plt.ylabel('Energy (eV)')
plt.legend()
plt.tight_layout()
plt.savefig('band.png')
