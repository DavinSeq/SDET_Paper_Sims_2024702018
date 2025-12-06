# Climate Change-Point Detection with SIC/BIC

This repository contains MATLAB code and LaTeX material for a term paper on
SIC/BIC-based change-point detection applied to climate-like time series.

## Overview

We compare two decision rules for detecting a single mean shift:

- **Naive rule**: detect a change if `SIC(two-segment) <= SIC(single-segment)`.
- **Critical rule**: detect a change if `SIC(two-segment) + c_t <= SIC(single-segment)`,

where `c_t` is a Monte Carlo–calibrated critical value that controls false
detections.

The methods are tested both under:
- a **true change-point model** (for hitrate / power), and
- an **AR(2) no-change model** (for false detection / Type-I error).

## Repository Structure

- `src/` – MATLAB source code
  - `main_hitrate_sim.m`: runs hitrate simulations and plots original vs critical hitrates for different δ.
  - `main_false_detection.m`: runs false-detection simulations over multiple window lengths.
  - `compute_hitrate_both.m`: function that computes hitrate for Naive and Critical rules.
  - `histogram_gen.m`: function that computes false-detection histograms.
- `data/` – input CSV files (`ar2_data.csv`, `delta_*.csv`, etc.)
- `figs/` – saved figures (PNG/PDF) from the simulations.
- `paper/` – LaTeX term paper and bibliography.

## Requirements

- MATLAB (tested with R20xx)
- CSV files in `data/`:
  - `ar2_data.csv` (AR(2) null data)
  - `delta_*.csv` for each shift size δ used in the hitrate simulation.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/climate-changepoint-sic.git
   cd climate-changepoint-sic
