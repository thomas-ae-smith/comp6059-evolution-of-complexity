# basic output settings
set terminal postscript eps
set output '| epstopdf --filter --outfile=plot.pdf'

#function setup
sum(x, y) = x + y

#canvas setup
set size 1.0, 0.5
set origin 0.0, 0.0
set multiplot

#style setup
set xtics scale 0.5
set ytics scale 0.5 0, 0.2
set style line 1 lt 1 lw 4 pt 3 lc rgb "grey"
set style line 2 lt 4 lw 4 pt 3 lc rgb "grey"
set style line 3 lt 1 lw 4 pt 3
set style line 4 lt 4 lw 4 pt 3

#aggregate plot setup
set size 0.5, 0.5
set origin 0.0, 0.0

#aggregate details
set xlabel "Generation"
set ylabel "Global frequency"
set key at graph 1.1, 0.9 Left reverse samplen 1
plot "individual.dat" using (sum($1, $2)) title 'Large group size' w l ls 4, \
	 ""				  using (sum($2, $4)) title 'Selfish resource usage' w l ls 1


#individual plot setup
set size 0.5, 0.5
set origin 0.5, 0.0

#individual details
set xlabel "Generation"
set ylabel "Global genotype frequency"
set key at graph 1.1, 0.7 Left reverse samplen 1
plot "individual.dat" using 3 title 'Cooperative + small' w l ls 1, \
	 ""				 using 1 title 'Cooperative + large' w l ls 2, \
	 ""				 using 4 title 'Selfish + small' w l ls 3, \
	 ""				 using 2 title 'Selfish + large' w l ls 4

#canvas finishing
unset multiplot