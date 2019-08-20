import sys
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import pylab
from scanf import scanf



fni = sys.argv[1]
fno = fni.replace('.csv', '.png')
title = sys.argv[2]
num_active_blocks = float(sys.argv[3])
lna=1 # n act blk alpha

f = open(fni, 'r')
info = f.readline()
info2 = f.readline()

header = f.readline()
cols = header.split(',')

opt = []
jnam = []
ncpu = []
elap = []
elapr = []
averead = []
maxread = []
avewrite = []
maxwrite = []
averead = []
averss = []
maxrss = []

for line in f:
  dat = line.split(', ')
  opt.append(int(dat[0]))
  jnam.append(dat[1])
  ncpu.append(int(dat[2]))
  elap.append(dat[3])
  elapr.append(int(dat[4]))
  averead.append(float(scanf('%fM',dat[5])[0]))
  maxread.append(float(scanf('%fM',dat[6])[0]))
  avewrite.append(float(scanf('%fM',dat[7])[0]))
  maxwrite.append(float(scanf('%fM',dat[8])[0]))
  #averss.append(float(dat[9]))
  maxrss.append(float(scanf('%fK',dat[10])[0]))

opt = np.array(opt)
jnam = np.array(jnam)
ncpu = np.array(ncpu)
elapr = np.array(elapr)
averead = np.array(averead)
maxread = np.array(maxread)
avewrite = np.array(avewrite)
maxwrite = np.array(maxwrite)
averss = np.array(averss)
maxrss = np.array(maxrss)


# use ii to get oscillator side data
opt_ii = np.where((opt == 1) & (jnam == 'oscillator'))[0]
nopt_ii = np.where((opt == 0)  & (jnam == 'oscillator'))[0]

# use jj to get end-point side data
opt_jj = np.where((opt == 1) & (jnam == 'ADIOS1EndPoint'))[0]
nopt_jj = np.where((opt == 0)  & (jnam == 'ADIOS1EndPoint'))[0]

## validation with oliver in gnumeric
#sim_ranks = ncpu[opt_ii]
#ept_ranks = ncpu[opt_jj]
#
#rt_opt = elapr[opt_ii]
#rt_def = elapr[nopt_ii]
#
#cost_opt = elapr[opt_ii]*(ncpu[opt_ii] + ncpu[opt_jj])/3600.
#cost_def = elapr[nopt_ii]*(ncpu[nopt_ii] + ncpu[nopt_jj])/3600.
#
#sys.stderr.write('sim_ranks, ept_ranks, rt_opt, rt_def, cost_opt, cost_def\n')
#nn = len(sim_ranks)
#ii = 0;
#while ii  < nn:
#    sys.stderr.write('%g, %g, %g, %g, %g, %g\n'%(sim_ranks[ii], \
#        ept_ranks[ii], rt_opt[ii], rt_def[ii], cost_opt[ii], cost_def[ii]))
#    ii += 1


fig = plt.figure(figsize=(10,2.9))



#fig = plt.figure()
plt.subplot(1,4,1)

#plt.loglog(ncpu[opt_jj], averead[opt_jj], 'r.', linewidth=2)
plt.loglog(ncpu[opt_jj], maxread[opt_jj], 'r-', marker='.', linewidth=2)
#plt.loglog(ncpu[nopt_jj], averead[nopt_jj], 'b-.', linewidth=2)
plt.loglog(ncpu[nopt_jj], maxread[nopt_jj], 'b--', marker='.', linewidth=2)

mny, mxy = plt.ylim()
plt.plot([num_active_blocks]*2, [mny, mxy], '-', color='orange', linewidth=2, alpha=lna, zorder=0)
plt.ylim(mny, mxy)

plt.grid(True, which='both')

#plt.title('Iso-surface Haswell L=4096 M=8192')
plt.xlabel('End-point ranks', fontweight='bold')
plt.ylabel('End-point\nMax by rank read (MB)', fontweight='bold')

#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")


mxr_opt = maxread[opt_jj]
mxr_nopt = maxread[nopt_jj]
sys.stderr.write('data move ratio: %s\n'%(str(mxr_nopt/mxr_opt)))







#fig = plt.figure()
#
##plt.loglog(ncpu[opt_jj], avewrite[opt_ii], 'r-', linewidth=2)
#plt.loglog(ncpu[opt_jj], maxwrite[opt_ii], 'r-', linewidth=2)
##plt.loglog(ncpu[nopt_jj], avewrite[nopt_ii], 'b--', linewidth=2)
#plt.loglog(ncpu[nopt_jj], maxwrite[nopt_ii], 'b--', linewidth=2)
#plt.grid(True, which='both')
#
#plt.title('Iso-surface Haswell L=4096 M=8192')
#plt.xlabel('End-point ranks')
#plt.ylabel('Max Write (MB) Sim')
#
#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")






#fig = plt.figure()
plt.subplot(1,4,2)

