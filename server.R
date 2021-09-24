##################################
# Created by EPI-interactive
# 27 Feb 2020
# https://www.epi-interactive.com
##################################

function(input, output) {
  plot_function <- function(n, mean) {
    x <- list(visible=T, 
              showgrid=F, 
              showline=T, 
              mirror=T,
              zeroline=F, 
              zerolinecolor="#fff", 
              title = paste0("<b>Norm(", n, ")</b>"))
    y <- list(visible=T, 
              showgrid=F, 
              showline=T, 
              mirror=T,
              zeroline=F, 
              zerolinecolor="#fff",
              categoryarray = c("<b>Trace 1</b>", "<b>Trace 2</b>"), 
              categoryorder = "array")
    
    hoverlabel <- list(
      bgcolor = "white", 
      bordercolor = "black",
      align = "left",
      font=list(
        size = 14,
        color = "black")
    )
    
    plot_ly(type = "box") %>%
      add_trace(x = ~rnorm(n), 
                name = "<b>Trace 1</b>",
                fillcolor = '#CEF0F4',
                marker = list(color = '#01515E'),
                line = list(color = '#01515E')
                ) %>% 
      add_trace(x = ~rnorm(n, mean), 
                name = "<b>Trace 2</b>",
                marker = list(color = '#D66100'),
                fillcolor = '#FBF2DC',
                line = list(color = '#D66100')
                ) %>% 
      layout(xaxis = x,
             yaxis = y,
             showlegend = FALSE,
             hoverlabel = hoverlabel)
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
