# NNGP-with-Spatial-data-2022
Independent project for Research at OSU

Frances Lin

## Description 

Expand the NNGP (nearest-neighbor Gaussian process) models (two MCMC-based models and one MCMC-free model for fast and scalable inference for big spatial data) and include spatial examples of simulated data and forest canopy heights using the **R** package `spNNGP` and the HPC (high performance computing) cluster at OSU. 

Note that the package `spNNGP` is written in **C/C++** via **R**'s foreign language interface and uses **openMP** parallelization and **Fortran**'s Basic Linear Algebra Subprograms and Linear Algebra Package for computationally intensive matrix operations. 


## Documentation

Report can be found [here](https://github.com/franceslinyc/NNGP-with-Spatial-data-2022/blob/main/reporting/Lin_NNGP.pdf). Spatial analyses can be found here.

(Presentation slides can be found here.)

Other reports are in the analysis folder.


## Reference 

Suggested order of reading:

**[Finley, A. O., Datta, A., & Banerjee, S. (2021). spNNGP R package for nearest neighbor Gaussian process models. arXiv preprint arXiv:2001.09111.](https://arxiv.org/pdf/2001.09111.pdf)**

[Finley, A. O., Datta, A., Cook, B. D., Morton, D. C., Andersen, H. E., & Banerjee, S. (2019). Efficient algorithms for Bayesian nearest neighbor Gaussian processes. Journal of Computational and Graphical Statistics, 28(2), 401-414.](https://www.tandfonline.com/doi/pdf/10.1080/10618600.2018.1537924?casa_token=e1zdEo4SFaMAAAAA:1T8cnBqo1e1JygQJ7JEQtilnnlgWJ5JWKaC6PxhPt3ihdKBa47MWCOr0HhMIXhJVHXB08qGPfmDH)

[Datta, A., Banerjee, S., Finley, A. O., & Gelfand, A. E. (2016). Hierarchical nearest-neighbor Gaussian process models for large geostatistical datasets. Journal of the American Statistical Association, 111(514), 800-812.](https://www.tandfonline.com/doi/pdf/10.1080/01621459.2015.1044091?casa_token=0YOH387RhS0AAAAA:_-Jx4-It1wTYjPK5LTcblA8uJ6gwTnFxpmMat3vbyzgGnQMxnWoR3yjDDN0SdpSF8JV2y8m_ATNo)

Datta, A., Banerjee, S., Finley, A. O., & Gelfand, A. E. (2016). On nearest‐neighbor Gaussian process models for massive spatial data. Wiley Interdisciplinary Reviews: Computational Statistics, 8(5), 162-171.



