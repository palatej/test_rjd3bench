library(rjd3bench)


sy<-aggregate(retail$BuildingMatAndSuppliesDealers, nfreq=1)
chowlin<-rjd3bench::temporaldisaggregation(sy, indicators = list(retail$BuildingMatAndGardenEquipAndSupp), rho.truncated = 0)
fernandez<-rjd3bench::temporaldisaggregation(sy, indicators = list(retail$BuildingMatAndGardenEquipAndSupp), model="Rw")
litterman<-rjd3bench::temporaldisaggregation(sy, indicators = list(retail$BuildingMatAndGardenEquipAndSupp), model="RwAr1")
modeli<-rjd3bench::temporaldisaggregation2(sy, indicator=retail$BuildingMatAndGardenEquipAndSupp, rho = 0.8)

sm1<-chowlin$estimation$disagg
sm2<-fernandez$estimation$disagg
sm3<-litterman$estimation$disagg

ts.plot(sm1, sm2, sm3, modeli, col=c("red", "blue", "gray", "magenta"))


summary(chowlin)
summary(fernandez)
summary(litterman)

