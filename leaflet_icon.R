library(leaflet)

## データ作成
## university-name
df <- read.csv(textConnection(
  "University Name,Lat,Long,Address
  Kyoto University,35.026315,135.780865,Sakyo-ku Kyoto-city
  Kobe University,34.728043,135.234848,Nada-ku Kobe-city"
))
colnames(df)

## iconの設定
## 参考https://fontawesome.com/icons?d=gallery 
icons <- awesomeIcons(icon = "university", library = "fa",
             markerColor = "red", iconColor = "black", spin = FALSE,
             extraClasses = NULL, squareMarker = FALSE, iconRotate = 0,
             fontFamily = "monospace", text = NULL)

## leaflet
leaflet(df) %>%  addProviderTiles(providers$CartoDB.Positron) %>%
  addAwesomeMarkers(~Long, ~Lat, icon=icons,
                    popup = ~paste(University.Name))
