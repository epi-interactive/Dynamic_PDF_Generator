##################################
# Created by EPI-interactive
# 27 Feb 2020
# https://www.epi-interactive.com
##################################

fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")
  ),
  div(class="col-xs-3 sidebar",
    div(
      h1("PDF Generator"),
      hr(),
      numericInput("plot_example_1_n", "Number of datasets to be simulated", 50, 25, 100, 5),
      numericInput("plot_example_1_mean", "The mean of the dataset to be simulated", 5, 1, 10, 1),
      downloadButton('downloadReport', icon= NULL)
    ),
    tags$img(src="images/Powered_Epi_Logo.png", width= "90%")
  ),
  div(class="col-xs-9 main",
    plotlyOutput("plot_example_1", width="800px")
  )
)
