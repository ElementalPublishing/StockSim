# Stock Market Monte Carlo Simulation

A Python tool to estimate the probability of gain for stocks, crypto, or indices using Monte Carlo simulation.

## Requirements

- Python 3.12.x (tested with 3.12.0)
- See `requirements.txt` for required packages

## Install dependencies

```sh
pip install -r requirements.txt
```

## Run

```sh
python main.py
```

## Build EXE (optional)

To build a Windows executable with my custom icon:

```sh
pyinstaller --icon=shaggy.ico --name=StockSim main.py
```

- Your EXE will be in the `dist` folder with the name StockSim.



## Notes

- Compatible with Python 3.12.0, PyInstaller 5.13.2, and setuptools <80 (tested with 79.0.1).
- Log files are saved in the `logs` folder, with a new file for each run.