plt.loglog(ncpu[opt_jj], maxrss[opt_jj], 'r-', marker='.', linewidth=2)
plt.loglog(ncpu[nopt_jj], maxrss[nopt_jj], 'b--', marker='.', linewidth=2)

mny, mxy = plt.ylim()
plt.plot([num_active_blocks]*2, [mny, mxy], '-', color='orange', linewidth=2, alpha=lna, zorder=0)
plt.ylim(mny, mxy)

plt.grid(True, which='both')

#plt.title('Iso-surface Haswell L=4096 M=8192')
plt.xlabel('End-point ranks', fontweight='bold')
plt.ylabel('End-point\nMax by rank RSS (KB)', fontweight='bold')


sys.stderr.write('end-point ranks: %s\n'%(str(ncpu[opt_jj])))

mxrss_opt = maxrss[opt_jj]
mxrss_nopt = maxrss[nopt_jj]
sys.stderr.write('rss ratio: %s\n'%(str(mxrss_nopt/mxrss_opt)))




plt.subplot(1,4,3)

plt.semilogx(ncpu[opt_jj], elapr[opt_ii], 'r-', marker='.', linewidth=2)
plt.semilogx(ncpu[nopt_jj], elapr[nopt_ii], 'b--', marker='.', linewidth=2)

mny, mxy = plt.ylim()
plt.plot([num_active_blocks]*2, [mny, mxy], '-', color='orange', linewidth=2, alpha=lna, zorder=0)
plt.ylim(mny, mxy)

plt.grid(True, which='both')
#plt.grid(which='minor', linestyle=':')

#plt.title('Iso-surface Haswell L=4096 M=8192')
plt.xlabel('End-point ranks', fontweight='bold')
plt.ylabel('Time to solution (sec)', fontweight='bold')

#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")

elapr_opt = maxread[opt_ii]
elapr_nopt = maxread[nopt_ii]
sys.stderr.write('elapsed time ratio: %s\n'%(str(elapr_nopt/elapr_opt)))


#fig = plt.figure()
plt.subplot(1,4,4)


cos_opt = elapr[opt_ii]*(ncpu[opt_ii] + ncpu[opt_jj])/3600.
cos_nopt = elapr[nopt_ii]*(ncpu[nopt_ii] + ncpu[nopt_jj])/3600.


plt.semilogx(ncpu[opt_jj], elapr[opt_ii]*(ncpu[opt_ii] + ncpu[opt_jj])/3600., 'r-', marker='.' , linewidth=2)
plt.semilogx(ncpu[nopt_jj], elapr[nopt_ii]*(ncpu[nopt_ii] + ncpu[nopt_jj])/3600., 'b--', marker='.', linewidth=2)

mny, mxy = plt.ylim()
plt.plot([num_active_blocks]*2, [mny, mxy], '-', color='orange', linewidth=2, alpha=lna, zorder=0)
plt.ylim(mny, mxy)

plt.grid(True, which='both')

#plt.title('Iso-surface Haswell L=4096 M=8192')
plt.xlabel('End-point ranks', fontweight='bold')
plt.ylabel('Total cost (CPU Hours)', fontweight='bold')

#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")

mxr_opt = maxread[opt_jj]
mxr_nopt = maxread[nopt_jj]
sys.stderr.write('solution cost ratio: %s\n'%(str(mxr_nopt/mxr_opt)))





plt.legend(['opt. part','default']) #,loc='upper left', bbox_to_anchor=(1,1))


plt.suptitle(title, fontweight='bold')
plt.subplots_adjust(left=0.08, right=0.98, wspace=0.55, bottom=0.18)

plt.savefig(fno, dpi=200)



fm  = pylab.get_current_fig_manager()
fm.window.wm_geometry("+500+0")
plt.show()



#fig = plt.figure()
#
#plt.loglog(ncpu[opt_jj], averss[opt_ii], 'r-', linewidth=2)
#plt.loglog(ncpu[nopt_jj], averss[nopt_ii], 'b--', linewidth=2)
#plt.grid(True, which='both')
#
#plt.title('Iso-surface Haswell L=4096 M=8192')
#plt.xlabel('End-point ranks')
#plt.ylabel('Max RSS Sim (KB)')
#
#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")
#plt.show()











# This import registers the 3D projection, but is otherwise unused.
from mpl_toolkits.mplot3d import Axes3D  # noqa: F401 unused import

import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import numpy as np


fig = plt.figure()
ax = fig.gca(projection='3d')

# Make data.
X = elapr_nopt

xx = elapr_nopt*(ncpu[opt_ii] + ncpu[opt_jj])/3600.
Y = mxr_nopt
X, Y = np.meshgrid(X, Y)
Q = X*xx
Z = Q/np.max(Q) + Y/np.max(Y)

# Plot the surface.
surf = ax.plot_surface(X, Y, Z, cmap=cm.coolwarm,
                       linewidth=0, antialiased=False)


# Add a color bar which maps values to colors.
fig.colorbar(surf, shrink=0.5, aspect=5)

plt.show()




