#shinyUI.r

shinyUI(fluidPage(

  titlePanel("H1B visa lottery plot of advanced degree"),
  sidebarPanel(
    numericInput("num_tot","Number of petitions (total)", 233000, min=0),
    br(),
    numericInput("qt", "Quota (non-advanced degree)", 65000, min=0),
    br(),
    numericInput("qt_adv", "Quota (advanced degree)", 20000, min=0),
    br(),
    sliderInput("adv_prct", "Percentage of advanced degree",
                min = 0, max = 100, value=20)
    ),
  mainPanel(
    plotOutput("plot")
    )
  ))
