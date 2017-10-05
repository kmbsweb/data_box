##必要なパッケージ
library(leaflet)
library(htmlTable)
library(leaflet.extras)

## データ作成
df <- read.csv(textConnection(
  "CityName,Lat,Long,製造業,卸売業,小売業,サービス業,天気,cl1,cl2
  名古屋市,35.168673,136.910323,12.5,22.4,2.2,-22.1,day-sunny,red,white
  あま市,35.200526,136.783584,12.5,22.4,2.2,-22.1,day-sunny,red,white
  岡崎市,34.954845,137.173023,12.5,22.4,2.2,-22.1,cloud,gray,white
  知立市,35.001279,137.0506463,12.5,22.4,2.2,-22.1,cloud,gray,white
  東栄町,35.076930,137.697833,12.5,22.4,2.2,-22.1,rain,blue,white
  豊根村,35.146451,137.719719,-,-,-,-,na,green,white
  蒲郡市,34.826389,137.219660,12.5,22.4,2.2,-22.1,storm-showers,black,yellow"
))

##https://erikflowers.github.io/weather-icons/

leaflet(df) %>%  addProviderTiles(providers$CartoDB.Positron) %>%
  addWeatherMarkers(~Long, ~Lat, 
                    icon = makeWeatherIcon(icon=df$天気,markerColor = df$cl1, iconColor = df$cl2 ),
                    label = df$CityName ,
                    popup = ~paste(" <figcaption text-align=left>■景況</figcaption>
                                           <table border=1 table width=150 CELLSPACING=0 CELLPADDING=0 frame=hsides rules=groups>
                                           <thead><tr align=center><th>業種</th><th>景気DI</th></tr></thead>
                                           <tr align=center bgcolor=#f5f5f5><td>製造業</td><td>",df$製造業,"</td></tr>
                                           <tr align=center ><td>卸売業</td><td>",df$卸売業,"</td></tr>
                                           <tr align=center bgcolor=#f5f5f5><td>小売業</td><td>",df$小売業,"</td></tr>
                                           <tr align=center ><td>サービス業</td><td>",df$サービス業,"</td></tr>
                                           </table>"))

