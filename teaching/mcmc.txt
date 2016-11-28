## MCMC standard

rm(list=ls())
borneInf <- -5
borneSup <- 10
niter <- 10000 #how many mcmc iterations
MCMC <- numeric(niter)
var <- 1
a1 = 0 #mean of gaussian 1
b1 = 1 #variance
a2 = 1 #mean of gaussian 2
b2 = 1 #variance
p1 = 1/3 #weight of gaussian 1
p2 = 1-p1 #weight of gaussian 2

GaussianMixture <- function(x,a1,b1,a2,b2)
{
  return(p1*dnorm(x = x, mean = a1, sd = b1)+p2*dnorm(x = x, mean = a2, sd = b2))
}
target <- function(x)
{
  return(GaussianMixture(x = x, a1 = a1, b1 = b1, a2 = a2, b2 = b2))
}
rproposal <- function(mu)
{
  return(rnorm(n = 1, mean = mu, sd = var))
}
dproposal <- function(x, mu)
{ 
  return(dnorm(x = x, mean = mu, sd = var))
}
curve(target,from = borneInf, to = borneSup, ylim = c(0,1))


MCMC[1] = runif(n = 1, min = borneInf, max = borneSup)
for(iiter in 2:niter)
{
  cat(100*iiter/niter,'%\n')
  MCMC[iiter] <- MCMC[iiter-1]
  prop <- rproposal(MCMC[iiter-1])
  alpha <- min(1,target(prop)/target(MCMC[iiter-1]))
  u <- runif(1) < alpha
  if(u)
  {
    MCMC[iiter] <- prop
  }
}

estimate <- density(MCMC)
lines(estimate, col = 2)
