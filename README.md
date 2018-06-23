# DEViS

DEViS stands for Data Exploration Visualization and Statistics. DEViS enables you to quickly explore, visualize, your data, and run some analyses to detect trends and insights. You can do scatter plots, dotplots, boxplots, barplots, histograms and densities.

**Export Plots**. Once a plot is saved in the **Scatter/Regression Plot** tab by providing a name and hitting the **Save plot** star button it will become available for exporting. You can export in portrait, landscape and multiple plots per page.  


### CSV and EXCEL Data Input

DEViS allows you to upload your data in either csv or excel format. However, do note that delimiters are not placed in the code.
```
if (grepl("csv", "youruploadeddata.csv"))
  values$maindata <- read.csv("youruploadeddata.csv", na.strings = c("NA",".", ""))
else
  values$maindata <- read_xlsx("youruploadeddata.csv", na = c("NA",".", ""))

```

### Data Manipulations
* Up to six sequential filters for categorical and continuous variables
* Change continuous variable to be treated as categorical
* Renaming and reordering of the levels of a categorical variable
* Rounding a numerical variable to a specified number of digits

### Send E-mail
* There is a tab that allows users to send an e-mail to the developer to report bugs, request updates or new features, and provide feedback
* The E-mail tab is currently not working. If you want to report bugs, request updates or new features, and provide feedback, please send an e-mail to **winsonfz.yang@gmail.com**.

### Plotly output
* Option to view your graph as an interactive plotly graph instead of ggplot.
* Plotly graphs allow you to zoom, view graphs by subset, or view individual data points without having to filter your data. However, the statistics behind the graph still depends on the data input you feed, not by the interactive options in the plotly graph.

### Summary/Regression functions
There are a few regression options for you to choose to run your analyses. DEViS will also return the statistics in a separate tab. If you want to see more types of regression and options, please send an e-mail to **winsonfz.yang@gmail.com**.
* Smooth/Linear/Logistic Regressions
* Regression diagnostics
* Regression model summary statistics
* Correlation Coefficients

### `ggplot2` built-in functionality
* `facet_grid` and `facet_wrap`
* Group, color, size, fill mappings
* Controlling y and x axis labels, legends and other commonly used theme options.

### Running Information
Make sure to have all required packages installed

shiny, shinyjs, readxl, ggplot2, plotly, ggrepel, scales, DT, tidyr, dplyr, car, lm.beta, lmSupport,
sendmailR, Hmisc, quantreg, markdown, rlang,and lazyeval.

The app will try to install ggkm and table1 (if not found) using the commands below:
```
if (!require("pacman")) install.packages("pacman")
  pacman::p_load(shiny, shinyjs, readxl, ggplot2, plotly, ggrepel, scales, DT, tidyr, dplyr, car, lm.beta, lmSupport,
  sendmailR, Hmisc, quantreg, markdown, rlang,and lazyeval)
devtools::install_github("sachsmc/ggkm")
devtools::install_github("benjaminrich/table1")
```
Make sure that you are using this version of ggrepel
```
devtools::install_github("slowkow/ggrepel@0.6.6")

```
