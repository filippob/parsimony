do_plot = function (){
  dat = read.csv('accuracy.csv')
  do_legend=FALSE
  line_width = 2
  mycols = c('red', 'blue', 'dark green')

  plot(
    x=dat$SNP_used, y=dat$boss, 
    type='l', lwd=line_width,
    xlab='SNPs used', ylab='Prediction accuracy', col=mycols[1], 
    xlim=c(0,180), ylim=c(0.8, 1))
  lines(dat$gwas, col=mycols[2], lwd=line_width)
  lines(dat$reliefF, col=mycols[3], lwd=line_width)
  grid(col='dark grey')
  
  if (do_legend){
    legend(
      col=mycols, legend=c('BOSS', 'SNP variance', 'reliefF'), 
      x='bottomright', inset=c(0.02, 0.04), lwd=line_width)
  }
}

ratio = 6/10

pdf(file='accuracy.pdf', width=10, height=10*ratio, pointsize=16)
do_plot()
dev.off()

png(file='accuracy.png', width=591, height=591*ratio, pointsize=16)
do_plot()
dev.off()
