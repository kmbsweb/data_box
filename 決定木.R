data("Titanic")
str(Titanic)
class(Titanic)
Titanic[,1,2,]

mosaicplot(Titanic[,1,2,],color=T)

##分類
install.packages("epitools")
library(epitools)
Titanic.df <- expand.table(Titanic)
colnames(Titanic.df)
library(rpart)
Titanic.tree <- rpart(formula=Survived~.,data=Titanic.df,method="class")
summary(Titanic.tree)

install.packages("partykit")
library(partykit)
as.party(Titanic.tree)
plot(as.party(Titanic.tree))

plotcp(Titanic.tree)
Titanic.tree2 <- rpart(Survived~.,data=Titanic.df,method="class",cp=0.083)
plot(as.party(Titanic.tree2))

library(ggplot2)
data("diamonds")
dimonds2 <- subset(diamonds,subset=carat>=1.5&carat<2&
                                   clarity %in% c("I1","SI2"))
boxplot(dimonds2$price)

##回帰木分析
str(dimonds2)
diamonds.tree <- rpart(formula=price~carat+cut+color+clarity,
                       data=diamonds, method="anova")
plot(as.party(diamonds.tree))

##回帰木を用いた予測
train <- diamonds[1:50000,]
test <- diamonds[50001:nrow(diamonds),]
diamonds.tree2 <- rpart(formula=price~carat+cut+color+clarity,
                        data=train,method="anova",cp=0.078)
p <- predict(diamonds.tree2,newdata=test)
nrow(p)
p
