# Experimentation and Signal Processing Repository

To improve the formatting of your provided content about the repository containing code and reports related to various experiments in signal processing, system identification, and model calibration, you can follow a structured approach. Here’s a revised version with better formatting, including headers, lists, and clearer sections:

---

# Repository Overview

This repository contains the code and reports related to various experiments in signal processing, system identification, and model calibration. The experiments span across topics such as:

- Harmonic oscillators
- Regularization techniques
- Signal analysis
- Damage detection

## Discussion and Key Insights

### Cross-Correlation Analysis

<p align="center">
  <img src="https://github.com/kirtan517/Helmet-Detection/blob/main/Images/labels.jpg" alt="Cross-Correlation Plot" width="800">
</p>

This plot shows the cross-correlation between the signals `x1_noise` and `x2_noise` for different lag values. It indicates how well the two signals are correlated at different time lags.

### Image Reconstruction Methods

<p align="center">
  <img src="https://github.com/guptaaditya746/Design-of-experiments/blob/main/img/Reference%20Image.tif" alt="Reference Image" width="800">
</p>

The true image is shown above. Three methods are employed: **TSVD**, **SVD**, and **Iterative Method** for different hyperparameters. This analysis helps to determine which methods and values can predict the result or approximate the true image effectively.

#### Reconstruction Without Regularization

<p align="center">
  <img src="https://github.com/guptaaditya746/Design-of-experiments/blob/main/img/Reconstruction%20using%20no%20regularization.tif" alt="Reconstruction Without Regularization" width="800">
</p>

#### Reconstruction Based on TSVD

<p align="center">
  <img src="https://github.com/guptaaditya746/Design-of-experiments/blob/main/img/Reconstruction%20based%20on%20TSVD%20for%20different%20values%20of%20K%20from%2050%20to%201700.tif" alt="TSVD Reconstruction" width="800">
</p>

#### Reconstruction Based on Tikhonov Regularization

<p align="center">
  <img src="https://github.com/guptaaditya746/Design-of-experiments/blob/main/img/Reconstruction%20based%20on%20Tikhonov%20for%20different%20alphas%20from%201%20to%207%2C%20with%20the%20increment%20of%201.tif" alt="Tikhonov Reconstruction" width="800">
</p>

#### Iterative Reconstruction

<p align="center">
  <img src="https://github.com/guptaaditya746/Design-of-experiments/blob/main/img/Reconstruction%20based%20on%20Iterative%20for%20different%20number%20of%20iterations%20from%2010%20to%2050%2C%20with%20the%20increment%20of%2010.tif" alt="Iterative Reconstruction" width="800">
</p>

### L-Curve for Tikhonov Regularization

Below is the L-curve plot for Tikhonov regularization:

<p align="center">
  <img src="https://github.com/guptaaditya746/Design-of-experiments/blob/main/img/L%20curve%20Tikhonov.tif" alt="L-Curve Tikhonov" width="800">
</p>

### Tomography Using Iterative Approach

An example of tomography using the iterative approach can be found in the last part of the documentation:

<p align="center">
  <img src="https://github.com/guptaaditya746/Design-of-experiments/blob/main/img/Effect%20of%20Iterations%20on%20Iterative%20Reconstruction.tif" alt="Effect of Iterations on Iterative Reconstruction" width="800">
</p>

---

### Summary

