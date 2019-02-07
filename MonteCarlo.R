# Monte Carlo Simulations
# Goal: simply model problem & randomly simulate it til you get an answer

# Integration Simulation 
# integrating across probability density function 
browseURL("https://www.wolframalpha.com/input/?i=integral(PDF(NormalDistribution(1,10),x),3,6)") #0.112203

runs <- 100000 # How many times to run 
sims <- rnorm(runs, mean=1, sd=10) # simulations sampled from random normal with mean of 1 and sd of 10 
sims
mc.integral <- sum(sims >=3 & sims <= 6)/runs # integration from 3 to 6 divided by runs # 0.11175

 
# Approximating Binomial Distribution 

# hundred thousand runs 
runs <- 100000

# simulate single round of toss 10 coins 
# function that returns true if number of heads > 3 
one.trial <- function() {
  sum(sample(c(0,1),10,replace=T)) > 3
}

# repeate trial for runs
mc.binom <- sum(replicate(runs,one.trial()))/runs
mc.binom # 0.82872 

# Predicting the Stock Market 
# BAYZ trading $20/per share - data for 200 days 
days <- 200

changes <- rnorm(200, mean=1.001, sd=0.005)

# plot - type = "letter l" 
plot(cumprod(c(20,changes)),type = 'l', ylab='Price', xlab='day', main='BAYZ closing price (sample path)')


# Clean up 
rm(list = ls())
dev.off()
