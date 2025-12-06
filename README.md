# SIC-Based Change-Point Detection for Climate Time Series  
### Simulation Code for SDET Term Paper (2024–2025)

This repository contains all MATLAB code, data generators, and analysis scripts used in the term paper *“SIC-Based Change-Point Detection in Climate Time Series”*.  
The project evaluates two decision rules—**Naive SIC** and the **Critical bias-corrected SIC rule**—on synthetic climate-like datasets, including AR(2) noise processes and controlled mean-shift experiments.

---

## 📌 Introduction

Detecting structural breaks in climate time series is essential for identifying abrupt changes in environmental regimes, such as shifts in atmospheric CO₂, radiocarbon activity, or regional temperature dynamics. These datasets often evolve slowly but may experience sudden transitions driven by natural variability or anthropogenic forcing. Simple visual inspection or classical trend analysis often fails to separate gradual fluctuations from genuine structural changes. This motivates the use of formal statistical change-point methods.

A principled approach to change-point detection uses the **Schwarz Information Criterion (SIC/BIC)** to compare a no-change (single-segment) model against a one-change (two-segment) model. A change is detected when the penalized likelihood of the two-segment model sufficiently improves over the null. However, climate time series frequently exhibit autocorrelation, which can distort SIC-based inference and inflate false detections if ignored.

This project adopts an SIC-based methodology adapted for climate-like dependence structures. Simulated datasets include mean-shifted Gaussian series and AR(2) autoregressive series without changes. Two decision rules are studied:

- **Naive SIC Rule:** Direct comparison of SIC(no-change) vs SIC(two-segment).  
- **Critical Rule:** A corrected rule using a Monte-Carlo-calibrated threshold \(c_t\) to reduce false positives.

Extensive Monte-Carlo experiments evaluate hitrates, false-detection rates, detection delay, and asymptotic convergence, providing practical insights into the reliability of SIC-based change-point detection when applied to autocorrelated climate data.

---

I have attached a guide to how to run the simulations systematically in Simulations.md

