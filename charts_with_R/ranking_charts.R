#this is important, all function look for "dat" objtect
dat = read.csv('ranking.csv')

########### RANK VARIATION CHARTS ###########
do_plot = function (series1, series2, filename){
  line_width = 2
  mycols = c('blue', 'red')
  #the ratio of exported image dimensions
  ratio = 6/10
  
  #we export two images, a pdf and a png
  pdf(file=paste(sep='', filename, '.pdf'), width=10, height=10*ratio, pointsize=16)
  plot(
    x=1:175,
    y=series1, 
    type='l', lwd=line_width,
    xlab='SNP number', ylab='Change in rank', col=mycols[1], 
    xlim=c(0,180))
  if (!is.null(series2)){
    lines(series2, col=mycols[2], lwd=line_width)
  }
  grid(col='dark grey')
  dev.off()
  
  png(file=paste(sep='', filename, '.png'), width=591, height=591*ratio, pointsize=16)
  plot(
    x=1:175,
    y=series1, 
    type='l', lwd=line_width,
    xlab='SNP number', ylab='Change in rank', col=mycols[1], 
    xlim=c(0,180))
  if (!is.null(series2)){
    lines(series2, col=mycols[2], lwd=line_width)
  }
  grid(col='dark grey')
  dev.off()
}

#examining GWAS -> BOSS
#computing cumulative variance
stdev = matrix(ncol=1, nrow=174)
for (i in 2:175){
  stdev[i-1] = sd(dat$GWAS..BOSS[1:i])
}
#and plotting it together with snp change
do_plot(dat$GWAS..BOSS, stdev, 'SNP_variance-BOSS')

#same thing on gain ratio -> BOSS
#computing cumulative variance
stdev = matrix(ncol=1, nrow=174)
for (i in 2:175){
  stdev[i-1] = sd(dat$GainRatio..BOSS[1:i])
}
#and plotting it together with snp change
do_plot(dat$GainRatio..BOSS, stdev, 'Gain_Ratio-BOSS')

############ SPEARMAN CORRELATION MATRIX #############
#quick function for spearman correlation calculation, given our
#particular ranking representation
spearmanCorr = function (data1, data2){
  elems = length(data1)[1] 
  res = matrix(nrow=elems)
  for (i in 1:elems){
    res[i] = which(data2==data1[i]) - i
  }
  res = sum(res * res) * 6
  res = res / (elems * (elems*elems - 1))
  
  return (1-res)
}

spears_BOSS = data.frame(
  BOSS = spearmanCorr(dat$BOSS, dat$BOSS),
  SNP_variance = spearmanCorr(dat$BOSS, dat$GWAS),
  gain_ratio = spearmanCorr(dat$BOSS, dat$GainRatio_10_fold)
)
spears_GWAS = data.frame(
  BOSS = spearmanCorr(dat$GWAS, dat$BOSS),
  SNP_variance = spearmanCorr(dat$GWAS, dat$GWAS),
  gain_ratio = spearmanCorr(dat$GWAS, dat$GainRatio_10_fold)
)
spears_gain = data.frame(
  BOSS = spearmanCorr(dat$GainRatio_10_fold, dat$BOSS),
  SNP_variance = spearmanCorr(dat$GainRatio_10_fold, dat$GWAS),
  gain_ratio = spearmanCorr(dat$GainRatio_10_fold, dat$GainRatio_10_fold)
)

spears = rbind(spears_BOSS, spears_GWAS, spears_gain)
rownames(spears) = c('BOSS', 'SNP_variance', 'gain_ratio')

write.table(x=spears, 'spearman_correlations.txt')
