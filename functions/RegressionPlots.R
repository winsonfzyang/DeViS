# Create diagnostic function
RegressionPlots <- function(fit){
  
  m <- list(
    l = 50,
    r = 50,
    b = 100,
    t = 100,
    pad = 4)
  
  k <-length(coef(fit)-1)-1 #k is number of predictors
  n <- nobs(fit) #n is total IDs 
  
  predictors <- c(names(coef(fit)))[-1] #get our predictors
  
  
  # Extract fitted values from lm() object
  Fitted.Values <-  fitted(fit)
  
  # Extract residuals from lm() object
  Residuals <-  resid(fit)
  
  # Extract Studentized residuals from lm() object
  Studentized.Residuals <- MASS::studres(fit)  
  
  # Extract fitted values for lm() object
  Theoretical.Quantiles <- qqnorm(Residuals, plot.it = F)$x
  
  # Square root of abs(residuals)
  Root.Residuals <- sqrt(abs(Studentized.Residuals))
  
  # Calculate Leverage
  Leverage <- lm.influence(fit)$hat
  
  # Cook's Distance
  cooks.d <- cooks.distance(fit)
  
  # Create data frame 
  # Will be used as input to plot_ly
  
  regMat <- data.frame(Fitted.Values, 
                       Residuals, 
                       Studentized.Residuals, 
                       Theoretical.Quantiles,
                       Root.Residuals,
                       Leverage,
                       cooks.d
  )
  
  # Plot using Plotly
  
  # Fitted vs Studentized.Residuals
  # For scatter plot smoother
  LOESS1 <- loess.smooth(Fitted.Values, Studentized.Residuals)  
  
  # Scale Location
  # For scatter plot smoother
  LOESS2 <- loess.smooth(Fitted.Values, Root.Residuals)
  
  # Residuals vs Leverage
  # For scatter plot smoother
  LOESS3 <- loess.smooth(Leverage, Residuals)
  
  plt1 <- regMat %>% 
    plot_ly(x = Fitted.Values, y = Residuals, 
            type = "scatter", mode = "markers", hoverinfo = "x+y", name = "Data",
            marker = list(size = 10, opacity = 0.5), showlegend = F) %>% 
    add_trace(x = LOESS1$x, y = LOESS1$y, type = "scatter", mode = "line", name = "Smooth",
              line = list(width = 2)) %>% 
    layout(title = "Studentized Residuals vs Fitted Values", 
           xaxis=list(title="Fitted Values",
                      zeroline = FALSE,
                      showline = TRUE,
                      showticklabels = TRUE,
                      showgrid = FALSE),
           yaxis=list(title="Studentized Residuals",
                      zeroline = FALSE,
                      showline = TRUE,
                      showticklabels = TRUE,
                      showgrid = FALSE),
           autosize = F, width = 500, height = 500, margin = m)
  
  # QQ Pot
  plt2 <- regMat %>% 
    plot_ly(x = Theoretical.Quantiles, y = Studentized.Residuals, 
            type = "scatter", mode = "markers", hoverinfo = "x+y", name = "Data",
            marker = list(size = 10, opacity = 0.5), showlegend = F) %>% 
    add_trace(x = Theoretical.Quantiles, y = Theoretical.Quantiles, type = "scatter", mode = "line", name = "",
              line = list(width = 2)) %>% 
    layout(title = "Q-Q Plot", 
           xaxis=list(title="Theoretical Quantiles",
                      zeroline = FALSE,
                      showline = TRUE,
                      showticklabels = TRUE,
                      showgrid = FALSE),
           yaxis=list(title="Studentized Residuals",
                      zeroline = FALSE,
                      showline = TRUE,
                      showticklabels = TRUE,
                      showgrid = FALSE),
           autosize = F, width = 500, height = 500, margin = m)
  
  
  plt3 <- regMat %>% 
    plot_ly(y = Leverage,
            type = "scatter", mode = "markers", hoverinfo = "x+y", name = "Data",
            marker = list(size = 10, opacity = 0.5), showlegend = F) %>% 
    add_trace(x= (1:length(Leverage)), y = (2*k + 2)/n, type = "scatter", mode = "line", name = "Smooth",
              line = list(width = 1)) %>%
    layout(title = "Leverages", 
           xaxis=list(title="Index",
                      zeroline = FALSE,
                      showline = TRUE,
                      showticklabels = TRUE,
                      showgrid = FALSE),
           yaxis=list(title="Leverages",
                      zeroline = FALSE,
                      showline = TRUE,
                      showticklabels = TRUE,
                      showgrid = FALSE),
           autosize = F, width = 500, height = 500, margin = m)
  
  
  plt4 <- regMat %>% 
    plot_ly(y = cooks.d, 
            type = "scatter", mode = "markers", hoverinfo = "x+y", name = "Data",
            marker = list(size = 10, opacity = 0.5), showlegend = F) %>% 
    add_trace(x= (1:length(cooks.d)), y = 4/(n-k-1), type = "scatter", mode = "line", name = "Smooth",
              line = list(width = 2)) %>% 
    layout(title = "Cook's Distance", 
           xaxis=list(title="Index",
                      zeroline = FALSE,
                      showline = TRUE,
                      showticklabels = TRUE,
                      showgrid = FALSE),
           yaxis=list(title="Cook's Distance",
                      zeroline = FALSE,
                      showline = TRUE,
                      showticklabels = TRUE,
                      showgrid = FALSE),           
           autosize = F, width = 500, height = 500, margin = m)
  
  
  list(plt1, plt2, plt3, plt4)
  
}
