# Memetic Portfolio Optimization

This code implements a memetic algorithm for portfolio optimization, focusing on generating an efficient frontier that allows comparison between risk and return across different asset allocations.
How to Run the Code
Prerequisites

**Ensure that MATLAB is installed and properly configured on your system.**

# Procedure

    Open the Script
    Open the file titled: memetic_portfolio.m.

    Select Market
    Choose the market by selecting the appropriate name within the code.

    Set Parameters
    Specify the following parameters based on your requirements:
        k: Number of assets (cardinality constraint).
        s: Number of pre-assigned assets (pre-assignment constraint).

    Run the Code and Extract Results

        To save the results into an Excel file, use the following command in the script:

        matlab

        xlswrite('name.xlsx', [F1(EF)', -F2(EF)'], 'sheet1', 'A2');

            F1: Represents the risk values.
            -F2: Represents the return values (negated for alignment with conventions).
            EF: Represents the efficient frontier.

        Click RUN to execute the script.

    The resulting output includes a graph with:
        Risk on the x-axis.
        Return on the y-axis.

    This graph visualizes the efficient frontier for the selected asset allocation.

# Notes

    Ensure that the necessary dependencies are available for the script to run.
    The Excel output will be saved as name.xlsx in the working directory, with the results starting at cell A2 in sheet1.
