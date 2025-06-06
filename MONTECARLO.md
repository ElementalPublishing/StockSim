# Monte Carlo Simulation Methodology

## Overview

StockSim uses a **Monte Carlo simulation** to estimate the probability that a stock, cryptocurrency, or index will gain value over a chosen investment period.  
This approach generates thousands or millions of possible future price paths, based on historical price data, to provide a probabilistic forecast rather than a single prediction.

---

## Type of Monte Carlo Simulation

**This project implements a Geometric Brownian Motion (GBM) Monte Carlo simulation with drift.**

- **Geometric Brownian Motion** is the standard model for simulating stock prices in quantitative finance.
- It assumes that log returns are normally distributed and that prices evolve continuously and multiplicatively.
- The model incorporates both a deterministic trend (**drift**, based on mean return) and randomness (**volatility**, based on historical standard deviation).

---

## Mathematical Model

For each simulation, the price evolves according to:

```
S_{t+1} = S_t \times \exp\left( (\mu - 0.5 \sigma^2) \Delta t + \sigma \sqrt{\Delta t} \cdot Z \right)
```

Where:
- `S_t` = price at time t
- `μ` = annualized mean return (**drift**)
- `σ` = annualized volatility (standard deviation of log returns)
- `Δt` = time step (1/252 for daily steps)
- `Z` = random draw from a standard normal distribution

**Drift is explicitly included in the simulation, ensuring that the average trend of the asset is reflected in the simulated price paths.**

In your code, this is implemented as:
```python
drift = (mean_return - 0.5 * volatility ** 2) * dt
vol = volatility * np.sqrt(dt)
increments = drift + vol * rand_norm
log_returns = increments.sum(axis=1)
ending_price = start_price * np.exp(log_returns)
```

---

## Simulation Steps

1. **Estimate Parameters:**  
   - Historical price data is fetched for the selected symbol.
   - Daily log returns are calculated.
   - The mean and standard deviation of log returns are annualized to get drift (`μ`) and volatility (`σ`).

2. **Simulate Price Paths:**  
   - For each simulation, generate a sequence of random normal variables.
   - Apply the GBM formula (with drift) to simulate the price path over the chosen number of years.

3. **Aggregate Results:**  
   - Repeat the simulation for millions of paths (as allowed by your system’s RAM and CPU).
   - Collect statistics: probability of gain, median ending price, min/max, etc.

---

## Why GBM with Drift?

- GBM is widely used in finance for its mathematical tractability and its ability to capture the compounding, random-walk nature of asset prices.
- Including drift ensures that the simulation reflects the average historical trend of the asset, not just its volatility.
- It is the foundation for the Black-Scholes option pricing model and many other financial tools.

---

## Limitations

- GBM assumes constant drift and volatility, and log-normal price distribution, which may not capture all real-world market behaviors (e.g., jumps, fat tails, volatility clustering).
- Results are only as good as the historical data and the model’s assumptions.

---

## References

- [Hull, J. C. (2018). Options, Futures, and Other Derivatives.](https://www.pearson.com/us/higher-education/program/Hull-Options-Futures-and-Other-Derivatives-10th-Edition/PGM334940.html)
- [Wikipedia: Geometric Brownian Motion](https://en.wikipedia.org/wiki/Geometric_Brownian_motion)
- [Wikipedia: Monte Carlo Method in Finance](https://en.wikipedia.org/wiki/Monte_Carlo_methods_in_finance)

---

*This document describes the mathematical and statistical methodology used in StockSim’s simulations.*