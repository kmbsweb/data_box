library(lubridate)
library(ggplot2)
library(hms)
library(dplyr)

setwd("~/Desktop")
##データの読み込み
test <-read.csv("dt5.csv", header=T, fileEncoding="Shift_JIS",stringsAsFactors = FALSE)

test$Time  <- as.hms(test$Time)

test25 <- test %>%
  filter(mode == 25) %>%
  mutate(lag = Time - lag(Time))

ggplot(test) + 
  geom_line(aes(x = Time, y = value)) +
  geom_point(data=test25, aes(x = Time, y = value),color="red")



##6000sec以上と仮定
RN <- row.names(subset(test25, lag > 6000))
st <- as.numeric(c(0,RN))
end <- as.numeric(c(RN,nrow(test25)+1))-1

OutDatax <- data.frame()

for(i in 1:length(st)) {
testss <- test25[st[i]:end[i],]
testss$Wave_name <- paste("T", c(i))
OutDatax <- rbind(OutDatax,testss)
}

ggplot(test) + 
  geom_line(aes(x = Time, y = value)) +
  geom_point(data=OutDatax, aes(x = Time, y = value, color=Wave_name))

OutDatax %>%
ggplot(mapping = aes(x = value)) +
  geom_histogram(binwidth = 10) +
  theme_bw(base_family = "HiraKakuProN-W3") +
  facet_wrap(~ Wave_name)


OutDatax %>% group_by(Wave_name) %>% 
  summarise(mean = mean(value),
            var = var(value),
            sd = sd(value))


