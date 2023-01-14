library(spNNGP)

## Package spNNGP paper p. 25

# Load data
data(BCEF)

# Rename data to keep it consistent with the paper
BCEF.mod <- BCEF

# Set up model 
n.samples <- 5000
starting <- list("phi"=3/2, "sigma.sq"=40, "tau.sq"=1)
priors <- list("phi.Unif"=c(3/10, 3/0.1), "sigma.sq.IG"=c(2, 40), "tau.sq.IG"=c(2, 10))
cov.model <- "exponential"

## Specific to the response model 
tuning <- list("phi"=0.01, "sigma.sq"=0.01, "tau.sq"=0.005)

# Fit model 
start.time <- Sys.time()
bcef.r <- spNNGP(FCH~PTC,
                 coords=c("x","y"),
                 data=BCEF.mod,
                 starting=starting,
                 method="response",
                 n.neighbors=10,
                 tuning=tuning, 
                 priors=priors, 
                 cov.model=cov.model, 
                 n.samples=n.samples,
                 n.omp.threads=40, 
                 n.report=2500,
                 fit.rep=TRUE, 
                 sub.sample=list(start=4000, thin=10)
                 ) # Remove verbose=FALSE to show output 
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

# Print results
#sink("bcef.r.txt")
summary(bcef.r)
#sink()

## Save runtime 
#saveRDS(time.taken, file = "time.taken.rds")
names(bcef.r)

# Rename model name
mod <- bcef.r

# Save model output
output <- list(
  "p.beta.samples" = mod$p.beta.samples,
  "p.theta.samples" = mod$p.theta.samples, 
  "y.hat.samples" = mod$y.hat.samples, 
  "y.hat.quants" = mod$y.hat.quants, 
  "y.rep.samples" = mod$y.rep.samples,
  "y.rep.quants" = mod$y.rep.quants, 
  "run.time" = mod$run.time
)

# Make sure to change file name
saveRDS(output, file = "bcef.r.output.rds")
