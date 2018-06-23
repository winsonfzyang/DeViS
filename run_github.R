# Install Shiny
if (!suppressWarnings(require(shiny, quietly=TRUE))) {
  install.packages("shiny")
  library(shiny)
}

# Run DEViS using runGitHub
runGitHub("DEViS", "winsonfzyang")
