library(rjd3bench)

sy<-rjd3toolkit::aggregate(rjd3toolkit::retail$RetailSalesTotal, nfreq=1)

sm1<-denton(nfreq=12, t=sy, conversion="UserDefined", obsposition = 6)
sm2<-cubicspline(rjd3toolkit::retail$WomensClothingStores, sy, conversion="UserDefined", 6)
sm3<-cubicspline(nfreq=12, t=sy, conversion="UserDefined", obsposition = 6)
sm4<-grp(rjd3toolkit::retail$WomensClothingStores, sy, conversion="UserDefined", obsposition = 6)

ts.plot(sm1, sm2, sm3, sm4, col=c("red", "blue", "gray", "green"))

tm1<-denton(rjd3toolkit::retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum")
tm2<-cubicspline(rjd3toolkit::retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum")
tm3<-grp(rjd3toolkit::retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum")
tm4<-cholette(rjd3toolkit::retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum", rho=.5, lambda=0.5)

ts.plot(tm1, tm2, tm3, tm4, col=c("red", "blue", "gray", "green"))


