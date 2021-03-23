#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source("R-Codes/000_packages_variables.r")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Englischvokabeln Klasse 5"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput("Unit","Wähle die Unit aus:",unique(vocdf$Unit)),
            checkboxGroupInput("Part","Wähle den Abschnitt aus:",choices = NULL),
            
            #helpText("Was ist ... auf Englisch?"),
            textInput("ger","Was ist ... auf Englisch?"),
            textInput("eng",
                      "Write in English here:"),
            actionButton("test","Proove"),
            actionButton("weiter","Next word"),
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            textOutput("Bewertung"),
            textOutput("Zaehler"),
            #textOutput("testtext"),
            tableOutput("Kontrolle")
        )
    )
))
