library(shiny)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),  # Initialize shinyjs

  tags$head(
    tags$style(
      HTML("
        body {
          background-color: #f2f2f2;
          font-family: Arial, sans-serif;
        }
        .title {
          text-align: center;
          margin-top: 100px;
          margin-bottom: 40px;
          font-size: 36px;
          color: #333333;
        }
        .subtitle {
          text-align: center;
          margin-bottom: 20px;
          font-size: 24px;
          color: #333333;
        }
        .code-output {
          font-size: 20px;
          background-color: #ffffff;
          border: 1px solid #dddddd;
          padding: 10px;
          margin: 20px auto;
          width: 600px;
          max-width: 600px;
          white-space: pre-wrap;
          box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
          white-space: nowrap;
        }
        .code-output i {
          margin-right: 10px;
        }
        .button {
          display: block;
          margin: 0 auto;
          margin-top: 40px;
          background-color: #428bca;
          color: #ffffff;
          border: none;
          padding: 10px 20px;
          border-radius: 5px;
          font-size: 18px;
          cursor: pointer;
          transition: background-color 0.3s ease;
        }
        .button:hover {
          background-color: #3071a9;
        }
        .mainPanel {
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
        }")
    ),
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css")
  ),
  mainPanel(
    div(class = "title", "Version Not Available"),
    div(class = "subtitle", "Sorry, the iMESc version you are trying to run is not available."),
    div(class = "subtitle", "Please run the following code to access the application:"),
    uiOutput("codeOutput")
  )
)

server <- function(input, output) {
  code <- "shiny::runGitHub('imesc_beta','DaniloCVieira')"

  output$codeOutput <- renderUI({
    tags$pre(code, class = "code-output")
  })
}

shinyApp(ui = ui, server = server)
