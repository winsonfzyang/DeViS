# DeViS

R Shiny app as a handy inteface to ggplot2. It enables you to quickly explore, visualize, your data, and run some analyses to detect trends and insights. You can do scatter plots, dotplots, boxplots, barplots, histograms and densities.

**Export Plots** and **Plot Code** tabs. Once a plot is saved in the **Scatter/Regression Plot** tab by providing a name and hitting the **Save plot** star button it will become available for exporting. You can export in portrait, landscape and multiple plots per page.  
**Plot Code** will let you look at the source code that generated the plot with the various options.


### CSV and EXCEL Data Input 
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
* There is a tab that allows users to send an e-mail to the devloper to report bugs, request updates or new things, and provide feedback

### Plotly output
* Option to view your graph as an interactive plotly graph instead of ggplot.

### Summary/Regression functions 
* Smooth/Linear/Logistic Regressions
* Regression diagnostics
* Regression model summary statistics
* Correlation Coefficients

### `ggplot2` built-in functionality
*`facet_grid` and `facet_wrap`
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

