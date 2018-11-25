library(dplyr)
library(tsibble)
library(lubridate)
library(ggplot2)
#日本標準時=JST

##データの読み込み
ldara <-read.csv("100014AB_20181104.csv", header=F, fileEncoding="Shift_JIS",stringsAsFactors = FALSE)


agregate_hour <- function(test){

test$V5 <- as.POSIXct(as.POSIXct(test$V5, origin="1970-01-01"))
  
test1 <- test　%>%
  mutate(date = date(V5),
         hour = hour(V5)) %>% 
  #時間によるグループ化
  group_by(hour) %>% 
  #グループ化による集計
  summarise(cnt = n()) 

test2 <- test1　%>%
  mutate(date = c(date(test$V5)[1]),
         weekdays = weekdays((test$V5)[1]))

return(test2)
}



file_name <- list.files(full.names =F)
OutDatax <- data.frame()

for(i in 1:length(file_name)) {
  ##データの読み込み
  rdata <-read.csv(file_name[i], header=F, fileEncoding="Shift_JIS",stringsAsFactors = FALSE)
  OutDatax <- rbind(OutDatax,agregate_hour(rdata))
}

  ggplot(OutDatax) +  
    geom_line(aes(x = hour, y = cnt)) +
    facet_wrap(~ date) + 
    theme_bw(base_family = "HiraKakuProN-W3") 
