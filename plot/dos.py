import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('dos.dat')
E = data[:,0]
D = data[:,1]
plt.figure()
plt.plot(E,D)
plt.xlabel('Energy (eV)')
plt.ylabel('DOS (arb. units)')
plt.tight_layout()
plt.savefig('dos.png')
