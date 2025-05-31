from setuptools import setup, find_packages

setup(
    name="stocksim",
    version="1.0.0",
    description="Monte Carlo simulation for stock and crypto price gain probability",
    author="Wesley Houser",
    packages=find_packages(),
    install_requires=[
        "numpy",
        "yfinance",
        "psutil",
        "setuptools<80",
        "pyinstaller==5.13.2"
    ],
    include_package_data=True,
    entry_points={
        "console_scripts": [
            "stocksim=main:main"
        ]
    },
)