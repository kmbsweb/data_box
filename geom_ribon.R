library(ggplot2)
library(tidyr)

DI <- read.csv("DI_data.csv",fileEncoding="Shift_JIS",as.is = T)
DI$date <-seq.Date(as.Date("2000-10-01"),as.Date("2017-08-01"),by="1 month")
head(DI)
date 全国 北海道 東北 関東 北関東 南関東 東京都 東海 北陸
1 2000-10-01 46.5   46.1 47.8 47.9   47.6   48.1     NA 49.7 43.0
2 2000-11-01 45.3   48.3 43.3 44.5   47.0   43.3     NA 47.7 44.2
3 2000-12-01 44.4   48.5 41.8 44.7   43.3   45.3     NA 43.9 45.9
4 2001-01-01 41.5   41.9 36.9 43.8   43.2   44.1     NA 43.4 41.8
5 2001-02-01 39.6   39.4 34.8 40.7   39.7   41.2     NA 44.0 36.8
6 2001-03-01 40.3   41.7 38.0 41.0   40.4   41.3     NA 43.6 35.3

##全国DIと東海DIの比較
##目的:gatherコマンドを使う
DI2 <- gather(DI, key="date")
colnames(DI2) <- c("date","地域","景気DI")
head(DI2)

ggplot()+
  geom_line(data=DI2,aes(x=date,y=景気DI),color="gray",size=0.3)+
  geom_line(data=subset(DI2,地域=="全国"|地域=="東海"),
            aes(x=date,y=景気DI,color=地域),size=0.3) +
  scale_colour_manual(values = c(全国= "tomato",東海 = "darkgreen"))+
  theme(plot.caption=element_text(hjust=0),
        plot.subtitle=element_text(face="italic"),
        legend.position="bottom")+
  theme_bw(base_family="HiraKakuProN-W3") 


##データ整形
DI3 <- DI[,c("date","全国","東海")]
DI3$up <- ifelse(DI3$全国>DI3$東海,DI3$全国,DI3$東海)
DI3$down<-ifelse(DI3$全国<=DI3$東海,DI3$全国,DI3$東海)
DI3$base <- ifelse(DI3$東海>=50,DI3$東海,50)

##東海地方が50を超える場合
ggplot(data=DI3,aes(x=date,y=東海,fill=東海))+
  geom_line(size=0.3)+
  geom_ribbon(color=NA,fill="#4575b4",alpha=0.5,aes(ymin=50,ymax=base))+
  theme_minimal() +
  geom_hline(yintercept=50,linetype=1,color="darkgray")+
  scale_y_continuous(limits=c(0,65),breaks=seq(0,60,10))+
  labs(x="",y="DI",
       subtitle="Defusion index Tokai area",
       caption="Cabine Office, Government of Japan")+
  theme(plot.caption=element_text(hjust=0),
        plot.subtitle=element_text(face="italic"),
        legend.position="none")+
  theme_bw(base_family="HiraKakuProN-W3") 

##全国と東海地方の比較
ggplot(data=DI3,aes(x=date,y=全国,fill=全国))+
  geom_line(linetype=4, size=0.3)+
  geom_ribbon(color=NA,fill="#4575b4",alpha=0.5,aes(ymin=down,ymax=全国))+
  geom_ribbon(color=NA,fill="#d73027",alpha=0.5,aes(ymin=全国,ymax=up))+
  geom_rug(data=filter(DI3,全国>東海),color="#4575b4",sides="b")+
  geom_rug(data=filter(DI3,全国<東海),color="#d73027",sides="b")+
  geom_hline(yintercept=50,linetype=1,color="darkgray")+
  geom_line(aes(y=東海),linetype=1,size=0.3)+
  theme_minimal() +
  scale_y_continuous(limits=c(0,65),breaks=seq(0,60,10))+
  labs(x="",y="DI",
       subtitle="Defusion index ALL Japan and Tokai area",
       caption="Cabine Office, Government of Japan")+
  theme(plot.caption=element_text(hjust=0),
        plot.subtitle=element_text(face="italic"),
        legend.position="none")+
  theme_bw(base_family="HiraKakuProN-W3") 


