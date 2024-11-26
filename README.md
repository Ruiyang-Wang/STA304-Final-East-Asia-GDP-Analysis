# East Asia GDP Analysis

## Overview

This repository provides the framework for analyzing GDP trends, labor dynamics, and demographic effects in East Asia, with the help of *Telling Stories with Data*. The structure and scripts are designed to streamline analysis, visualization, and modeling for comprehensive insights. Adjustments to the structure or content can be made based on project needs.

## File Structure

The repository is organized as follows:

-   **`data/`**:
    -   `raw_data`: Contains the original raw datasets obtained from public sources.
    -   `analysis_data`: Contains the cleaned and processed datasets used for analysis.
    -   `simulated_data`: Contains the simulated dataset used for analysis.

-   **`models/`**:
    -   Stores fitted models and visualizations saved as `.rds` files for reuse and portability.

-   **`other/`**:
    -   Contains supplementary materials, including relevant literature, sketches, and any LLM-related chat logs.

-   **`paper/`**:
    -   Includes all files required for the final paper, such as the Quarto document, reference bibliography, and the generated PDF.

-   **`scripts/`**:
    -   Holds R scripts for data cleaning, simulations, model generation, and visualization.

## Statement on LLM Usage

LLMs like ChatGPT were utilized during the project to:
-   Generate R code for data analysis, model building, and visualization.
-   Assist with structuring the Quarto document and drafting sections of the paper.

The assistance provided by LLMs was focused on improving efficiency and accuracy. A record of LLM interactions is available in `other/` for transparency.

## Some Checks

- [ ] Remove files or directories that are unnecessary for the final analysis or presentation.
- [ ] Verify and update comments in all R scripts for clarity.
- [ ] Ensure the README checklist is removed once all items are addressed.
