

# Experimentation and Signal Processing Repository

This repository contains code and reports related to various experiments in signal processing, system identification, and model calibration. The experiments cover topics like harmonic oscillators, regularization techniques, signal analysis, and damage detection.

## Discussion and Key Insights

### 1. Harmonic Oscillator and System Identification

The harmonic oscillator model was analyzed, focusing on how varying system stiffness affects oscillatory behavior. The governing equation is:

$$
m\frac{d^2x(t)}{dt^2} + c\frac{dx(t)}{dt} + kx(t) = F(t)
$$

Where:
- $$m$$ is the mass
- $$c$$ is the damping coefficient
- $$k$$ is the stiffness
- $$F(t)$$ is the external force

Parameter estimation was performed by minimizing the cost function:

$$
J(\theta) = \sum_{i=1}^n \left( y_i - \hat{y}(\theta, t_i) \right)^2
$$

Optimization was executed using `fminsearch` and `fmincon`, allowing constraints on the parameter space.

### 2. Regularization in Model Calibration

To handle ill-posed problems, regularization techniques such as Tikhonov regularization and truncated singular value decomposition (TSVD) were used. The regularized least squares problem is formulated as:



\[
\min_x \left\{ \|Ax - b\|^2 + \alpha \|Lx\|^2 \right\}
\]

This equation represents the regularized least squares problem, where:
- \(A\) is the system matrix,
- \(b\) is the observed data,
- \(x\) is the parameter vector to be optimized,
- \(L\) is the regularization matrix,
- \(\alpha\) is the regularization parameter.






The L-curve criterion was used to select $$\alpha$$, balancing the trade-off between data fitting and solution smoothness.

### 3. Signal Analysis and System Identification

Advanced signal processing techniques were applied, including Fourier Transform (FFT), Discrete Fourier Transform (DFT), and Wavelet Transform. The wavelet transform, essential for analyzing non-stationary signals, is defined as:

$$
W_x(a, b) = \frac{1}{\sqrt{|a|}} \int_{-\infty}^{\infty} x(t) \psi^*\left(\frac{t-b}{a}\right) dt
$$

Where:
- $$W_x(a, b)$$ is the wavelet coefficient
- $$a$$ is the scaling parameter
- $$b$$ is the translation parameter
- $$\psi(t)$$ is the mother wavelet

### 4. Damage Detection in Structural Systems

The experiments on structural health monitoring focused on the analysis of natural frequencies and mode shapes. The relationship between frequency shift $$\Delta f$$ and damage parameter $$\Delta k$$ is given by:

$$
\Delta f \approx \frac{1}{2f} \frac{\Delta k}{m}
$$

This equation shows how changes in stiffness (indicative of damage) affect the system's natural frequencies, providing a method for damage detection.


## Folders Structure

This repository is organized into five main folders, each corresponding to a specific experiment or set of related experiments:

1. **Experiment-1: Calibration-1 Exercise Report**
   - Focuses on the harmonic oscillator model, parameter variation, noise analysis, and optimization using different methods like `fminsearch` and `fmincon`.
   
2. **Experiment-2: Calibration Exercise Report: Exploring Equation of Motion**
   - Explores equation of motion calibration with an emphasis on least squares and regularization techniques, particularly Tikhonov regularization.
   
3. **Experiment-3: Regularization Methods**
   - Compares classical matrix inversion techniques with various regularization methods including TSVD and iterative approaches.
   
4. **Experiment-4: Signal Analysis and System Identification**
   - Delves into signal processing techniques such as FFT, spectral power density, coherence functions, and wavelet transformations.
   
5. **Experiment-5: Damage Detection**
   - Focuses on detecting damage in structures by analyzing natural frequency responses and the effects of noise and damping.
