
##샤이니 특강 과제: 회귀분석 수행할 수 있는 APP만들기 (mtcars, iris, acs, radial 이용)

require(shiny)
require(moonBook)

library(ggplot2)


fluidPage(
  titlePanel('Multiple Regression Analysis 0613 moonjeong'),
  sidebarLayout(
    sidebarPanel(
      radioButtons("data","Select data",choices=c("mtcars","iris","acs","radial")),
      selectInput('y', 'Response variable(종속변수)',choices = c("")),
      selectInput('x', 'Explanatory variable(s)(독립변수)',choices = c(""),multiple=TRUE),
      actionButton('analysis',"Analysis")
    ),
    mainPanel(
      checkboxInput("showtable","show data.table",value=TRUE),
      conditionalPanel(condition="input.showtable==true",
                       DT::dataTableOutput("table")),
      verbatimTextOutput("regText"),
      uiOutput('regUI')
    )
  )
)

shinyApp(ui=ui,server=server)
