library(shiny)
library(shinythemes)

server <- function(input, output) {
  
  output$name <- renderPrint({input$name})
  output$age <- renderPrint({input$age})
  output$gender <- renderPrint({input$gender})
  output$check <- renderPrint({input$checkPrevious})
  output$selected <- renderPrint({input$disorderType})
  
  output$type <- renderText({
    input$predict
    isolate(paste(input$disorderType))
  })
  
  output$Q1 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q1:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q1:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q1:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q1:")
    }
  }) 
  
  output$A1 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter1)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter1)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter1)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter1)
    }
  }) 
  
  output$Q2 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q2:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q2:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q2:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q2:")
    }
  }) 
  
  output$A2 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter2)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter2)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter2)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter2)
    }
  }) 
  
  output$Q3 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q3:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q3:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q3:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q3:")
    }
  }) 
  
  output$A3 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter3)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter3)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter3)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter3)
    }
  })
  
  output$Q4 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q4:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q4:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q4:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q4:")
    }
  }) 
  
  output$A4 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter4)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter4)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter4)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter4)
    }
  })
  
  output$Q5 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q5:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q5:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q5:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q5:")
    }
  }) 
  
  output$A5 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter5)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter5)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter5)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter5)
    }
  })
  
  output$Q6 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q6:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q6:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q6:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q6:")
    }
  }) 
  
  output$A6 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter6)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter6)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter6)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter6)
    }
  })
  
  output$Q7 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q7:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q7:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q7:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q7:")
    }
  }) 
  
  output$A7 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter7)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter7)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter7)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter7)
    }
  })
  
  output$Q8 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q8:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q8:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q8:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q8:")
    }
  }) 
  
  output$A8 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter8)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter8)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter8)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter8)
    }
  })
  
  output$Q9 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q9:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q9:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q9:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q9:")
    }
  }) 
  
  output$A9 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter9)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter9)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter9)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter9)
    }
  })
  
  output$Q10 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("q10:")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("q10:")
    } else if (input$disorderType == "Eating Disorder") {
      paste("q10:")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("q10:")
    }
  }) 
  
  output$A10 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter10)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter10)
    } else if (input$disorderType == "Eating Disorder") {
      paste(input$CEnter10)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter10)
    }
  })
  
  count = 0
  
  output$checkCount <- renderText({
    input$predict
    if (input$disorderType == "Mood Disorder"){
      if (isolate(input$AEnter1 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter2 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter3 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter4 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter5 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter6 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter7 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter8 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter9 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter10 == "Yes")){
        count = count + 1
      }
    } else if (input$disorderType == "Anxiety Disorder"){
      if (isolate(input$BEnter1 == "Yes")){
        count = count + 1
      }
      if (isolate(input$BEnter2 == "Yes")){
        count = count + 1
      }
      if (isolate(input$BEnter3 == "Yes")){
        count = count + 1
      }
      if (isolate(input$BEnter4 == "Yes")){
        count = count + 1
      }
      if (isolate(input$BEnter5 == "Yes")){
        count = count + 1
      }
      if (isolate(input$BEnter6 == "Yes")){
        count = count + 1
      }
      if (isolate(input$BEnter7 == "Yes")){
        count = count + 1
      }
      if (isolate(input$BEnter8 == "Yes")){
        count = count + 1
      }
      if (isolate(input$BEnter9 == "Yes")){
        count = count + 1
      }
      if (isolate(input$BEnter10 == "Yes")){
        count = count + 1
      }
    } else if (input$disorderType == "Eating Disorder"){
      if (isolate(input$CEnter1 == "Yes")){
        count = count + 1
      }
      if (isolate(input$CEnter2 == "Yes")){
        count = count + 1
      }
      if (isolate(input$CEnter3 == "Yes")){
        count = count + 1
      }
      if (isolate(input$CEnter4 == "Yes")){
        count = count + 1
      }
      if (isolate(input$CEnter5 == "Yes")){
        count = count + 1
      }
      if (isolate(input$CEnter6 == "Yes")){
        count = count + 1
      }
      if (isolate(input$CEnter7 == "Yes")){
        count = count + 1
      }
      if (isolate(input$CEnter8 == "Yes")){
        count = count + 1
      }
      if (isolate(input$AEnter9 == "Yes")){
        count = count + 1
      }
      if (isolate(input$CEnter10 == "Yes")){
        count = count + 1
      }
    } else if (input$disorderType == "Trauma-Related Disorder"){
      if (isolate(input$DEnter1 == "Yes")){
        count = count + 1
      }
      if (isolate(input$DEnter2 == "Yes")){
        count = count + 1
      }
      if (isolate(input$DEnter3 == "Yes")){
        count = count + 1
      }
      if (isolate(input$DEnter4 == "Yes")){
        count = count + 1
      }
      if (isolate(input$DEnter5 == "Yes")){
        count = count + 1
      }
      if (isolate(input$DEnter6 == "Yes")){
        count = count + 1
      }
      if (isolate(input$DEnter7 == "Yes")){
        count = count + 1
      }
      if (isolate(input$DEnter8 == "Yes")){
        count = count + 1
      }
      if (isolate(input$DEnter9 == "Yes")){
        count = count + 1
      }
      if (isolate(input$DEnter10 == "Yes")){
        count = count + 1
      }
    }
    paste(count)
  })
  
  output$type1 <- renderText({
    input$predict
    isolate(paste(input$disorderType))
  })
  
}