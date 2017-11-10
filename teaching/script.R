library(data.table) 
# matchdata<-fread("/data/pcollinet/matchdata.csv") 
# StudentsData<-fread("/data/pcollinet/StudentsData.csv") 
titanic<-fread("titanic.csv") 

sapply(titanic ,function(x) sum(is.na(x)))


titanic$Age[is.na(titanic$Age)] <- mean(titanic$Age,na.rm=T)
titanic <- titanic [!is.na(titanic$Embarked),]

total <- 1:nrow(titanic)
train <- sample(x=total,size=floor(.8*length(total)),replace=F)

linmodel <- lm(Survived~.,data=titanic[train,])
linmodel <- lm( Survived~Age + Sex , data=titanic[train,])

require(MASS)
Lambdas <-  c(seq(0.001,0.01,1),seq(1,2000,1))
model_lin <- lm.ridge(Survived~.,data=titanic[train,],lambda=Lambdas)
betasRidge <- coef(model_lin )
