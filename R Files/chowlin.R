library(rjd3bench)

#read data
X<-read.csv('./Data/x_europe.csv')

fr<-ts(X$France, frequency = 12, start=c(1995,1))
uk<-ts(X$Royaume.Uni, frequency = 12, start=c(1995,1))
eu<-ts(X$Union.europeenne, frequency = 12, start=c(1995,1))

EU<-rjd3toolkit::aggregate(eu,1)

#temporal disaggregation of EU using fr

# Chow-Lin
fr_chowlin<-rjd3bench::temporaldisaggregation (EU, indicators = fr)
fr_chowlin2<-rjd3bench::temporaldisaggregation(EU, indicators = list(fr, uk))

eu_e<-fr_chowlin$estimation$disagg
eu_stde<-fr_chowlin$estimation$edisagg

plot(ts.union(eu, eu_e), plot.type = "single", type="l",lwd=c(3,1), col=c("gray", "black"))


plot(ts.union(eu_e-2*eu_stde, eu_e+2*eu_stde, eu_e), plot.type = "single", type="l", col=c("gray", "gray","blue" ))
plot(eu_stde)

print(fr_chowlin)
print(fr_chowlin2)
