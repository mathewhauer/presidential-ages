###------Cross Validation-----
## @knitr CrossVal

crossval <- mutate(dat, err = (AgeAtPres_est -AgeAtPres_direct))

  mean(abs(crossval$err), na.rm=T)
  mean(crossval$err, na.rm=T)
  
quantile(abs(crossval$err), 0.5, na.rm=T)