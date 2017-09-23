
library(highcharter)
library(dplyr)
library(purrr)

typhoon <- read.csv("typhoo_201709.csv",fileEncoding="Shift_JIS",as.is = T)
colnames(typhoon)

n <- nrow(typhoon)
z <-  typhoon$time
sequences <- map2(1:n, z, function(x, y){ ifelse(x == 1:n, y, 0) })
typhoon$time
df1 <- data_frame(
  lat = typhoon$lat,
  lon = typhoon$long,
  wind = typhoon$Kt.wind,
  level = typhoon$level,
  z = z,
  color = colorize(level),
  sequence = sequences
)

hcmap("countries/jp/jp-all",name = "Japan") %>% 
  hc_add_series(data = df1, type = "mapbubble",name = "Typhoon",
                minSize = 0, maxSize = 70) %>% 
  hc_motion(enabled = TRUE, series = 1, labels =df1$z,
            loop = FALSE, autoPlay = FALSE, 
            updateInterval = 200, magnet = list(step =  1)) %>% 
  hc_plotOptions(series = list(showInLegend = TRUE))  %>% 
  hc_title(text = "台風18号　2017年9月")

