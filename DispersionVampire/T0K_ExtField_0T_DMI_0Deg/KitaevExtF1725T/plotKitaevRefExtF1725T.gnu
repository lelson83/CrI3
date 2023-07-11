# Gnuplot script for mapping NCI color code over NCI diagrams
set terminal jpeg size 1600,1200 enhanced
set encoding utf8
set output "KitaevExtF1725T.jpg"
set pm3d map interpolate 1,1
set pm3d depthorder
set xlabel 'k - momentum vector' font ",25" offset 0,-3,0
set ylabel 'ω[eV]' font ",25" offset -5,0,0
# Define a color gradient palette used by pm3d
set palette defined (-0.04 "#042333",0.00 "#de7065", 0.04 "#e8fa5b")
set format y "%.3f"
set format x "%.1f"
#set format cb "%.1f"
set border lw 4
set xtics ("Γ" 0, "M" 1, "K" 2, "K'" 3, "Γ" 4)
set ytic -0.05,0.005,0.05 mirror
set tics font ",20"
# set the color bar tics
set cbtic 0,100,500 nomirror
set xrange [-0*1:4]
# y range [0, h_plack*coulomb/PI/timestep=0.0413612], timestep = 5*10^-16
freq_limit = 0.0413612
set yrange [-0*freq_limit:0.03]
set zrange [0.0:500]
set cbrange [0:500]
set view map
set hidden3d front
n_xsteps=300
n_tsteps=600
splot 'FFT_G-M.csv' matrix using (($1/n_xsteps)):(2*freq_limit*($2/n_tsteps-0.5)):3 t "Simulation - VAMPIRE" with pm3d,\
'FFT_M-K.csv' matrix using ((1+$1/n_xsteps)):(2*freq_limit*($2/n_tsteps-0.5)):3 with pm3d,\
'FFT_K-Kp.csv' matrix using ((2+$1/n_xsteps)):(2*freq_limit*($2/n_tsteps-0.5)):3 with pm3d,\
'FFT_Kp-G.csv' matrix using ((3+$1/n_xsteps)):(2*freq_limit*($2/n_tsteps-0.5)):3 with pm3d,\
