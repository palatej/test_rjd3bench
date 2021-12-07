library(rjd3bench)

sy<-rjd3toolkit::aggregate(retail$RetailSalesTotal, nfreq=1)

sm1<-denton2(12, sy, conversion="UserDefined", obsposition = 6)
sm2<-cubicspline(retail$WomensClothingStores, sy, conversion="UserDefined", 6)
sm3<-cubicspline2(12, sy, conversion="UserDefined", 6)
sm4<-grp(retail$WomensClothingStores, sy, conversion="UserDefined", obsposition = 6)

ts.plot(sm1, sm2, sm3, sm4, col=c("red", "blue", "gray", "green"))

tm1<-denton(retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum")
tm2<-cubicspline(retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum")
tm3<-grp(retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum")
tm4<-cholette(retail$RetailAndFoodServicesSalesTotal, sy, conversion="Sum", rho=.5, lambda=0.5)

ts.plot(tm1, tm2, tm3, tm4, col=c("red", "blue", "gray", "green"))


