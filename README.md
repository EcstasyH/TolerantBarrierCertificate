# Tolerant Barrier Certificate

Synthesizing Tolerant-BC for stochastic dynamical systems.

## Get Started

1. Our implementation is based on the sum-of-squares module **YALMP** and the SDP solver **MOSEK**. Make sure they are installed correctly.
2. `git clone` this project and add the folder to the path of the matlab environment.
3. run `SearchDegree.m`
4. to run different examples, change the following code in `TolerantBC.m` file: `[dim,f1,f2,f3,f4,f5,f6,S0_f,Su_f,St_f,Sd_f] = Ex1d_randomwalk(vars_total,ra);`

