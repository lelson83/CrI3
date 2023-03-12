set terminal jpeg size 1200,800
set output 'plotCrI3MsVsT.jpg'
set ylabel "M[a.u]"
set xlabel "T[K]"
set xzeroaxis

plot [0:60] [-0.1:1.0] \
"CrI3_NNNN_BQ_DMI/output" u 2:($6) w l t "NNNN+BQ+DMI",\

set output



