Please read the How to to make sure you are using the app as intented.
Contact me @ winsonfz.yang@gmail.com for feedback or use the link to file bugs/features/pull requests!

1. Upload your data file in CSV vor XLS format. R default options for will apply except for missing values where both (NA) and dot (.) are treated as missing. If your data has columns with other non-numeric missing value codes then they will be treated as factors.

2. The UI is dynamic and changes depending on your choices of options, x ,y, filter, group and so on.

3. It is assumed that your data is tidy and ready for plotting (long format). Whether you select one or more y variable(s), the app will automatically stack the data using `tidyr::gather` and result in yvars and yvalues variables. The internal variable yvalues is used for y variable mapping and the app automatically split the plot by selecting additional row split as `yvars` and by setting Facet Scales to `free_y`. The user can override this by specifying different facets splits and Facet Scales options as he sees fit. To change Facet Scales and many other options go to **Graph Options tab**.

4. x and y variable(s) input allow numeric and factor variables.

5. If you select a mix of factor and continuous variables for the y variables, all selected variables will be transformed to factor.

6. The **Inputs** tab allow the user to do many data operations on the data before the plotting.
    + In the **Filters** sub-tab:  
    There is six slots for Filter variables. ***Filter variable (1), (2),(3)*** and ***Filter continuous (1), (2),(3)***
    The Filters are applied sequentially. Values shown for ***Filter variable (2)*** will depend on your selected data exclusions using ***Filter variable (1)*** and so on. The first three filters accept numeric and non numeric columns while the last three are sliders and only work with numeric variables. To avoid potential performance issues, the first three filters only show variables with a default ***maximum number of levels*** of 500 and you can adjust it to your needs.  
    + In the **Categorize/Rename** sub-tab:    
    The ***Recode into Binned Categories*** helps you change a numeric variable into categorical variable by separating into bins (or groups). For example, if you want to separate age into young and old into three groups, you will have to specify the number of groups using the **N of Cut Breaks** option. This option will only appear if there is a variable to bin.
    Use ***Treat as Categories*** field to change a numeric variable to factor without binning. This helps when you want to group or color by numerical variable that has few unique values e.g. 1,2,3.  
    Use ***Custom cuts of this variable...*** to cut a numeric variable to factor using specified cutoffs, by default a text input is created and  comma separated min, median, max are used. You can override with any values of your liking. An optional  ***Treat as Numeric*** checkbox can be selected to recode the created custom cuts variable to numeric values that start with 0.
    The *Change labels of this variable* is now dynamic!. This field allows you to select as many factor/character variable(s) as you want in order to input in a comma separated list of new labels. By default, value1, value2,...valuen will be populated in the field. Make sure to edit/type keeping the correct number of new labels otherwise the plot will not be generated as the recoding will fail with this message `Error: number of levels differs`. You can combine levels by repeating a value with special attention to spaces e.g. 1,1,2. You can also include line breaks using `\n`.
    + In the **Simple Rounding** sub-tab:  
    This option allows you to round your specified variables to N number of digits.  
    + In the **Reorder Variables** sub-tab:  
    There is a group of options to allow you to reorder a categorical variable is several ways. ***Reorder This Variable:*** allows you to select and reorder a categorical variable ***By the:***  `Median`,`Mean`,`Minimum` or `Maximum` of ***Of this Variable:*** where you pick a numerical variable of your choice the default is to use the `Median` of `yvalues`. You can also check the ***Reverse Order ?*** box to have the order inverted. The ***Custom Reorder this variable*** will create an input field with unique values of the selected variable and then you can drag and drop the values to the order of your choice. Finally the  ***Change labels of this variable:*** is an additional place where you can change the names of the levels of a character variable like the one holding the names of the selected y variables `yvars` which is handy if you want to change the names in the facet labels.  

7. The **X & Y Axes/Labels** tab is where you input the data for plotting. There are several options for you to choose in this tab.
    + **x/y variable** is where you input the x and y variables which you are interested in. The variable you put here will also used to crate a regression model. Current version of DEViS does not allow you to have multiple predictors. This will be added in future developments. You can input as many y variables as you want, but it is only for graphing purposes. Regression analysis will only be run with the first y variable.
    + **x/y axis label** is the label of the x/y-axis which you wish to relabel. If this is not used, the label you see on the axes will be the default name used for the variables in your data.
    + DEViS also allows you to add covariates using the **Add covariates (optional)** option. However, the current version does not allow you to view the fitted regression model. It only shows the relationship between the x and y variables, without taking into account the covariates. However, you can view the influence of the covariates in the regression summary.
    + There are also other options such as taking the log of the variables using the ***Log axis*** and ***Log 10^x Format***. You can also rotate, or customize at which point of the variables you want to have the ticks (point labels).

