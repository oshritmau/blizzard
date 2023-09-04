library(dplyr)
library(data.table)
library(ggplot2)
library(FactoMineR)
library(factoextra)


data=fread("SkillCraft.csv",header = T) # read the data


data[,GameID:=NULL] # delete 

# lets try and spllit the data between ages 25 and up and under

tfNup=data[which(Age>=25),] # all players age 25 and up
under=data[which(Age<25),] #all players under 25

#View(tfNup)
#View(under)

# makeing a table for later use
DT = data.table(
  Category = c("numHleague","numLleague","APMleague_1","APMleague_2","APMleague_3","APMleague_4","APMleague_5","APMleague_6","APMleague_7"),
  TFand_up=c(""), 
  under_25=c("")
)


DT[, `TFand_up`:=as.double(`TFand_up`)]
DT[, `under_25`:=as.double(`under_25`)]


#View(DT)

# we can see we have about 20% of ages are 25 and up and about 80% are younger
# we can asoum that because we can see more younger players they will be ranke higther
# we will consider higther league to be ranke 5 and up

numOFhlTF=length(which(tfNup$LeagueIndex>=5)) #number of players higth ranke age 25 and up
numOFllTF= length(which(tfNup$LeagueIndex<5))#number of players low ranke age 25 and up

numOFhlUTF=length(which(under$LeagueIndex>=5)) #number of players higth ranke age under 25
numOFllUTF=length(which(under$LeagueIndex<5)) #number of players low ranke age under 25

  set(DT,1L,2L,numOFhlTF)
  set(DT,2L,2L,numOFllTF)
  set(DT,1L,3L,numOFhlUTF)
  set(DT,2L,3L,numOFllUTF)
  
# for ages 25 and up we see : 32% ranked 5 and up, 68% ranked lower
# for ages under 25 we see : 47% ranked 5 and up, 53% ranked lower

# lets check a spesic league - 1 (lowest) and 7 (higthest we have in the data)
tfLO=length(which(tfNup$LeagueIndex==1)) # number of players age 25 and up in league 1
tfLS=length(which(tfNup$LeagueIndex==7)) # number of players age 25 and up in league 7
  
uLO=length(which(under$LeagueIndex==1)) # number of players age under 25 in league 1
uLS=length(which(under$LeagueIndex==7)) # number of players age under 25 in league 7


# we can see : 88% in league 7 are under the age of 25 ,12% 25 and older 
# between all plyers in the data, and in the age groups: 25 and up : 0.5% , under 25 : 1.17 %
# in league 1: 67% are younger then 25 , 33% 25 and older - between all plyers in the data
# in the age groups: 25 and up : 7.7 % , under 25 : 4.2%


# now we will check the APM for each league and age group (means in their group)

# for ages 25 and up
tfLoneAPM= (sum(tfNup$APM[which(tfNup$LeagueIndex==1)]))/(length(which(tfNup$LeagueIndex==1)))
tfLtwoAPM=sum(tfNup$APM[which(tfNup$LeagueIndex==2)])/(length(which(tfNup$LeagueIndex==2)))
tfLtreeAPM=sum(tfNup$APM[which(tfNup$LeagueIndex==3)])/(length(which(tfNup$LeagueIndex==3)))
tfLfourAPM=sum(tfNup$APM[which(tfNup$LeagueIndex==4)])/(length(which(tfNup$LeagueIndex==4)))
tfLfiveAPM=sum(tfNup$APM[which(tfNup$LeagueIndex==5)])/(length(which(tfNup$LeagueIndex==5)))
tfLsixAPM=sum(tfNup$APM[which(tfNup$LeagueIndex==6)])/(length(which(tfNup$LeagueIndex==6)))
tfLsevenAPM=sum(tfNup$APM[which(tfNup$LeagueIndex==7)])/(length(which(tfNup$LeagueIndex==7)))

# for ages under 25
uLoneAPM=sum(under$APM[which(under$LeagueIndex==1)])/(length(which(under$LeagueIndex==1)))
uLtwoAPM=sum(under$APM[which(under$LeagueIndex==2)])/(length(which(under$LeagueIndex==2)))
uLtreeAPM=sum(under$APM[which(under$LeagueIndex==3)])/(length(which(under$LeagueIndex==3)))
uLfourAPM=sum(under$APM[which(under$LeagueIndex==4)])/(length(which(under$LeagueIndex==4)))
uLfiveAPM=sum(under$APM[which(under$LeagueIndex==5)])/(length(which(under$LeagueIndex==5)))
uLsixAPM=sum(under$APM[which(under$LeagueIndex==6)])/(length(which(under$LeagueIndex==6)))
uLsevenAPM=sum(under$APM[which(under$LeagueIndex==7)])/(length(which(under$LeagueIndex==7)))

