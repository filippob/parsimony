dat = read.csv('accuracy.csv')

line_width = 2
mycols = c('red', 'blue', 'dark green')
plot(
  x=dat$SNP_used, y=dat$boss, 
  type='l', lwd=line_width,
  main='accuracy for different rankers', xlab='SNPs used', ylab='', col=mycols[1], 
  xlim=c(0,180), ylim=c(0.75, 1))
lines(dat$gwas, col=mycols[2], lwd=line_width)
lines(dat$reliefF, col=mycols[3], lwd=line_width)

legend(
  col=mycols, legend=c('BOSS', 'logit', 'reliefF'), 
  x='bottomright', inset=300, lwd=line_width)

