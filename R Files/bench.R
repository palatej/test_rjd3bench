library(rjd3bench)

sy<-rjd3toolkit::aggregate(retail$BuildingMatAndSuppliesDealers, nfreq=1)
sm1<-denton(retail$BookStores, sy, mul=T)
sm2<-cholette(retail$BuildingMatAndGardenEquipAndSupp, sy, lambda = 0)
sm3bis<-cholette(3*retail$BookStores, window(sy, end=2008), lambda = 0.98, bias = "None")

sm4<-grp(retail$BuildingMatAndGardenEquipAndSupp, sy)
sm5<-cubicspline(retail$BuildingMatAndGardenEquipAndSupp, conversion="Sum", sy)


ts.plot(sm1, sm2, sm3bis, sm4, sm5, col=c("red", "blue", "gray", "green", "magenta"))

print(summary(rjd3toolkit::aggregate(sm1, nfreq=1)-sy))
print(summary(rjd3toolkit::aggregate(sm2, nfreq=1)-sy))
print(summary(rjd3toolkit::aggregate(sm3bis, nfreq=1)-sy))
print(summary(rjd3toolkit::aggregate(sm4, nfreq=1)-sy))
