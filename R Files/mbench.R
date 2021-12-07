library(rjd3bench)


input<-list()
input[["a1"]]<-retail$WomensClothingStores
input[["a2"]]<-retail$WarehouseClubsAndSuperstores
input[["a3"]]<-retail$ShoeStores
input[["a4"]]<-retail$MensClothingStores
input[["s1"]]<-retail$FamilyClothingStores
input[["s2"]]<-retail$SportingGoodsStores
input[["s3"]]<-retail$ClothingStores
input[["y1"]]<-rjd3toolkit::aggregate(retail$BookStores, nfreq=1)

cc<-c("s1=a1+a2", "s2=a3+a4", "s3=a1+a4")
tc<-c("y1=sum(a2)")

output<-rjd3bench::multivariatecholette(input, tc, cc, rho=.8, lambda=.5)

print(summary(output[["a1"]]+output[["a2"]]-input[["s1"]]))
print(summary(output[["a3"]]+output[["a4"]]-input[["s2"]]))
print(summary(output[["a1"]]+output[["a4"]]-input[["s3"]]))

ts.plot(input[["a1"]], output[["a1"]], col=c("red", "blue"))
ts.plot(input[["a2"]], output[["a2"]], col=c("red", "blue"))
ts.plot(input[["a3"]], output[["a3"]], col=c("red", "blue"))
ts.plot(input[["a4"]], output[["a4"]], col=c("red", "blue"))

output<-rjd3bench::multivariatecholette(input, NULL, cc, rho=1, lambda=.5)

print(summary(output[["a1"]]+output[["a2"]]-input[["s1"]]))
print(summary(output[["a3"]]+output[["a4"]]-input[["s2"]]))
print(summary(output[["a1"]]+output[["a4"]]-input[["s3"]]))

ts.plot(input[["a1"]], output[["a1"]], col=c("red", "blue"))
ts.plot(input[["a2"]], output[["a2"]], col=c("red", "blue"))
ts.plot(input[["a3"]], output[["a3"]], col=c("red", "blue"))
ts.plot(input[["a4"]], output[["a4"]], col=c("red", "blue"))
