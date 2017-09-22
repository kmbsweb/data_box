
## 必要パッケージ
install.packages("htmlTable")
library(leaflet)
library(htmlTable)

## データ作成
## 香川県上場企業(東1)
df <- read.csv(textConnection(
  "Company Name,Lat,Long,Rating,Sales,Profit,Address
  Anabuki Kosan Inc.,34.342175,134.048197,BBB,66,2.2,Kajiyamachi-Takamatsu city
  Shikoku Electric Power Co.Inc.,34.347715,134.050241,  A,684.5,15.9,Marunouchi-Takamatsu city
  Tadano Ltd.,34.333825,134.100666,AAA,179.6,18.4,Nittahigashi-Takamatsu city
  Yondenko Corp.,34.325181,134.048367, BB,70.1,2.6,Hananomiyacho-Takamatsu city
  The Hyakujushi Bank Ltd.,34.340989,134.048163,AAA,90.5,19.3,Kameicho-Takamatsu city
  Tomony Holdings Inc.,34.340504,134.048848, AA,71.4,16.3,Kameicho-Takamatsu city
  Okura Industrial Co.Ltd.,34.286571,133.775911, AA,86,4.6,Nakatsumachi-Marugame city
  Shikoku Chemicals Corp.,34.301158,133.804580,AAA,49.4,8.2,Dokimachi-Marugame city"
))
colnames(df)
[1] "Company.Name" "Lat"          "Long"         "Rating"      
[5] "Sales"        "Profit"       "Address"     

## iconの設定
icons <- awesomeIcons(
  icon = 'ion-gear-b',
  iconColor = 'orange',
  library = 'ion',
  markerColor ="black",
  fontFamily = "monospace")

## htmltable + leaflet
leaflet(df) %>%  addProviderTiles(providers$CartoDB.Positron) %>%
  addAwesomeMarkers(~Long, ~Lat, icon=icons,
                         popup = ~paste(" <figcaption text-align=left>■企業情報</figcaption>
                                           <table border=1 table width=300 CELLSPACING=0 CELLPADDING=0 frame=hsides rules=groups>
                                           <thead><tr align=center><th>Variable</th><th>Value</th></tr></thead>
                                           <tr align=center bgcolor=#f5f5f5><td>Company.Name</td><td>",df$Company.Name,"</td></tr>
                                           <tr align=center ><td>Address</td><td>",df$Address,"</td></tr>
                                           <tr align=center bgcolor=#f5f5f5><td>Rating</td><td>",df$Rating,"</td></tr>
                                           <tr align=center ><td>Sales (bln-yen)</td><td>",df$Sales,"</td></tr>
                                           <tr align=center bgcolor=#f5f5f5><td>Profit (bln-yen)</td><td>",df$Profit,"</td></tr>
                                           </table>"))


