# basic output settings
set terminal postscript eps
set output '| epstopdf --filter --outfile=plot.pdf'

#canvas setup
set size 1.0, 2.0
set origin 0.0, 0.0
set multiplot

#aggregate plot setup
set size 1.0, 1.0
set origin 0.0, 0.0

#aggregate details
set xlabel "Generation"
set ylabel "Global frequency"
plot "aggregate.dat" with lines


#individual plot setup
set size 1.0, 1.0
set origin 1.0, 0.0

#individual details
set xlabel "Generation"
set ylabel "Global genotype frequency"
plot "individual.dat" with lines

#canvas finishing
unset multiplot