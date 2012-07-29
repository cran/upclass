.packageName <- 'upclass'

plot.upclassfit <- function (x, ...) # not sure
{
  if (attr(x, "class") != "upclassfit") 
    stop("Incorrect class")
  z<-x$test$z
  G<-x$G
  Ntrain<-x$Ntrain
  Ntest<-x$Ntest
  Nobs<-Ntrain+Ntest
  image(1:G,1:Ntest,t(z[Ntest:1,]),axes=FALSE, main="Goodness of fit for Test data",col=heat.colors(12),xlab="",ylab="")
  #axis(1,at=1:G,labels=1:G)
  axis(1,at=1:G,labels=1:G)
  mtext("Groups", side=1, line=3)
  axis(2,at=seq(Ntest,20,by=-20),labels=seq(20,Ntest,by=20), las=TRUE)  
  mtext("Observations", side=2,las=FALSE,line=3)
}
