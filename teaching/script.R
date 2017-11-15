rm(list=ls())

train <- read.csv("Training50.csv")
test <- read.csv("Test50.csv")
train <- train[,-1]
test <- test[,-1]
library(tree)

nTrain <- nrow(train)
cart.pred <- tree(factor(Creditability)~. , data=train, control=tree.control(nTrain , mincut = 15, minsize = 30, mindev =0),split="deviance")
plot(cart.pred)
text(cart.pred, pretty=0, cex=0.5)

predicted <- predict(cart.pred, newdata=test , type="class")
print(table(predicted ,test$Creditability))

# pruned <- prune.tree(cart.pred,k=2.3,method = "deviance")
# predicted.pruned <- predict(pruned, newdata=test , type="class")
pruned2 <- prune.tree(cart.pred , best=8,method = "deviance")
predicted.pruned2 <- predict(pruned2, newdata=test , type="class")

# print(table(predicted.pruned ,test$Creditability))
print(table(predicted.pruned2 ,test$Creditability))

# plot(pruned)
# text(pruned)

plot(pruned2)
text(pruned2)

## CV

n <- dim(train)[1]
V <- 5
I <- array(0,dim=c(V,n/V))

reste <- 1:n
for(i in 1:V){
  I[i,] <- sample(reste,n/V)
  reste <- setdiff(reste, I[i,])
}

Ibest <- c(2:25)
N <- length(Ibest)
scor <- array(0,N)

for(i in 1:V){
  cv_valid <- train[I[i,],]
  cv_train <- train[-I[i,],]
  cart <- tree(factor(Creditability)~., data = cv_train)
  for(k in 1:N){
    b <- Ibest[k]
    pruned <- prune.tree(cart, best=b, method="misclass")
    predictions <- predict(pruned, newdata=cv_valid, type="class")
    scor[k] <- scor[k]+mean(predictions != cv_valid$Creditability)
  }
}


require(ROCR)
predictProba <- predict(cart.pred ,newdata=test ,type="vector")[ ,2]
pr <- prediction(predictProba , test$Creditability)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)
