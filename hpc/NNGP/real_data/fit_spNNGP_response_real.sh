#!/bin/sh

# Job name (replace R_simple but leave -N)
#$ -N spNNGP-response-real

#$ -S /bin/sh

# Set working directory on all host to
# directory where the job was started
#$ -cwd

# Send output to job.log (STDOUT + STDERR)
#$ -o log_files/03-spNNGP-response.log
#$ -j y

# Email information (to receive email at process end)
#$ -m e
#$ -M linyuchu@oregonstate.edu

#Change which version of R you want to load
module unload gcc/5.1.0
module load gcc/9.2.0
module load R/4.2.1

# Command to run (replace test.r but leave Rscript)
Rscript r_files/03-spNNGP-response.R
