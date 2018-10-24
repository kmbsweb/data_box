library(ggplot2)
library(sf)
library(jpndistrict)
library(tidyverse)
library(ggrepel)
library(ggthemes)
setwd("~/Documents/fold/08_others/181003_建設業")

##データの読み込み
iyo_list <-read.csv("iyo_list.csv", header=T, fileEncoding="Shift_JIS",stringsAsFactors = FALSE)
##東予地域,中予地域,南予地域
#binwidth = 0.5でプロット
iyo_list %>%
  filter(area == "中予地域") %>%
ggplot(mapping = aes(x = log(URK),fill = sgy_j)) +
  geom_histogram(binwidth = 0.3) +
  scale_fill_gdocs() +
  theme_bw(base_family = "HiraKakuProN-W3") +
  ylim(0, 220) + xlim(0,10)


#データの取得
pref_38 <- jpn_pref(38)

ggplot(pref_38) +
  geom_sf(fill = 'white') +
  geom_point(data=iyo_list, aes(x=long,y=lat),color="navy",alpha=0.05)+
  theme_map() +
  coord_sf(datum = NA)

summary(as.factor(iyo_list$sgy_j))




##データの読み込み
iyo_list2 <-read.csv("iyo_list2.csv", header=T, fileEncoding="Shift_JIS",stringsAsFactors = FALSE)
#東予地域,中予地域,南予地域
　iyo_list2 %>%
    filter(area == "南予地域") %>%
    group_by(year,sgy_j) %>%
    summarize(count = n()) %>%
    mutate(pos = cumsum(count) - (0.5 * count)) %>%
  　ggplot( aes(x = year, y = count)) +
    geom_bar(aes(fill = sgy_j), alpha=0.8, stat="identity") +
    geom_text(aes(label = count, y = pos), size = 3) +
    scale_fill_gdocs() +
    theme_bw(base_family = "HiraKakuProN-W3") +
    coord_flip()
#東予地域,中予地域,南予地域
    iyo_list2 %>%
    　filter(area == "南予地域") %>%
    　group_by(year,sgy_j) %>%
      summarize(count = n()) %>%
    　mutate(pos = cumsum(count) - (0.5 * count)) 