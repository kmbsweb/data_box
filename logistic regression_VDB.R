##retrieve data
target <- read.csv("base_data.csv", header=T, fileEncoding="Shift_JIS",as.is =T)
target <- na.omit(target)

##logistic regression
target <- target[,c(-1,-5)]
colnames(target)
output.lm <- lm(GR_MT0.5?., data=target)
summary(output.lm)

##予測値と実際の値とを集計する
predict.glm <- ifelse(output.lm$fitted.values>=0.5,1,0)
com.data <- cbind(target, predict.glm)
out.table.glm <- table(com.data$predict.glm,target$GR_MT0.5)

answer.glm<-sum(diag(out.table.glm))
sample.glm<-sum(out.table.glm)
answer.glm<-answer.glm/sample.glm
answer.glm
[1] 0.651446

##多重共線性の確認
install.packages("car")
library(car) 
vif(output.lm)  

# stepwise法でAICが低くなるモデルを確認
# 変数をステップごとに増減しAIC基準で良いモデル選択する
best.model.glm <- step(output.lm)
best.model.glm

#予測値と実際の値とを集計する
predict.best.glm<-ifelse(best.model.glm$fitted.values>=0.5,1,0)
com.data<-cbind(target, predict.best.glm)
out.table.best.glm<-table(com.data$predict.best.glm,com.data$GR_MT0.5)

answer.best.glm<-sum(diag(out.table.best.glm))
sample.best.glm<-sum(out.table.best.glm)
answer.best.glm<-answer.best.glm/sample.best.glm
answer.best.glm
[1] 0.6499239