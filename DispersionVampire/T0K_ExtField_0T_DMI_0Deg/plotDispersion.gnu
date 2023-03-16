# Gnuplot script for mapping NCI color code over NCI diagrams
set terminal jpeg size 1200,1200 enhanced
set encoding utf8
set output "DensityPlotDispersion.jpg"
set pm3d map interpolate 1,1
set pm3d depthorder
set xlabel 'Symmetry points]'
set ylabel 'om [eV]'
# Define a color gradient palette used by pm3d
set palette defined (-0.04 "#FFFFFF",0.00 "#880088", 0.04 "#000000")
set format y "%.3f"
set format x "%.1f"
set format cb "%.1f"
set border lw 4
set xtics ("2X" -1,"K" -0.66666, "X" -0.5, "P" -0.33333, "Gamma" 0, "P" 0.33333, "X" 0.5, "K" 0.66666, "2X" 1)
set ytic -0.05,0.005,0.05 mirror
# set the color bar tics
set cbtic 0,5,25 nomirror
set xrange [-1:1]
# y range [0, h_plack*coulomb/PI/timestep=0.0413612], timestep = 5*10^-16
freq_limit = 0.0413612
set yrange [-freq_limit:freq_limit]
set zrange [0.0:20.0]
set cbrange [7.0:20]
set view map
set hidden3d front
n_xsteps=800
n_tsteps=1200
splot 'FFT.csv' matrix using ((2*$1/n_xsteps-1)):(2*freq_limit*($2/n_tsteps-0.5)):3 t "Simulation - VAMPIRE" with pm3d,\
