library(rjd3bench)
library(RJDemetra3)

m<-read.csv("./Data/exports.csv")
direct<-ts(data = rowSums(m), frequency = 12, start=c(1995, 1))
sa<-rjd3x13::fast.x13(direct)
sadirect<-sa$final$d11final

dic<-list()
dic[["y"]]<-sadirect

saindirect<-NULL
for (i in 1:dim(m)[2]){
    y<-ts(m[,i], frequency = 12, start=c(1995, 1))
  say<-rjd3x13::fast.x13(y)$final$d11final
  
  if (! is.null(saindirect))
    saindirect<-saindirect+say
  else
    saindirect<-say
  name<-paste("s", i, sep="")
  dic[[name]]<-say
}

ts.plot(sadirect, saindirect, col=c("red", "blue"))
spec.ar(sadirect-saindirect, order=30)

dic[["y1"]]<-rjd3toolkit::aggregate(ts(m[,1], frequency=12, start=c(1995,1)))

tc=c("y1=sum(s1)")
cc=c("0=y-s1-s2")
bench<-rjd3bench::multivariatecholette(dic, tcvector = tc, ccvector=cc, rho = .8, lambda=.9)

ts.plot(dic[["s2"]], bench[["s2"]], col=c("blue", "red"))

