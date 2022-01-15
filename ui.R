library(shiny)
library(shinythemes)


ui <- fluidPage(theme = shinytheme("flatly"),
  titlePanel("Mental Disorder Among Gen Z Predictor"),
  sidebarLayout(
    sidebarPanel(
      textInput("name","Please enter your name"),
      sliderInput("age","Choose your age (Move the slider)",min=10,max=25,value=20,step=1),
      radioButtons("gender","Choose your gender (Click either one)",
                   choices = c("Male","Female")),
      radioButtons("checkPrevious","Did you experience any mental disorder before?",
                   choices = c("Yes","No")),
      selectInput("disorderType","Select a mental disoder",
                  choices = c("Mood Disorder","Anxiety Disorder",
                              "Eating Disorder",
                              "Trauma-Related Disorder")),
      conditionalPanel(condition="input.disorderType == 'Mood Disorder'",
                       radioButtons("AEnter1", "Question 1",
                                    choices = c("Yes","No")),
                       radioButtons("AEnter2", "Question 2",
                                    choices = c("Yes","No")),
                       radioButtons("AEnter3", "Question 3",
                                    choices = c("Yes","No")),
                       radioButtons("AEnter4", "Question 4",
                                    choices = c("Yes","No")),
                       radioButtons("AEnter5", "Question 5",
                                    choices = c("Yes","No")),
                       radioButtons("AEnter6", "Question 6",
                                    choices = c("Yes","No")),
                       radioButtons("AEnter7", "Question 7",
                                    choices = c("Yes","No")),
                       radioButtons("AEnter8", "Question 8",
                                    choices = c("Yes","No")),
                       radioButtons("AEnter9", "Question 9",
                                    choices = c("Yes","No")),
                       radioButtons("AEnter10", "Question 10",
                                    choices = c("Yes","No"))),
      conditionalPanel(condition="input.disorderType == 'Anxiety Disorder'",
                       radioButtons("BEnter1", "Question 1",
                                    choices = c("Yes","No")),
                       radioButtons("BEnter2", "Question 2",
                                    choices = c("Yes","No")),
                       radioButtons("BEnter3", "Question 3",
                                    choices = c("Yes","No")),
                       radioButtons("BEnter4", "Question 4",
                                    choices = c("Yes","No")),
                       radioButtons("BEnter5", "Question 5",
                                    choices = c("Yes","No")),
                       radioButtons("BEnter6", "Question 6",
                                    choices = c("Yes","No")),
                       radioButtons("BEnter7", "Question 7",
                                    choices = c("Yes","No")),
                       radioButtons("BEnter8", "Question 8",
                                    choices = c("Yes","No")),
                       radioButtons("BEnter9", "Question 9",
                                    choices = c("Yes","No")),
                       radioButtons("BEnter10", "Question 10",
                                    choices = c("Yes","No"))),
      conditionalPanel(condition="input.disorderType == 'Eating Disorder'",
                       radioButtons("CEnter1", "Question 1",
                                    choices = c("Yes","No")),
                       radioButtons("CEnter2", "Question 2",
                                    choices = c("Yes","No")),
                       radioButtons("CEnter3", "Question 3",
                                    choices = c("Yes","No")),
                       radioButtons("CEnter4", "Question 4",
                                    choices = c("Yes","No")),
                       radioButtons("CEnter5", "Question 5",
                                    choices = c("Yes","No")),
                       radioButtons("CEnter6", "Question 6",
                                    choices = c("Yes","No")),
                       radioButtons("CEnter7", "Question 7",
                                    choices = c("Yes","No")),
                       radioButtons("CEnter8", "Question 8",
                                    choices = c("Yes","No")),
                       radioButtons("CEnter9", "Question 9",
                                    choices = c("Yes","No")),
                       radioButtons("CEnter10", "Question 10",
                                    choices = c("Yes","No"))),
      conditionalPanel(condition="input.disorderType == 'Trauma-Related Disorder'",
                       radioButtons("DEnter1", "Question 1",
                                    choices = c("Yes","No")),
                       radioButtons("DEnter2", "Question 2",
                                    choices = c("Yes","No")),
                       radioButtons("DEnter3", "Question 3",
                                    choices = c("Yes","No")),
                       radioButtons("DEnter4", "Question 4",
                                    choices = c("Yes","No")),
                       radioButtons("DEnter5", "Question 5",
                                    choices = c("Yes","No")),
                       radioButtons("DEnter6", "Question 6",
                                    choices = c("Yes","No")),
                       radioButtons("DEnter7", "Question 7",
                                    choices = c("Yes","No")),
                       radioButtons("DEnter8", "Question 8",
                                    choices = c("Yes","No")),
                       radioButtons("DEnter9", "Question 9",
                                    choices = c("Yes","No")),
                       radioButtons("DEnter10", "Question 10",
                                    choices = c("Yes","No"))),
      hr(),#new line
      actionButton("predict","Predict",class = "btn btn-primary btn btn active")
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Description"),
                                         h1("Mood disorder: "),
                                         h4("Mood disorder is a mental health problem that primarily affects a person’s emotional state. It is a disorder in which a person experiences long periods of extreme happiness, extreme sadness, or both. Two of the most common mood disorders are depression and bipolar disorder."),
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
                                         h3(strong("Symptoms of major depression: ")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Feeling sad most of the time or nearly every day"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Loss of appetite or overeating"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Frequent thoughts about death or suicide"))
                                           )
                                         ),
                                         h3(strong("Symptoms of bipolar disorder:")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Feeling extremely energized or elatede"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Agitation, restlessness, or irritability"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Rapid speech or movement"))
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
                                         h3(strong("Symptoms of anorexia nervosa:")),
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
                                         h3(strong("Symptoms of bulimia nervosa:")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("FRepeated episodes of eating abnormally large amounts of food in one sitting"))
                                           )
                                         ),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Feeling a loss of control during bingeing — like you can't stop eating or can't control what you eat"))
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
                                         h3(strong("Symptoms of avoidance:")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Trying to avoid thinking or talking about the traumatic event"))
                                           )
                                         ),   
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Avoiding places, activities or people that remind you of the traumatic event"))
                                           )
                                         ),   
                                         h3(strong("Symptoms of negative changes in thinking and mood:")),
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Negative thoughts about yourself, other people or the world"))
                                           )
                                         ),   
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Hopelessness about the future"))
                                           )
                                         ),   
                                         tags$div(
                                           tags$ul(
                                             tags$li(h4("Difficulty experiencing positive emotions"))
                                           )
                                         ),   
                                         h3(strong("Symptoms of changes in physical and emotional reactions:")),
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
                                           )
                                         )),
                  
                  tabPanel("Details",
                           h3(paste("User Input Details")),
                           hr(),
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
                           verbatimTextOutput("A10")),
                  
                  
                  
                  
                  tabPanel("Result and Suggestion",
                           h2(paste("Type of Mental Disorders:")),
                           hr(),
                           h3(textOutput("type")),
                           h3(verbatimTextOutput("checkCount"))),
                  tabPanel("Dataset"),
                  tabPanel("About")),
      
    )
  )
)
