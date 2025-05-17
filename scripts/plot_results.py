import numpy as np
import matplotlib.pyplot as plt

bands = np.loadtxt('../data/bands.dat')
dos = np.loadtxt('../data/dos.dat')

fig, (ax1, ax2) = plt.subplots(1,2, figsize=(10,4))

ax1.plot(bands[:,0], bands[:,1:], '-k')
ax1.set_xlabel('k-path')
ax1.set_ylabel('Energy (eV)')
ax1.set_title('Band structure')

ax2.plot(dos[:,0], dos[:,1])
ax2.set_xlabel('Energy (eV)')
ax2.set_ylabel('DOS')
ax2.set_title('Density of States')

plt.tight_layout()
plt.show()
