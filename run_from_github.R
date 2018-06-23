# Install Shiny
if (!suppressWarnings(require(shiny, quietly=TRUE))) {
  install.packages("shiny")
  library(shiny)
}

# Easiest way is to use runGitHub
runGitHub("DEViS", "winsonfzyang")
