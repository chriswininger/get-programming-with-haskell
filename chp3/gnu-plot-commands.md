Command to Run Inside Gnuplot
-------------------------------

`set dgrid3d 30,30`
`filenames="sqr-sum.dat sum-sqr.dat"`
`splot for [file in filenames] file using 1:2:3 with lines title file`


