## agrégation
# dat <- iris
# https://archive.ics.uci.edu/ml/datasets/wine+quality

rm(list=ls())

prop <- .7

# library(data.table)
# matchdata<-fread("/data/pcollinet/matchdata.csv")
# StudentsData<-fread("/data/pcollinet/StudentsData.csv")
# StudentsData<-fread("StudentsData.csv")

StudentsData <- read.csv("StudentsData.csv")
# titanic<-fread("titanic.csv")

pairs(StudentsData[,c("raisedhands","VisITedResources","Discussion","AnnouncementsView")], col=StudentsData[,"Class"])

idx <- sample(x=1:nrow(StudentsData),size=floor(prop*nrow(StudentsData)),replace=F)

StudentsData[["Class"]] <- as.factor(StudentsData[["Class"]])

train <- StudentsData[idx,]
test <- StudentsData[-idx,]

library (e1071)
svm.fit <- svm(Class~., data=train,kernel="radial",gamma= 0.5, cost =1)

# obj <- tune.svm(Class~.,
#                 data = train,
#                 kernel = "polynomial",
#                 degree = 1:10,
#                 gamma=seq(0.1,2,0.1),
#                 cost =2^(0:4),
#                 tunecontrol=tune.control(sampling="fix",fix=2/3,cross=8)
#                 )
# summary(obj)
# Best <- obj$best.parameters
# svm.optimized <- svm(Class~.,
#                      data=train ,
#                      kernel="polynomial",
#                      degree=Best$degree ,
#                      gamma=Best$gamma,
#                      cost=Best$cost)
# 
# cbind(test[["Class"]],predict(svm.optimized,test))

print(table(test[["Class"]],predict(svm.fit,test)))
# print(table(test[["Class"]],predict(svm.optimized,test)))



## knn

require(class)
ppv <- knn(train[,c("raisedhands","VisITedResources","Discussion","AnnouncementsView")],
           test[,c("raisedhands","VisITedResources","Discussion","AnnouncementsView")],
           cl = train$Class,
           k=1)

best <- tune.knn(x= train[,c("raisedhands","VisITedResources","Discussion","AnnouncementsView")],
                 y = train$Class,
                 k = 1:10)

ppv_meilleur <- knn(train[,c("raisedhands","VisITedResources","Discussion","AnnouncementsView")],
                    test[,c("raisedhands","VisITedResources","Discussion","AnnouncementsView")],
                    cl = train$Class,
                    k = best$best.parameters)

print(table(test$Class,ppv))
print(table(test$Class,ppv_meilleur))