set(DT,3L,2L,tfLoneAPM)
set(DT,4L,2L,tfLtwoAPM)
set(DT,5L,2L,tfLtreeAPM)
set(DT,6L,2L,tfLfourAPM)
set(DT,7L,2L,tfLfiveAPM)
set(DT,8L,2L,tfLsixAPM)
set(DT,9L,2L,tfLsevenAPM)

set(DT,3L,3L,uLoneAPM)
set(DT,4L,3L,uLtwoAPM)
set(DT,5L,3L,uLtreeAPM)
set(DT,6L,3L,uLfourAPM)
set(DT,7L,3L,uLfiveAPM)
set(DT,8L,3L,uLsixAPM)
set(DT,9L,3L,uLsevenAPM)

DTP=DT[3:nrow(DT),]


uAPM.plot=ggplot (DTP,aes(1:7,DTP$under_25)) + geom_point(col="red") + geom_smooth(method = 'lm',col='black') +
  labs(title = "under 25 ",x="League index",y="mean APM")

#plot(uAPM.plot)


# another plot
# x = seq(1,7,length.out = 100)
# y = seq(50,200,length.out = 100)
# plot(x, y, type = "n", xlab = "League index", 
#      ylab = "APM red:25_and UP blue:under 25" )
# lines(DTP$TFand_up, col = "red")
# lines(DTP$under_25, col = "blue")


# lets try coroltion and see if we can find some info to work with

Cdata=cor(data)
Cdata=Cdata[,2] # cor with league index
Cdata=sort(Cdata,decreasing = TRUE) #sorting values from big to small
#View(Cdata)
  

# corAPM.plot=ggplot(data,aes(data$APM,data$LeagueIndex)) + geom_point(col="blue") + geom_smooth(method = 'lm',col='black') +
# labs(title = "correlation ",x="APM",y="LeagueIndex")
# 
# plot(corAPM.plot)

# the cor gave us nothing from age point of viwe  ... we need to try something else...lets try point of viwe for league index 
# lets try PCA 
DT.pca=PCA(data,graph = FALSE)
pca.data=fviz_pca_var(DT.pca,labelsize = 4,col.var="contrib",gradient.cols = c("blue","red","green"),repel = TRUE) # Avoid text overlapping

#plot(pca.data)

#-----------------------------------------------------------
#pca for the 25 and up group
tf_pca=PCA(tfNup,graph = FALSE)
pca.tf=fviz_pca_var(tf_pca,labelsize = 4,col.var="contrib",gradient.cols = c("blue","red","green"),repel = TRUE) # Avoid text overlapping
#plot(pca.tf) 

# we can see the hours playing is not cor with the age or the APM/league index
# now we can see what action help you beeing a better player (in the older group)
# we can see that the 'ActionLatency' is cor with the age
# and that is ati-cor with the league index and APM


#pca fofr the under 25 group
u_pca=PCA(under,graph = FALSE)
pca.u=fviz_pca_var(u_pca,labelsize = 4,col.var="contrib",gradient.cols = c("blue","red","green"),repel = TRUE) # Avoid text overlapping
#plot(pca.u)


# pca for league 1 and league 7 
 Lone=data[which(LeagueIndex==1),]
 Lseven=data[which(LeagueIndex==7),]

 
 #pca for league 1:
 Lone_pca=PCA(Lone,graph = FALSE)
 pca.lo=fviz_pca_var(Lone_pca,labelsize = 4,col.var="contrib",gradient.cols = c("blue","red","green"),repel = TRUE) # Avoid text overlapping
 #plot(pca.lo)
 
 #pca for league 7:
 Lseven_pca=PCA(Lseven,graph = FALSE)
 pca.ls=fviz_pca_var(Lseven_pca,labelsize = 4,col.var="contrib",gradient.cols = c("blue","red","green"),repel = TRUE) # Avoid text overlapping
 #plot(pca.ls)
 
 #----------------------------------------------------------------

