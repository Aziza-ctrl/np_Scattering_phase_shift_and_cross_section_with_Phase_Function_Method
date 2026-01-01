# np-Scattering-phase-shift-and-cross-section-with-Phase-Function-Method-for-two-term-Potentials
Nuclear physics is characterized by numerous experiments, including those involving nucleon-nucleon interactions. In these cases, the phase shift carries information about the behavior of this interaction depending on nucleon distance.

To find the phase shift for an np system, I first use the time-independent Schrödinger Equation for two interacting particles (as in the hydrogen atom problem) and derive the Phase function method for the S channel, which directly depends on the potential of interaction (F. Calogero, 1967). This phase Function is a first-order nonlinear differential equation, which can be solved with the Runge-Kutta 4 and Euler methods. Second, I use some initial parameters to modify the potential interaction to find the phase shift and total scattering cross section.  

Fortran program code for neutron-proton (np) scattering phase shift and total cross-section is presented using the Phase Function Method for many two-term Potentials. To use it, download the docs inside a directory linked to some Fortran IDE. I used Visual Studio 2022 to code and Gnuplot to plot.

For more information about the implementation of the Phase Function and Monte Carlo methods in nuclear scattering, see (O.S.K.S. Sastri et al., 2021).
