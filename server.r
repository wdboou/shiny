#shinyServe.r
library(shiny)
library(ggplot2)
source("helpers.r")
#format of probability function
#prob_m = function(m_num, t_num, cap, m_cap)

shinyServer(function(input, output){
  
   
  output$plot <- renderPlot({
    pt_tot <- input$num_tot
    pt_adv <- input$num_adv
    cap_reg <- input$qt
    cap_adv <- input$qt_adv
#    prob <- prob_m(pt_adv, pt_tot, cap_reg, cap_adv)
    ax_x <- seq(from=0, to = pt_tot, length.out=3000)
    ax_y <- prob_m(ax_x,pt_tot, cap_reg, cap_adv)
    df_h1b = data.frame(x = ax_x, y=ax_y)
    
#   your choice
    choice_num = input$adv_prct * pt_tot/100
    choice_prob = signif(prob_m(choice_num, pt_tot, cap_reg, cap_adv), digits = 4)
    df_point = data.frame(x=choice_num, y = choice_prob)    

    p <- ggplot(data=df_h1b, aes(x=x,y=y))+
          geom_line(size=2)+ 
          labs(x="Total Number Sf Petitions",y="Probably of Get Chosen")+
          geom_point(data=df_point, aes(x=x, y=y), color = "red", size = 6)+
          geom_text(data=df_point, label=paste(choice_prob), hjust=-0.1, vjust=0, size = 10 )+
          theme(axis.title.y = element_text(size = rel(1.8), angle = 90),
                axis.title.x = element_text(size = rel(1.8), angle = 0))
    print(p)
  })
})
