library(shiny)
library(shinythemes)
library(shinyalert)
library(reshape)
library(ggplot2)
library(dplyr)

ui <- fluidPage(theme = shinytheme("flatly"),
                useShinyalert(force = TRUE), #pop up message to welcome the user
                navbarPage(
                  title = "Mental Disorder Among Gen Z Predictor",
                  id = "nav"),
                sidebarLayout(
                  sidebarPanel( 
                    h3("First, let us get to know about you!"),
                    textInput("name","How would you like us to address you?",placeholder = "Your name please :)"),
                    h4("How old are you?"),
                    sliderInput("age","Tell us your age by moving the slider",min=10,max=25,value=20,step=1),
                    selectInput("gender","What is your gender?",
                                choices = c("Male","Female")),
                    selectInput("checkPrevious","Do you have past experience of mental disorder?",
                                choices = c("Yes","No")),
                    #Let the user choose type of mental disorder
                    selectInput("disorderType","Which mental disorder would you like to predict?",
                                choices = c("--Please select one--","Mood Disorder","Anxiety Disorder",
                                            "Eating Disorder",
                                            "Trauma-Related Disorder")),
                    #If user chooses Mood Disorder, the questions of Mood Disorder will show at the sidebar panel
                    conditionalPanel(condition="input.disorderType == 'Mood Disorder'",
                                     h4("Over the last 2 weeks, how often have you been bothered by any of the following problems? "),
                                     radioButtons("AEnter1", "Little interest or pleasure in doing things", 
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("AEnter2", "Feeling down, depressed, or hopeless",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("AEnter3", "Trouble falling or staying asleep, or sleeping too much", 
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("AEnter4", "Feeling tired or having little energy",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("AEnter5", "Poor appetite or overeating",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("AEnter6", "Feeling bad about yourself--or that you are a failure or have let yourself or your family down", 
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("AEnter7", "Trouble concentrating on things, such as reading the newspaper or watching television", 
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("AEnter8", "Moving or speaking so slowly that other people could have noticed. 
                                                 Or the opposite--being so figety or restless that you have been moving around a lot more than usual",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("AEnter9", "Thoughts that you would be better off dead or of hurting yourself", 
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day"))),
                    #If user chooses Anxiety Disorder, the questions of Anxiety Disorder will show at the sidebar panel
                    conditionalPanel(condition="input.disorderType == 'Anxiety Disorder'",
                                     h4("Over the last 2 weeks, how often have you been bothered by the following problems?"),
                                     radioButtons("BEnter1","Feeling nervous, anxious or on edge",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("BEnter2", "Not being able to stop or control worrying",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("BEnter3", "Worrying too much about different things",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("BEnter4", "Trouble relaxing",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("BEnter5", "Being so restless that it is hard to sit still",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("BEnter6", "Becoming easily annoyed or irritable",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day")),
                                     radioButtons("BEnter7", "Feeling afraid as if something awful might happen",
                                                  choices = c("Not at all","Several days","More than half the days","Nearly every day"))),
                    #If user chooses Eating Disorder, the questions of Eating Disorder will show at the sidebar panel
                    conditionalPanel(condition="input.disorderType == 'Eating Disorder'",
                                     radioButtons("CEnter1", "Do you make yourself Sick because you feel uncomfortably full?",
                                                  choices = c("Yes","No")),
                                     radioButtons("CEnter2", "Do you worry you have lost Control over how much you eat?",
                                                  choices = c("Yes","No")),
                                     radioButtons("CEnter3", "Have you recently lost more than One stone in a 3 month period?",
                                                  choices = c("Yes","No")),
                                     radioButtons("CEnter4", "Do you believe yourself to be Fat when others say you are too thin?",
                                                  choices = c("Yes","No")),
                                     radioButtons("CEnter5", "Would you say that Food dominates your life?",
                                                  choices = c("Yes","No"))),
                    #If user chooses Trauma-Related Disorder, the questions of Trauma-Related Disorder will show at the sidebar panel
                    conditionalPanel(condition="input.disorderType == 'Trauma-Related Disorder'",
                                     h4("In the past month, how much were you bothered by: "),
                                     radioButtons("DEnter1", "Repeated, disturbing, and unwanted memories of the stressful experience?", 
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter2", "Repeated, disturbing dreams of the stressful experience?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter3", "Suddenly feeling or acting as if the stressful experience were actually happening again 
                                                 (as if you were actually back there reliving it)?", 
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter4", "Feeling very upset when something reminded you of the stressful experience?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter5", "Having strong physical reactions when something reminded you of the stressful experience 
                                                 (for example, heart pounding, trouble breathing, sweating)?", 
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter6", "Avoiding memories, thoughts, or feelings related to the stressful experience?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter7", "Avoiding external reminders of the stressful experience 
                                                 (for example, people, places, conversations, activities, objects, or situations)?", 
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter8", "Trouble remembering important parts of the stressful experience?", 
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter9", "Having strong negative beliefs about yourself, other people, or the world 
                                                 (for example, having thoughts such as: I am bad, there is something seriously wrong with me,
                                                  no one can be trusted, the world is completely dangerous)?", 
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter10", "Blaming yourself or someone else for the stressful experience or what happened after it?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter11", "Having strong negative feelings such as fear, horror, anger, guilt, or shame?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter12", "Loss of interest in activities that you used to enjoy?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter13", "Feeling distant or cut off from other people?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter14", "Trouble experiencing positive feelings 
                                                 (for example, being unable to feel happiness or have loving feelings for people close to you)?", 
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter15", "Irritable behavior, angry outbursts, or acting aggressively?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter16", "Taking too many risks or doing things that could cause you harm?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter17", "Being superalert or watchful or on guard?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter18", "Feeling jumpy or easily startled?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter19", "Having difficulty concentrating?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely")),
                                     radioButtons("DEnter20", "Trouble falling or staying asleep?",
                                                  choices = c("Not at all","A little bit","Moderately","Quite a bit","Extremely"))),
                    
                    hr(),
                    #After clicking predict button, the result of prediction will display at Result & Suggestion Tab Panel
                    actionButton("predict","Predict",class = "btn btn-primary btn btn active")
                  ),
                  
                  mainPanel(
                    tabsetPanel(type = "tabs",
                                #Details Tab Panel
                                tabPanel("Details",
                                         h4(paste("Name:")),
                                         verbatimTextOutput("name"),
                                         h4(paste("Age:")),
                                         verbatimTextOutput("age"),
                                         h4(paste("Gender:")),
                                         verbatimTextOutput("gender"),
                                         h4(paste("Did you experience any mental disorder before:")),
                                         verbatimTextOutput("check"),
                                         h4(paste("Selected mental disorder:")),
                                         verbatimTextOutput("selected"),
                                         h4(textOutput("Q1")),
                                         verbatimTextOutput("A1"),
                                         h4(textOutput("Q2")),
                                         verbatimTextOutput("A2"),
                                         h4(textOutput("Q3")),
                                         verbatimTextOutput("A3"),
                                         h4(textOutput("Q4")),
                                         verbatimTextOutput("A4"),
                                         h4(textOutput("Q5")),
                                         verbatimTextOutput("A5"),
                                         h4(textOutput("Q6")),
                                         verbatimTextOutput("A6"),
                                         h4(textOutput("Q7")),
                                         verbatimTextOutput("A7"),
                                         h4(textOutput("Q8")),
                                         verbatimTextOutput("A8"),
                                         h4(textOutput("Q9")),
                                         verbatimTextOutput("A9"),
                                         h4(textOutput("Q10")),
                                         verbatimTextOutput("A10"),
                                         h4(textOutput("Q11")),
                                         verbatimTextOutput("A11"),
                                         h4(textOutput("Q12")),
                                         verbatimTextOutput("A12"),
                                         h4(textOutput("Q13")),
                                         verbatimTextOutput("A13"),
                                         h4(textOutput("Q14")),
                                         verbatimTextOutput("A14"),
                                         h4(textOutput("Q15")),
                                         verbatimTextOutput("A15"),
                                         h4(textOutput("Q16")),
                                         verbatimTextOutput("A16"),
                                         h4(textOutput("Q17")),
                                         verbatimTextOutput("A17"),
                                         h4(textOutput("Q18")),
                                         verbatimTextOutput("A18"),
                                         h4(textOutput("Q19")),
                                         verbatimTextOutput("A19"),
                                         h4(textOutput("Q20")),
                                         verbatimTextOutput("A20"),
                                         helpText("Click on Result tab to see your result.")),
                                #Result & Suggestion Tab Panel
                                tabPanel("Result",
                                         h2(textOutput("type")),
                                         hr(),
                                         h2(paste("Predicted Result:")),
                                         h3(verbatimTextOutput("checkCount")),
                                         br(),
                                         h3(strong("Lifestyle Tips: ")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4(strong("Get some exercise: "))),
                                             h4("When you start an exercise program, take it slowly at first. You could begin with walks around the neighborhood with a friend. Gradually work up to exercising on most days of the week. Try out different activities to find ones that you really enjoy. Doing things you like to do and having other people involved may help you stick with a regular exercise routine."),
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4(strong("Sleep well: "))),
                                             h4("Try to incorporate healthy sleep habits into your life. Get on a regular schedule by going to bed and getting up at the same time each day. Avoid naps. Before getting in bed, unwind with a good book or soothing music, but not in the bedroom. It might help to reserve the bedroom only for sleep.")
                                           )
                                         ), 
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4(strong("Eat a healthy diet: "))),
                                             h4("A sensible eating plan will keep you feeling healthy and give you the nutrients you need. Don't rely on popular diets that cut out food groups and sharply restrict what you can eat. Just focus on the basics: watch your calories, eat lots of vegetables, whole grains, and fruits, and limit fat and sugar. Since caffeine can make you anxious, cut back on soda, coffee, tea, and chocolate.")
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4(strong("Get some sunlight: "))),
                                             h4("Sunlight and darkness trigger the release of hormones in your brain. Exposure to sunlight is thought to increase the brain's release of a hormone called serotonin. Serotonin is associated with boosting mood and helping a person feel calm and focused.")
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4(strong("Stay connected and involved: "))),
                                             h4("You may feel like you can barely get across the room, let alone go out to dinner and a movie. But push yourself a little. Set aside time to do things that you used to enjoy doing. Get out with your family or friends. Or take up a hobby that used to give you pleasure. Staying active -- and connected with the people in your life -- may help you feel better.")
                                           )
                                         ),
                                         helpText("Click on Description tab for further details")),
                                #Description Tab Panel
                                tabPanel("Description", 
                                         h1("Mood disorder: "),
                                         h4("Mood disorder is a mental health problem that primarily affects a person's emotional state. It is a disorder in which a person experiences long periods of extreme happiness, extreme sadness, or both. Two of the most common mood disorders are depression and bipolar disorder."),
                                         h3(strong("Common Sign: ")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Ongoing sad, anxious or empty mood"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Feeling inadequate or worthless"))
                                           )
                                         ), 
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Loss of interest in usual activities or activities that were once enjoyed"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Feeling sad most of the time or nearly every day"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Frequent thoughts about death or suicide"))
                                           )
                                         ),
                                         h3(strong("Risk factors:")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("People who have parent with a mood disorder have a greater chance of also having a mood disorder."))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Life events and stress can expose or worsen feelings of sadness or depression."))
                                           )
                                         ),
                                         h1("Anxiety disorder: "),
                                         h4("People with anxiety disorders frequently have intense, excessive and persistent worry and fear about everyday situations. Anxiety disorders involve repeated episodes of sudden feelings of intense anxiety and fear or terror that reach a peak within minutes. "),
                                         h3(strong("Signs & Symptoms:")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Feeling nervous, restless or tense"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Having a sense of impending danger, panic or doom"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Trouble concentrating or thinking about anything other than the present worry"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Having difficulty controlling worry"))
                                           )
                                         ),
                                         h3(strong("Risk factors:")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Children who endured abuse or trauma or witnessed traumatic events "))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Having a health condition or serious illness"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("A big event or a buildup of smaller stressful life situations may trigger excessive anxiety."))
                                           )
                                         ),
                                         h1("Eating disorder: "),
                                         h4("Eating disorders are behavioral conditions characterized by severe and persistent disturbance in eating behaviors and associated distressing thoughts and emotions. They can be very serious conditions affecting physical, psychological and social function. Two of the most common food disorders are anorexia nervosa and bulimia nervosa."),
                                         h3(strong("Common signs:")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Presenting as hyper-focused on weight, food, calories, nutritional content of food."))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Skipping meals."))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Weight fluctuations (both up and down) that occur rapidly."))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Extreme weight loss"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Bingeing and self-induced vomiting to get rid of food, which may include the use of laxatives, enemas, diet aids or herbal products"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Frequently skipping meals or refusing to eat"))
                                           )
                                         ),
                                         h3(strong("Risk factors:")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Digestive problems"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Absent or irregular periods in females and decreased testosterone in males"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Severely malnourished"))
                                           )
                                         ),   
                                         h1("Trauma-related disorder: "),
                                         h4("Post-traumatic stress disorder symptoms may start within one month of a traumatic event, but sometimes symptoms may not appear until years after the event. These symptoms cause significant problems in social or work situations and in relationships. PTSD symptoms are generally grouped into four types: intrusive memories, avoidance, negative changes in thinking and mood, and changes in physical and emotional reactions."),
                                         h3(strong("Symptoms of intrusive memories:")), 
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Recurrent, unwanted distressing memories of the traumatic event"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Reliving the traumatic event as if it were happening again (flashbacks)"))
                                           )
                                         ),   
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Upsetting dreams or nightmares about the traumatic event"))
                                           )
                                         ),   
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Being easily startled or frightened"))
                                           )
                                         ),   
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Always being on guard for danger"))
                                           )
                                         ),   
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Irritability, angry outbursts or aggressive behavior"))
                                           )
                                         ),   
                                         h3(strong("Risk factors: ")),  
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Experiencing intense or long-lasting trauma"))
                                           )
                                         ),   
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Having problems with substance misuse, such as excess drinking or drug use"))
                                           )
                                         ),   
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Having a job that increases your risk of being exposed to traumatic events, such as military personnel and first responders"))
                                           ),
                                           br(),
                                           br(),
                                           br(),
                                         )),
                                #Dataset Tab Panel
                                tabPanel("Dataset",
                                         h3(strong(paste("Number of People With Mental Disorder By Gender In Malaysia"))),
                                         dataTableOutput("dataset1"),
                                         hr(),
                                         h3(strong(paste("Share Of Population With Mental Disorder In Several Countries"))),
                                         dataTableOutput("dataset2")),
                                #Graph Tab Panel
                                tabPanel("Graph",
                                         h3(strong(paste("Number of People With Mental Disorder By Gender In Malaysia"))),
                                         plotOutput("plot1"),
                                         hr(),
                                         h3(strong(paste("Share Of Population With Mental Disorder In Several Countries"))),
                                         plotOutput("plot2")),
                                #About Tab Panel
                                tabPanel("About",
                                         h2("Problem Statement:"),
                                         hr(),
                                         h4("Phew! We made it to 2022! But still bearing. 
                                         Now, any pandemic or longtime suffering can trigger 
                                         a person in two ways, mentally and physically. 
                                         The physical deterioration is visible, that's why 
                                         we straight go to the doctor and if we are lucky, we get well!"),
                                         br(),
                                         h4("But nobody knows what is happening on the inside, and it is hard 
                                            to remember that the mind-space is dependent on the corporal world. 
                                            Except for the person who's experiencing it themselves."),
                                         br(),
                                         h4("In the past few years, Gen-Z mental health has been a matter of 
                                            concern (over 20% of teens suffered from depression), because of 
                                            the ever-changing world and the ever-growing competitiveness of 
                                            looking better! (Just kidding) But yeah, as members of the Gen-Z, 
                                            we felt that it is our responsibility to raise awareness on the matter."),
                                         br(),
                                         h4("You might never know what are the potential disorders that might be 
                                            lurking in your brain. But you matter, and that's why we are here, to help."),
                                         br(),
                                         br(),
                                         h2("Solution:"),
                                         hr(),
                                         h4("Don't worry! We got your back! Our Shiny App is a mental disorder predictor. 
                                            We have worked with the main four types of disorders, Mood disorder, Anxiety 
                                            disorder, Eating disorder and Trauma-Related Disorder (We are planning to launch 
                                            more!."),
                                         br(),
                                         h4("Our app will take your personal details (Totally credential), study your YES's and NO's, 
                                            and then predict if you need help. Remember, a chaos in the mind is enough to lead to the 
                                            ultimate destination!"),
                                         br(),
                                         h4("Take care of your mental health, you matter."),
                                         br(),
                                         br(),
                                         br())),
                    
                  )
                )
)


server <- function(input, output) {
  
  #Pop up window after lauching the app
  shinyalert(
    title = "Welcome!",
    text = "Slow down. Slow down. Slow down. Take a deep breath in... and slowly breathe out...
            We understand that all of us go through tough times in some stages of our lives and that may be your situation right now.
            Don't give up! Take a couple of minutes during your tea time to complete a self test on Mood Disorder, Anxiety Disorder, 
            Eating Disorder and Trauma-Related Disorder.",
    size = "l", 
    closeOnEsc = FALSE,
    closeOnClickOutside = FALSE,
    html = FALSE,
    type = "",
    showConfirmButton = TRUE,
    showCancelButton = FALSE,
    confirmButtonText = "Let's begin!",
    confirmButtonCol = "#AEDEF4",
    timer = 0,
    imageUrl = "",
    animation = TRUE
  )
  
  #Get the user's name
  output$name <- renderPrint({input$name})
  #Get the user's age
  output$age <- renderPrint({input$age})
  #Get the user's gender
  output$gender <- renderPrint({input$gender})
  output$check <- renderPrint({input$checkPrevious})
  #Get the mental disorder type selected by the user
  output$selected <- renderPrint({input$disorderType})
  
  #Display the mental disorder selected by the user
  output$type <- renderText({
    input$predict
    isolate(paste(input$disorderType))
  })
  
  #Question 1
  output$Q1 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("Little interest or pleasure in doing things")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("Feeling nervous, anxious or on edge")
    } else if (input$disorderType == "Eating Disorder") {
      paste("Do you make yourself Sick because you feel uncomfortably full?")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("Repeated, disturbing, and unwanted memories of the stressful experience?")
    }
  }) 
  
  #Output Question 1
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
  
  #Question 2
  output$Q2 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("Feeling down, depressed, or hopeless")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("Not being able to stop or control worrying")
    } else if (input$disorderType == "Eating Disorder") {
      paste("Do you worry you have lost Control over how much you eat?")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("Repeated, disturbing dreams of the stressful experience?")
    }
  }) 
  
  #Output Question 2
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
  
  #Question 3
  output$Q3 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("Trouble falling or staying asleep, or sleeping too much")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("Worrying too much about different things")
    } else if (input$disorderType == "Eating Disorder") {
      paste("Have you recently lost more than One stone in a 3 month period? ")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("Suddenly feeling or acting as if the stressful experience were actually happening again (as if you were actually back there reliving it)?")
    }
  }) 
  
  #Output Question 3
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
  
  #Question 4
  output$Q4 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("Feeling tired or having little energy")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("Trouble relaxing")
    } else if (input$disorderType == "Eating Disorder") {
      paste("Do you believe yourself to be Fat when others say you are too thin?")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("Feeling very upset when something reminded you of the stressful experience?")
    }
  }) 
  
  #Output Question 4
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
  
  #Question 5
  output$Q5 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("Poor appetite or overeating")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("Being so restless that it is hard to sit still")
    } else if (input$disorderType == "Eating Disorder") {
      paste("Would you say that Food dominates your life?")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("Having strong physical reactions when something reminded you of the stressful experience (for example, heart pounding, trouble breathing, sweating)?")
    }
  }) 
  
  #Output Question 5
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
  
  #Question 6
  output$Q6 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("Feeling bad about yourself--or that you are a failure or have let yourself or your family down")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("Becoming easily annoyed or irritable")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("Avoiding memories, thoughts, or feelings related to the stressful experience?")
    }
  }) 
  
  #Output Question 6
  output$A6 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter6)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter6)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter6)
    }
  })
  
  #Question 7
  output$Q7 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("Trouble concentrating on things, such as reading the newspaper or watching television")
    } else if (input$disorderType == "Anxiety Disorder") {
      paste("Feeling afraid as if something awful might happen")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("Avoiding external reminders of the stressful experience (for example, people, places, conversations, activities, objects, or situations)?")
    }
  }) 
  
  #Output Question 7
  output$A7 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter7)
    } else if (input$disorderType == "Anxiety Disorder") {
      paste(input$BEnter7)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter7)
    }
  })
  
  #Question 8
  output$Q8 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("Moving or speaking so slowly that other people could have noticed. 
              Or the opposite--being so figety or restless that you have been moving around a lot more than usual")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("Trouble remembering important parts of the stressful experience?")
    }
  }) 
  
  #Output Question 8
  output$A8 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter8)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter8)
    }
  })
  
  #Question 9
  output$Q9 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste("Thoughts that you would be better off dead or of hurting yourself")
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste("Having strong negative beliefs about yourself, other people, or the world (for example, having thoughts such as: I am bad, there is something seriously wrong with me,
              no one can be trusted, the world is completely dangerous)?")
    }
  }) 
  
  #Output Question 9
  output$A9 <- renderText({
    if (input$disorderType == "Mood Disorder") {
      paste(input$AEnter9)
    } else if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter9)
    }
  })
  
  #Question 10
  output$Q10 <- renderText({
    if (input$disorderType == "Trauma-Related Disorder") {
      paste("Blaming yourself or someone else for the stressful experience or what happened after it?")
    }
  }) 
  
  #Output Question 10
  output$A10 <- renderText({
    if (input$disorderType == "Trauma-Related Disorder") {
      paste(input$DEnter10)
    }
  })
  
  #Question 11
  output$Q11 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Having strong negative feelings such as fear, horror, anger, guilt, or shame?")
    }
  )
  
  #Output Question 11
  output$A11 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter11)
    }
  )
  
  #Question 12 
  output$Q12 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Loss of interest in activities that you used to enjoy?")
    }
  )
  
  #Output Question 12
  output$A12 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter12)
    }
  )
  
  #Question 13 
  output$Q13 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Feeling distant or cut off from other people?")
    }
  )
  
  #Output Question 13
  output$A13 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter13)
    }
  )
  
  #Question 14 
  output$Q14 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Trouble experiencing positive feelings (for example, being unable to feel happiness or have loving feelings for people close to you)?")
    }
  )
  
  #Output Question 14
  output$A14 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter14)
    }
  )
  
  #Question 15 
  output$Q15 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Irritable behavior, angry outbursts, or acting aggressively?")
    }
  )
  
  #Output Question 15
  output$A15 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter15)
    }
  )
  
  #Question 16 
  output$Q16 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Taking too many risks or doing things that could cause you harm?")
    }
  )
  
  #Output Question 16
  output$A16 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter16)
    }
  )
  
  #Question 17
  output$Q17 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Being superalert or watchful or on guard?")
    }
  )
  
  #Output Question 17
  output$A17 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter17)
    }
  )
  
  #Question 18 
  output$Q18 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Feeling jumpy or easily startled?")
    }
  )
  
  #Output Question 18
  output$A18 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter18)
    }
  )
  
  #Question 19 
  output$Q19 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Having difficulty concentrating?")
    }
  )
  
  #Output Question 19
  output$A19 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter19)
    }
  )
  
  #Question 20
  output$Q20 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste("Trouble falling or staying asleep?")
    }
  )
  
  #Output Question 20
  output$A20 <- renderText(
    if (input$disorderType == "Trauma-Related Disorder"){
      paste(input$DEnter20)
    }
  )
  
  count = 0
  
  #To check whether the user have the mental disorder selected by the user
  #and display the result at the Result & Suggestion Tab Panel
  output$checkCount <- renderText({
    input$predict
    if (input$disorderType == "Mood Disorder"){ #Mood Disorder
      
      if (isolate(input$AEnter1 == "Not at all")){
        count = count + 0
      } else if (isolate(input$AEnter1 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter1 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter1 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$AEnter2 == "Not at all")){
        count = count + 0
      } else if (isolate(input$AEnter2 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter2 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter2 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$AEnter3 == "Not at all")){
        count = count + 0
      } else if (isolate(input$AEnter3 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter3 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter3 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$AEnter4 == "Not at all")){
        count = count + 0
      } else if (isolate(input$AEnter4 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter4 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter4 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$AEnter5 == "Not at all")){
        count = count + 0
      } else if (isolate(input$AEnter5 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter5 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter5 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$AEnter6 == "Not at all")){
        count = count + 0
      } else if (isolate(input$AEnter6 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter6 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter6 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$AEnter7 == "Not at all")){
        count = count + 0
      }else if (isolate(input$AEnter7 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter7 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter7 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$AEnter8 == "Not at all")){
        count = count + 0
      }else if (isolate(input$AEnter8 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter8 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter8 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$AEnter9 == "Not at all")){
        count = count + 0
      }else if (isolate(input$AEnter9 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter9 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter9 == "Nearly every day")){
        count = count + 3
      }
      
    } else if (input$disorderType == "Anxiety Disorder"){ #Anxiety Disorder
      
      if (isolate(input$AEnter1 == "Not at all")){
        count = count + 0
      } else if (isolate(inpuA$BEnter1 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter1 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter1 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$AEnter2 == "Not at all")){
        count = count + 0
      } else if (isolate(input$AEnter2 == "Several days")){
        count = count + 1
      } else if (isolate(input$AEnter2 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$AEnter2 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$BEnter3 == "Not at all")){
        count = count + 0
      } else if (isolate(input$BEnter3 == "Several days")){
        count = count + 1
      } else if (isolate(input$BEnter3 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$BEnter3 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$BEnter4 == "Not at all")){
        count = count + 0
      } else if (isolate(input$BEnter4 == "Several days")){
        count = count + 1
      } else if (isolate(input$BEnter4 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$BEnter4 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$BEnter5 == "Not at all")){
        count = count + 0
      } else if (isolate(input$BEnter5 == "Several days")){
        count = count + 1
      } else if (isolate(input$BEnter5 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$BEnter5 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$BEnter6 == "Not at all")){
        count = count + 0
      } else if (isolate(input$BEnter6 == "Several days")){
        count = count + 1
      } else if (isolate(input$BEnter6 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$BEnter6 == "Nearly every day")){
        count = count + 3
      }
      if (isolate(input$BEnter7 == "Not at all")){
        count = count + 0
      }else if (isolate(input$BEnter7 == "Several days")){
        count = count + 1
      } else if (isolate(input$BEnter7 == "More than half the days")){
        count = count + 2
      } else if (isolate(input$BEnter7 == "Nearly every day")){
        count = count + 3
      }
      
    } else if (input$disorderType == "Eating Disorder"){ #Eating Disorder
      
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
      
    } else if (input$disorderType == "Trauma-Related Disorder"){ #Trauma-Related Disorder
      
      if (isolate(input$DEnter1 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter1 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter1 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter1 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter1 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter2 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter2 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter2 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter2 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter2 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter3 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter3 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter3 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter3 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter3 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter4 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter4 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter4 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter4 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter4 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter5 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter5 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter5 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter5 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter5 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter6 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter6 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter6 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter6 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter6 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter7 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter7 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter7 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter7 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter7 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter8 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter8 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter8 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter8 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter8 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter9 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter9 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter9 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter9 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter9 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter10 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter10 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter10 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter10 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter10 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter11 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter11 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter11 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter11 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter11 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter12 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter12 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter12 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter12 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter12 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter13 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter13 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter13 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter13 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter13 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter14 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter14 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter14 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter14 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter14 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter15 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter15 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter15 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter15 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter15 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter16 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter16 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter16 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter16 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter16 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter17 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter17 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter17 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter17 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter17 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter18 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter18 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter18 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter18 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter18 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter19 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter19 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter19 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter19 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter19 == "Extremely")){
        count = count + 4
      }
      if (isolate(input$DEnter20 == "Not at all")){
        count = count + 0
      }else if (isolate(input$DEnter20 == "A little bit")){
        count = count + 1
      } else if (isolate(input$DEnter20 == "Moderately")){
        count = count + 2
      } else if (isolate(input$DEnter20 == "Quite a bit")){
        count = count + 3
      } else if (isolate(input$DEnter20 == "Extremely")){
        count = count + 4
      }
    }
    
    #Calculate count and use it to determine whether the user has mental disorder
    if (input$disorderType == "Mood Disorder") {
      if (count >= 0 & count <= 4){
        paste("Minimal Depression")
      } else if (count >= 5 & count <= 9 ) {
        paste("Mild Depression")
      } else if (count >=10 & count <=14) {
        paste("Moderate Depression")
      } else if (count >=15 & count <=19) {
        paste("Moderately Severe Depression")
      } else if (count >= 20 & count <=27) {
        paste("Severe Depression")
      }
    }else if (input$disorderType == "Anxiety Disorder") {
      if (count >= 0 & count <= 4) {
        paste("Minimal Anxiety")
      } else if (count >= 5 & count <= 9) {
        paste("Mild Anxiety")
      } else if (count >= 10 & count <= 14) {
        paste("Moderate Anxiety")
      } else if (count >= 15)
        paste("Severe Anxiety")
    } else if (input$disorderType == "Eating Disorder") {
      if (count >= 0 & count <= 1) {
        paste("Low Possibility")
      } else if (count >= 2) {
        paste("High Possiblity")
      }
    } else if (input$disorderType == "Trauma-Related Disorder") {
      if (count >= 32) {
        paste("High Possibility")
      }
      else {
        paste("Low Possibility")
      }
    }
  })
  
  #Number of People With Mental Health Disorder By Gender In Malaysia Dataset
  df1 <- read.csv("https://raw.githubusercontent.com/tyxuan123/ShinyApp/master/number-with-mental-health-disorders-by-sex%20(1).csv",header=TRUE)
  df1 <- df1 %>%
    slice(4321:4350) %>%
    select(Year,Female,Male) 
  
  #Share of Population With Mental Health Disorder In Several Countries Dataset
  df2 <- read.csv("https://raw.githubusercontent.com/tyxuan123/ShinyApp/master/share-with-mental-and-substance-disorders.csv",header=TRUE)
  df2 <- df2 %>%
    filter(Year==2019) %>%
    slice(c(17,51,116,117,124,145,190,233,250,251,257,109))
  
  #Display Number of People With Mental Health Disorder By Gender In Malaysia Dataset at Dataset Tab Panel 
  output$dataset1 <- renderDataTable(
    df1, options = list(pageLength=5,lengthMenu=c(5,10,20,30))
  )
  
  #Display Share of Population With Mental Health Disorder In Several Countries Dataset at Dataset Tab Panel 
  output$dataset2 <- renderDataTable(
    df2, options = list(lengthChange=FALSE)
  )
  
  #Display Number of People With Mental Health Disorder By Gender In Malaysia Graph at Graph Tab Panel
  output$plot1 <- renderPlot({
    
    ggplot(df1,aes(x=Year)) + 
      geom_line(aes(y=Female,color="steelblue")) + 
      geom_line(aes(y=Male,color="darkred")) +
      labs(x="Year",y="Number Of People With Mental Disorder In Malaysia") +
      scale_colour_discrete(name = "Gender", labels = c("Female","Male")) +
      theme_bw()
    
  })
  
  #Display Share of Population With Mental Health Disorder In Several Countries Graph at Graph Tab Panel
  output$plot2 <- renderPlot({
    
    ggplot(df2,aes(x=Country,y=Prevalence,fill=Country)) + 
      geom_col() +
      labs(x="Country",y="Prevalence(%)",fill="Country") +
      scale_colour_discrete(name = "Gender", labels = c("Female","Male")) +
      theme_bw()
  })
  
}

shinyApp(ui = ui, server = server)

