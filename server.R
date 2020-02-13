library(knitr)


if (is.null(suppressMessages(webshot:::find_phantom()))) { webshot::install_phantomjs() }

function(input, output) {
  plot_function <- function(n, mean) {
    plot_ly(x = ~rnorm(n), type = "box") %>%
      add_trace(x = ~rnorm(n, mean)) %>% 
      layout(xaxis = list(visible=T, showgrid=F, showline=T, mirror=T,
                          zeroline=F, zerolinecolor="#fff", title = paste0("norm(", n, ")")),
             yaxis = list(visible=T, showgrid=F, showline=T, mirror=T,
                          zeroline=F, zerolinecolor="#fff"),
             showlegend = FALSE)
  }
  
  plot_example_1_chart <- reactive({plot_function(input$plot_example_1_n, input$plot_example_1_mean)})
  
  output$plot_example_1 <- renderPlotly({plot_example_1_chart()})
  
  output$downloadReport <- downloadHandler(
    filename = "report.pdf",
    
    content = function(file) {
      src <- normalizePath('report.Rnw')
      
      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      owd <- setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'report.Rnw', overwrite = TRUE)
      
      out = knit2pdf('report.Rnw', clean = TRUE)
      file.rename(out, file) 
    }
  )
}
