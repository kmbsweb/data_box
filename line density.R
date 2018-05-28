##call package
install.packages("rgeos")
library(sp)
library(rgeos)
library(maptools)
library(spatstat)
library(rgdal)

setwd("C:/Users/mkeig/Desktop/shape")
##spatial line data Frame
railway <- rgdal::readOGR(".","railways")
points <- rgdal::readOGR(".","points")
class(points)
AA <- as.linnet(railway)
class(AA)

##spatial point data frame
#xc = c(1.2,1.5,2.5)
#yc = c(1.5,2.2,1.6)
#Spoints = SpatialPoints(cbind(xc, yc))
#plot(Spoints)
##get the point on line
pp <- snapPointsToLines(points, railway)
plot(pp,col="red")
BB <- as.ppp(pp)


##create "lpp" "ppx" class
##point on line
##BB[1] "linnet" "list" 
##AA[2] "ppp"
X <- lpp(BB, AA)
class(X)
##[1] "lpp" "ppx"
plot(X)

##smoothing kernel on network
dna <- density(unmark(X),0.008)
plot(dna,style="width", adjust=0.9)
