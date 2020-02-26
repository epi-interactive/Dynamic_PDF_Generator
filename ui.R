##################################
# Created by EPI-interactive
# 27 Feb 2020
# https://www.epi-interactive.com
##################################


library(plotly)

fluidPage(
  title = 'Download a PDF report',
  sidebarLayout(
    sidebarPanel(style="margin-top: 20px;",
      numericInput("plot_example_1_n", "number of datasets to be simulated", 50, 25, 100, 5),
      numericInput("plot_example_1_mean", "The mean of the dataset to be simulated", 5, 1, 10, 1),
      downloadButton('downloadReport')
    ),
    mainPanel(
      plotlyOutput("plot_example_1", height="auto")
    )
  )
)
