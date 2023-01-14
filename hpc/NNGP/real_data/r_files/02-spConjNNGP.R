library(spNNGP)

## Package spNNGP paper p. 25

# Load data
data(BCEF)

# Rename data to keep it consistent with the paper
BCEF.mod <- BCEF

# Set up model 
theta.alpha <- as.matrix(expand.grid(seq(0.1, 1, length.out = 15),
                                     seq(3 / 10, 3 / 0.1, length.out = 15)))
colnames(theta.alpha) <- c("alpha", "phi")

# Fit model 
start.time <- Sys.time()
bcef.c <- spConjNNGP(FCH~PTC,
                     coords = c("x","y"),
                     data = BCEF.mod,
                     cov.model = "exponential",
                     sigma.sq.IG = c(2, 40),
                     n.neighbors = 10,
                     theta.alpha = theta.alpha,
                     k.fold = 2,
                     score.rule = "crps",
                     fit.rep = TRUE,
                     n.samples = 200,
                     n.omp.threads = 40)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

# Print results
# Send r output to a file
#sink("bcef.c.txt")
summary(bcef.c)
#sink()

# Check items in an object 
names(bcef.c)

## Save runtime 
#saveRDS(time.taken, file = "time.taken.rds")

## Rename model name
#mod <- bcef.c

## Save model output
#output <- list(
#  "beta.hat" = mod$beta.hat,
#  "beta.var" = mod$beta.var, 
#  "sigma.sq.hat" = mod$sigma.sq.hat, 
#  "sigma.sq.var" = mod$sigma.sq.var, 
#  "theta.alpha" = mod$theta.alpha,
#  "k.fold.scores" = mod$k.fold.scores, 
#  "run.time" = mod$run.time
#)

# Make sure to change file name
#saveRDS(output, file = "bcef.c.output.rds")
saveRDS(bcef.c, file = "bcef.c.rds")

# Add model diagnostics 
bcef.c.diag <- spDiag(bcef.c)
saveRDS(bcef.c.diag, file = "bcef.c.diag.rds")

