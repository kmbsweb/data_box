library(leaflet)
leaflet() %>% addTiles()
MBaccessToken <- "pk.eyJ1IjoiaWJyZWNraGUiLCJhIjoidVNHX1VpRSJ9.9fPQ1A3rdxyCAzPkeYSYEQ"
MBurlTemplate <- "https://a.tiles.mapbox.com/v4/ibreckhe.map-z05003mi/{z}/{x}/{y}.png?access_token="
MBTemplate <- paste(MBurlTemplate,MBaccessToken,sep="")
m <- leaflet() %>% addTiles(MBTemplate) %>% setView(lat=46.854039, lng=-121.760366, zoom = 10)
m
install.packages("rgdal")
library(maptools)
library(rgdal)

##Loads and formats data.
photos <- read.csv("MORA_grid_500m_flickr.csv")
photos <- photos[photos$PNTCNT>0,]
coordinates(photos) <- ~XCTR + YCTR
proj4string(photos) <- "+proj=utm +zone=10 +ellps=GRS80 +units=m +no_defs"
photos_latlng <- spTransform(photos,CRSobj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"))

parkbound <- readShapePoly("MORA_boundary_UTM10.shp")
proj4string(parkbound) <- "+proj=utm +zone=10 +ellps=GRS80 +units=m +no_defs"
parkbound_latlng <- spTransform(parkbound,CRSobj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"))

m <- m %>% addPolygons(data=parkbound_latlng,
                       color="white",fillColor="white",
                       opacity=0.7,fillOpacity=0.1)
m

trans_fun <- function(x){
  x_log <- log(x+1)*100
  range_log <- log(photos_latlng@data$PNTCNT+1)*100
  return(((x_log - min(range_log)) / max(range_log)))
}
vals <- trans_fun(photos_latlng@data$PNTCNT)

ramp <- colorRamp(c("white","blue"))
cols_rgb <- ramp(vals)
cols <- rgb(cols_rgb,maxColorValue=256)

sizes <- log(photos_latlng@data$PNTCNT+1)*2

m  <- m %>% addCircleMarkers(lng=coordinates(photos_latlng)[,1],
                             lat=coordinates(photos_latlng)[,2],
                             radius=sizes,
                             fillColor=cols,fillOpacity=0.9,
                             weight=0.5)
m

leg_html <-   "<div class='my-legend'>
              <div class='legend-title'>Flickr Photos <br/> (2009-2013)</div>
<div class='legend-scale'>
<img src='https://raw.githubusercontent.com/ibreckhe/ibreckhe.github.io/master/images/web_map_legend.png' alt='Legend' style='width:50px;height:70px'>
</div>
<div class='legend-source'>Map: <a href='http://ibreckhe.github.io'>Ian Breckheimer</a><br/>
Data: <a href='http://www.flickr.com'>Flickr</a></div>
</div>"

m <- m %>% addTiles(MBTemplate,attribution=leg_html)
m


paradise <- c(46.785571, -121.736838)
sunrise <- c(46.914467, -121.643628)
spray <- c(46.920867, -121.834865)
popups <- data.frame(rbind(paradise,sunrise,spray))
popups$Label <- c("Paradise","Sunrise","Spray Park")

colnames(popups) <- c("latitude","longitude","Label")

##Adds Popup points of interest.
m <- m %>% addMarkers(lat=popups[,1],lng=popups[,2],popup=popups$Label,options=markerOptions(clickable=TRUE))
m