8. The **Graph Layout** tab allows the user to manipulate the overall appearance of the graph, and also for the user to input the variables of interests.  
    + The ***Graph Size/Zoom*** sub-tab allows users to change the size of the plot, and the range of the variables to show. You can also modify background color and legend(s), adjust multiple graphs, add reference, and additional options to choose.

9. The **Graph Features** allows users to control which features and layers to include.  
    + The **Plot types, Points, Lines** sub-tab has options for `Points`, `Jitter` and `Lines` (optionally grouped) and with the user ability to control shapes, line types, transparency, and overriding mapped colors or sizes.  
    + The **Color/Group/Split/Size/Fill Mappings** sub-tab has options for mapping `Color`, `Group` and `Split` (faceting in ggplot jargon),`Color` and `Fill`. Splits can be done up to two levels by column and/or by row. The user is encouraged to experiment to get familiar with the various options and capabilities.  
    + The **Boxplots** sub-tab brings limited boxplots support. Carefully choose grouping expecially when the x axis variable is continuous, you can change the **Group By:*** variable in the ***Color/Group/Split/Size/Fill Mappings*** to better reflect your needs.  
    + The **Histogram/Density** sub-tab is relevant when no y variables are selected and when the x variable is continuous. It allows you to plot density and or histogram. You can also plot a mean line across the histogram, whether separated by groups or overall mean.
    + To include a trend line experiment with **Smooth/Linear/Logistic Regressions**. Make sure that data is compatible with the smoothing method used for example the ***Smoothing Method*** `logistic` expects a numerical 0/1 variable.  
    + The **Correlation Coefficient** sub-tab allows you to add the correlation coefficient into the plot by clicking the `Add correlation coefficient to the plot` check box.  Current version of DEViS does not support this function yet.

10. The **Data** tab is where your data is presented in a table form. The table will be updated interactively based on the filters you input. You also have the option to download the new data as an excel spreadsheet.

11. Within the **Scatter/Regression Plot** tab contains three sub-tabs.
    + The **Plot** sub-tab contains the main output of the graph. You have the freedom to choose whether you want to view the plot as **ggplot** or **plotly**. You also have the option to save the plot for exporting wit the **Save plot** star button.
    + The **Diagnostics** sub-tab contains the regression diagnostics tests for your model. You will have to include covariates into the model as this tab assumes that you are conducting multiple or hierarchical regression at this point. Future updates will allow you to conduct simple regression diagnostics. Diagnostics conducted in this sub-tab includes **studentized residuals**, **leverages**, **cook's distance**, **dfbetas and dffitsbetas**, and **multicollinearity**. The last tab shows the summary of the diagnostics.
    + The **Regression Summary** sub-tab shows the summary of the regression model that you have created. All summary includes a standardized beta coefficients for comparisons between predictors. If there are no covariates in your model, the **Covariates summary** section will not show any output. Only the **Regression summary** will show results in this case. If your model includes covariates, **covariates summary**, and **model change summary** will be shown too. The **Regression effect size** shows the effect size of each predictor in your model.

12. The **Export Plots** tab has was initially based on Mason DeCamillis ggplotLive app and then completely re-written by <a href="https://github.com/daattali">Dean Attali</a>. Once a plot is saved in the **Scatter/Regression Plot** tab by providing a name and hitting the **Save plot** star button it will become available here. You can export in portrait, landscape and multiple plots per page.

13. The **Descriptive Stats** tab added the ability to view the descriptive statistics of your variables by group. The table output is also made almost-ready for publication. Some touch up is still needed to be done if you wish to utilize this table.

14. The **Plot Code** tab returns the R-code for the plot for reproducibility. However, some inputs are still not yet supported.

15. The **E-mail** tab allows you to report bugs, send a feedback, and request for new features or updates. You can choose to uplaod an attachment to show what errors you have encountered. Click `send mail` to send the e-mail after completing the form. Currently this feature is not working, so if you have want to report bugs, send a feedback, and request for new features or updates, please send an e-mail to winsonfz.yang@gmail.com.


Contact me @ winsonfz.yang@gmail.com for feedback or use the link to file bugs/features/pull requests!
<a href="https://github.com/winsonfzyang/DEViS/issues">Click Here to go to github</a>

*Winson Yang 2018*
