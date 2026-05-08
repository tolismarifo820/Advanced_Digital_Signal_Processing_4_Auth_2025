# Advanced Digital Signal Processing 4 Auth 2025

This repository contains Homework 4 for the Advanced Digital Signal Processing class at the Aristotle University of Thessaloniki (AUTH). 

## Author
* **Apostolos Marifoglou** (ID: 10879)

## Project Overview
This project focuses on **Inverse Filtering and Deconvolution** techniques. The main objective is to synthesize a signal using an Autoregressive (AR) model and subsequently recover the original white noise driving sequence by applying an inverse Moving Average (MA) filter.

### Methodology
* **Signal Synthesis**: An AR(4) signal $x(n)$ is generated using a white Gaussian noise sequence $w(n)$ of length $N=1024$. The specific AR parameters used are $a_1 = -1.352$, $a_2 = 1.338$, $a_3 = -0.662$, and $a_4 = 0.240$.
* **Deconvolution (Inverse Filtering)**: The generated AR signal $x(n)$ is passed through a Moving Average (MA) filter (an FIR filter) constructed with the AR system's parameters. This inverse filter essentially deconvolves the system to estimate the original input sequence, producing the output $e(n)$.
* **Statistical Evaluation**: The success of the deconvolution is evaluated by calculating the auto-correlation ($R_{ww}$) of the true input and the cross-correlation ($R_{we}$) between the true input $w(n)$ and the estimated input $e(n)$. A sharp peak at zero lag in the cross-correlation plot confirms the successful recovery of the original driving sequence.

## Repository Structure
* `10879_Marifoglou_ex4.pdf`: The official assignment report containing the theoretical background, execution steps, and visual plots of the signals and correlations.
* `main_ex4.m`: The primary MATLAB script that orchestrates the overall execution, parameter setup, and plotting of the results.
* `synthesize.m`: A MATLAB function responsible for generating the AR(4) signal from the white noise driving sequence.
* `getDeconvolution.m`: A MATLAB function that performs the inverse MA filtering to recover the estimated input sequence.

## Technologies Used
* **MATLAB**: Utilized for simulating the AR system, applying inverse filters, computing statistical correlations, and generating analytical plots.

* For the original .wav files email me at tolismarifo820@gmail.com
