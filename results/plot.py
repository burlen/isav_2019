import sys
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import pylab
from scanf import scanf



fni = sys.argv[1]
title = sys.argv[2]
fno = fni.replace('.csv', '.png')


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
  averss.append(float(dat[9]))
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



fig = plt.figure(figsize=(10,3.25))
plt.subplot(1,4,1)

plt.loglog(ncpu[opt_jj], elapr[opt_ii], 'r-', linewidth=2)
plt.loglog(ncpu[nopt_jj], elapr[nopt_ii], 'b--', linewidth=2)
plt.grid(True, which='both')
#plt.grid(which='minor', linestyle=':')

#plt.title('Iso-surface Haswell L=4096 M=8192')
plt.xlabel('NCPU End-point', fontweight='bold')
plt.ylabel('Time to solution (sec)', fontweight='bold')

#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")



#fig = plt.figure()
plt.subplot(1,4,2)

plt.semilogx(ncpu[opt_jj], elapr[opt_ii]*(ncpu[opt_ii] + ncpu[opt_jj])/3600., 'r-', linewidth=2)
plt.semilogx(ncpu[nopt_jj], elapr[nopt_ii]*(ncpu[nopt_ii] + ncpu[nopt_jj])/3600., 'b--', linewidth=2)
plt.grid(True, which='both')

#plt.title('Iso-surface Haswell L=4096 M=8192')
plt.xlabel('NCPU End-point', fontweight='bold')
plt.ylabel('Cost (CPU Hours)', fontweight='bold')

#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")





#fig = plt.figure()
plt.subplot(1,4,3)

#plt.loglog(ncpu[opt_jj], averead[opt_jj], 'r.', linewidth=2)
plt.loglog(ncpu[opt_jj], maxread[opt_jj], 'r-', linewidth=2)
#plt.loglog(ncpu[nopt_jj], averead[nopt_jj], 'b-.', linewidth=2)
plt.loglog(ncpu[nopt_jj], maxread[nopt_jj], 'b--', linewidth=2)
plt.grid(True, which='both')

#plt.title('Iso-surface Haswell L=4096 M=8192')
plt.xlabel('NCPU End-point', fontweight='bold')
plt.ylabel('Max Read (MB) End-point', fontweight='bold')

#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")



#fig = plt.figure()
#
##plt.loglog(ncpu[opt_jj], avewrite[opt_ii], 'r-', linewidth=2)
#plt.loglog(ncpu[opt_jj], maxwrite[opt_ii], 'r-', linewidth=2)
##plt.loglog(ncpu[nopt_jj], avewrite[nopt_ii], 'b--', linewidth=2)
#plt.loglog(ncpu[nopt_jj], maxwrite[nopt_ii], 'b--', linewidth=2)
#plt.grid(True, which='both')
#
#plt.title('Iso-surface Haswell L=4096 M=8192')
#plt.xlabel('NCPU End-point')
#plt.ylabel('Max Write (MB) Sim')
#
#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")






#fig = plt.figure()
plt.subplot(1,4,4)

plt.loglog(ncpu[opt_jj], maxrss[opt_jj], 'r-', linewidth=2)
plt.loglog(ncpu[nopt_jj], maxrss[nopt_jj], 'b--', linewidth=2)
plt.grid(True, which='both')

#plt.title('Iso-surface Haswell L=4096 M=8192')
plt.xlabel('NCPU End-point', fontweight='bold')
plt.ylabel('Max RSS End-point (KB)', fontweight='bold')

plt.legend(['opt. part','default']) #,loc='upper left', bbox_to_anchor=(1,1))


plt.suptitle(title, fontweight='bold')
plt.subplots_adjust(left=0.1, right=0.95, wspace=0.55, bottom=0.15)

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
#plt.xlabel('NCPU End-point')
#plt.ylabel('Max RSS Sim (KB)')
#
#fm  = pylab.get_current_fig_manager()
#fm.window.wm_geometry("+500+0")
#plt.show()
