This structured format enhances readability and provides a clear presentation of the key insights and findings from your experiments. You can further customize the content to include specific details or findings as needed. If you have any additional requests or need further modifications, feel free to ask!

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/18202123/e17e524f-8bad-4db9-b8a7-02318126c8fb/paste.txt
## Table of Contents
- [Folders Structure](#folders-structure)
- [Experiments Overview](#experiments-overview)
- [Requirements](#requirements)
- [Usage](#usage)


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

Each folder contains the relevant code, data, and report files required for reproducing the results discussed in the corresponding sections.

## Experiments Overview

### Experiment-1: Calibration-1 Exercise Report
- **Key Sections:**
  - Harmonic Oscillator Model
  - Parameter Variation Observations
  - Noise Levels and Measurement Analysis
  - Cost Function Computation and Optimization
- **Objective:** Calibration of a harmonic oscillator model through parameter variation and optimization techniques.

### Experiment-2: Calibration Exercise Report: Exploring Equation of Motion
- **Key Sections:**
  - Review of Previous Calibration
  - Tikhonov Regularization
  - Comparison of Optimization Methods
- **Objective:** To explore the equation of motion and apply regularization techniques to enhance the calibration process.

### Experiment-3: Regularization Methods
- **Key Sections:**
  - TSVD and Iterative Regularization
  - Variation of Regularization Parameters
  - L-Curve Criterion Analysis
- **Objective:** To compare different regularization methods and assess their impact on signal processing tasks.

### Experiment-4: Signal Analysis and System Identification
- **Key Sections:**
  - FFT and DFT Analysis
  - Signal Averaging and Noise Reduction
  - Wavelet Transformation and Filter Analysis
- **Objective:** To perform comprehensive signal analysis and system identification using FFT, DFT, and wavelet transformations.

### Experiment-5: Damage Detection
- **Key Sections:**
  - Beam Response and Natural Frequencies
  - Impact of Damage Location and Severity
  - Cross-Spectral Density Analysis
- **Objective:** To detect structural damage by analyzing natural frequencies and the effects of noise on these frequencies.

## Requirements

- MATLAB (or Octave)
- Signal Processing Toolbox
- Optimization Toolbox

## Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/your-repository.git
   cd your-repository


To create a meaningful discussion section with images for a GitHub README, let's structure it based on the key experiments and findings from the document. Here’s a draft you can use:

---





Certainly! Below is an enhanced version of your README discussion section, incorporating more technical language, highlighting complex equations, and discussing the implications of the results. This will make the content more suitable for an audience with a strong background in signal processing and system identification.

---

# Experimentation and Signal Processing Repository

This repository contains the code and reports related to various experiments in signal processing, system identification, and model calibration. The experiments span across topics like harmonic oscillators, regularization techniques, signal analysis, and damage detection.

## Discussion and Key Insights

### 1. Harmonic Oscillator and System Identification

The harmonic oscillator model served as a foundational experiment, where the effects of varying system stiffness on the oscillatory behavior were explored. The governing equation is given by:

\[
m\frac{d^2x(t)}{dt^2} + c\frac{dx(t)}{dt} + kx(t) = F(t)
\]

where \(m\) is the mass, \(c\) is the damping coefficient, \(k\) is the stiffness, and \(F(t)\) is the external force. By adjusting the stiffness \(k\), we observed changes in the natural frequency of the system, confirming that higher stiffness results in higher frequency oscillations. The parameter estimation process involved minimizing the cost function:

\[
J(\theta) = \sum_{i=1}^n \left( y_i - \hat{y}(\theta, t_i) \right)^2
\]

where \(\hat{y}(\theta, t_i)\) is the model prediction at time \(t_i\) given parameters \(\theta\). The optimization was performed using `fminsearch` and `fmincon` in MATLAB, with the latter allowing for the incorporation of constraints on the parameter space.

<p align="center">
  <img src="data:image/png;base64,{{base64_image_data_here}}" alt="Harmonic Oscillator Model" width="800">
</p>

*Figure: Displacement over time for varying stiffness values in a harmonic oscillator. Higher stiffness results in higher frequency oscillations.*

### 2. Regularization in Model Calibration

To address ill-posed problems in model calibration, regularization techniques such as Tikhonov regularization and truncated singular value decomposition (TSVD) were employed. The regularized least squares problem is formulated as:

\[
\min_x \left\{ \|Ax - b\|^2 + \alpha \|Lx\|^2 \right\}
\]

where \(A\) is the system matrix, \(b\) is the observed data, \(x\) is the parameter vector, \(L\) is a regularization matrix, and \(\alpha\) is the regularization parameter. The choice of \(\alpha\) was guided by the L-curve criterion, which balances the trade-off between fitting the data and smoothing the solution.

<p align="center">
  <img src="https://github.com/guptaaditya746/Design-of-experiments/blob/main/img/L%20curve%20Tikhonov.tif" alt="L-curve Tikhonov" width="800">
</p>

*Figure: L-curve for Tikhonov regularization, illustrating the trade-off between the residual norm and the solution norm.*

The analysis showed that regularization not only stabilized the solution but also improved the robustness of parameter estimation, particularly in noisy environments. The comparison between TSVD and iterative regularization methods highlighted the importance of choosing appropriate regularization parameters and the impact of the number of iterations on the solution accuracy.

### 3. Signal Analysis and System Identification

Advanced signal processing techniques, including Fourier Transform (FFT), Discrete Fourier Transform (DFT), and Wavelet Transform, were applied to analyze and identify system dynamics from noisy signals. The power spectral density (PSD) and coherence functions provided insights into the frequency content of signals and the relationship between input and output.

The wavelet transform, in particular, allowed for time-frequency analysis, which is crucial for non-stationary signals. The transformation is defined as:

\[
W_x(a, b) = \frac{1}{\sqrt{|a|}} \int_{-\infty}^{\infty} x(t) \psi^*\left(\frac{t-b}{a}\right) dt
\]

where \(W_x(a, b)\) is the wavelet coefficient, \(a\) is the scaling parameter, \(b\) is the translation parameter, and \(\psi(t)\) is the mother wavelet.

### 4. Damage Detection in Structural Systems

The final set of experiments focused on structural health monitoring through the analysis of natural frequencies and mode shapes. The presence of damage was inferred from shifts in natural frequencies and changes in mode shapes, using techniques such as Cross-Spectral Density (CSD) analysis.

The observed shifts in frequencies were modeled using perturbation methods, where the frequency shift \(\Delta f\) is related to the damage parameter \(\Delta k\) by:

\[
\Delta f \approx \frac{1}{2f} \frac{\Delta k}{m}
\]

This relationship highlights the sensitivity of natural frequencies to changes in stiffness, which can be used as an indicator of damage location and severity.

<p align="center">
  <img src="https://github.com/guptaaditya746/Design-of-experiments/blob/main/img/Effect%20of%20Iterations%20on%20Iterative%20Reconstruction.tif" alt="Iterative Reconstruction" width="800">
</p>

*Figure: Effect of iterations on iterative reconstruction methods in detecting structural damage.*

## Table of Contents
- [Folders Structure](#folders-structure)
- [Experiments Overview](#experiments-overview)
- [Requirements](#requirements)
- [Usage](#usage)

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

Each folder contains the relevant code, data, and report files required for reproducing the results discussed in the corresponding sections.

## Experiments Overview

### Experiment-1: Calibration-1 Exercise Report
- **Key Sections:**
  - Harmonic Oscillator Model
  - Parameter Variation Observations
  - Noise Levels and Measurement Analysis
  - Cost Function Computation and Optimization
- **Objective:** Calibration of a harmonic oscillator model through parameter variation and optimization techniques.

### Experiment-2: Calibration Exercise Report: Exploring Equation of Motion
- **Key Sections:**
  - Review of Previous Calibration
  - Tikhonov Regularization
  - Comparison of Optimization Methods
- **Objective:** To explore the equation of motion and apply regularization techniques to enhance the calibration process.

### Experiment-3: Regularization Methods
- **Key Sections:**
  - TSVD and Iterative Regularization
  - Variation of Regularization Parameters
  - L-Curve Criterion Analysis
- **Objective:** To compare different regularization methods and assess their impact on signal processing tasks.

### Experiment-4: Signal Analysis and System Identification
- **Key Sections:**
  - FFT and DFT Analysis
  - Signal Averaging and Noise Reduction
  - Wavelet Transformation and Filter Analysis
- **Objective:** To perform comprehensive signal analysis and system identification using FFT, DFT, and wavelet transformations.

### Experiment-5: Damage Detection
- **Key Sections:**
  - Beam Response and Natural Frequencies
  - Impact of Damage Location and Severity
  - Cross-Spectral Density Analysis
- **Objective:** To detect structural damage by analyzing natural frequencies and the effects of noise on these frequencies.

## Requirements

- MATLAB (or Octave)
- Signal Processing Toolbox
- Optimization Toolbox

## Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/your-repository.git
   cd your-repository
   ```

This version of the README is now more technically detailed and includes complex equations, making it suitable for an audience with a strong background in these fields.