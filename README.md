# Langrage and Least Comparison

## Overview

This project compares **Lagrange interpolation** and **Least Squares Regression** using motion/simulation data.
The notebook reads a dataset of **time** versus **Y position**, then builds two models:

* **Lagrange interpolation** using a selected subset of data points
* **Least squares polynomial regression** using the same selected points

The goal is to see which method fits the simulation data better and to measure the error between the predicted values and the actual values.

## Project Idea

The data in `analysis/motion_data.csv` represents a motion simulation recorded over time.
The notebook uses that simulation data to:

1. Plot the original motion points
2. Build a Lagrange interpolation curve
3. Build a polynomial least-squares curve
4. Compare both methods using error metrics
5. Display the final result visually and numerically

## Main Features

* Reads motion data from CSV
* Uses a reduced subset of points to avoid overfitting and oscillation
* Implements Lagrange interpolation manually
* Uses `numpy.polyfit()` for least-squares regression
* Calculates:

  * Absolute Error
  * Relative Percent Error
  * Mean Absolute Error
  * Mean Relative Percent Error
* Shows comparison plots for the two methods

## Files in the Repository

* `lagrange.ipynb` — main notebook containing the full comparison
* `analysis/motion_data.csv` — simulation dataset used in the notebook
* `simulation/windfield/mlib/` — bundled Lua math/collision library files included with the project

## How the Notebook Works

### 1. Load the simulation data

The notebook reads the CSV file and extracts the `time` and `y` columns.

### 2. Select a smaller set of points

Instead of using all points, the notebook keeps only every 7th point.
This makes the interpolation more stable and reduces large oscillations.

### 3. Lagrange interpolation

A custom Lagrange function is used to generate a smooth curve that passes through the selected points.

### 4. Least squares regression

A cubic polynomial is fitted to the same selected points using least squares.

### 5. Error comparison

The notebook compares the predicted values against the actual values and reports the error for each method.

## Results

The notebook prints a table containing:

* Time
* Actual Y
* Predicted Y
* Absolute Error
* Relative Percent Error (%)

It also plots:

* the original simulation data
* the points used for the comparison
* the Lagrange curve
* the least-squares curve

From the notebook output, Lagrange interpolation gives a smaller mean error for the selected points in this dataset.

## Requirements

* Python 3
* Jupyter Notebook or JupyterLab
* `pandas`
* `numpy`
* `matplotlib`

## How to Run

1. Clone the repository.
2. Open `lagrange.ipynb` in Jupyter Notebook or JupyterLab.
3. Run the cells from top to bottom.
4. View the comparison table and plots.

## Example Output

The notebook produces a visual comparison of the two methods and prints the error values so you can judge which method fits the motion data better.

## Conclusion

This project demonstrates the difference between **exact interpolation** and **approximation by regression** on simulation data.
It is a useful example of how mathematical models behave when applied to real sampled motion data.

