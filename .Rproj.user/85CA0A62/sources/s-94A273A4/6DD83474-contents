#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  pars <- reactive({
    req(input$mu)
    c(mu = input$mu)
  })
  
  observeEvent(pars(), {
    session$sendCustomMessage(
      "model-data",
      generate_model_data(vdp, pars(), seq(-10, 10))
    )
  })
  
  observeEvent(input$mu, {
    print(input$mu)
  })
}
