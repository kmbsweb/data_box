
setwd("~/Desktop")
##データの読み込み
test <-read.csv("test_data.csv", header=T, fileEncoding="Shift_JIS",stringsAsFactors = FALSE)
library(dplyr)

##課題1
#行ごとのNAをカウント
nacnt <- rowSums(is.na(test))/ncol(test)
test1 <- cbind(test,nacnt)
#8割以上NAの行を削除
test1_1 <- test1 %>%
  filter(nacnt < 0.8) %>%
  select(-nacnt)

##課題2
#列ごとのNAをカウント
nacnt <- colSums(is.na(test))/nrow(test)
#9割以上NAの列を削除
nacnt_name <- names(subset(nacnt,nacnt > 0.9))
test2 <- select(test,-nacnt_name)

##課題3
# X列とY列をキーに重複した値の組を持つ行を除外
test3 <- test %>% 
  mutate(num = row_number()) %>%
  arrange(desc(num)) %>%
  distinct(X,Y, .keep_all = TRUE) %>%
  arrange(num) %>%
  select(-num) 


