#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


source("R-Codes/000_packages_variables.r")
#teller <- 0
# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
    
    v <- reactiveValues(Bewertung = NULL,
                        teller = 1,
                        auswahl = "")
    
    
    # Datensatz auf Unit einschränken
    unitdf <- reactive({
        df <- analysed %>% filter(CorrectlyAnswered == FALSE)
        req(input$Unit)
        df <- df %>% filter(Unit %in% input$Unit)
        df
    })
    
    # Datensatz auf Part in Unit einschränken
    partdf <- reactive({
        req(input$Part)
        unitdf() %>% filter(Part %in% input$Part) #%>% mutate(Tipp = 0)
        })
    
    # Variable auswählen
    seldf <- reactive({
        input$proove
        partdf() %>% head(1)
        #updateTextInput(inputId = "ger",value = partdf()$deutsch[1])
    })
    
    

    # Parts je nach gewählter Unit anzeigen
    observeEvent(input$Unit,{
        parts <- unique(unitdf()$Part)
        updateCheckboxGroupInput(session, inputId= "Part", label = "Wähle den Abschnitt aus:",choices = parts, selected=parts)
    }, ignoreNULL=FALSE)
    
    # Ausgewählte(r) Part pro Unit
    selpart <- reactive({
        input$Part
    })
    
    observeEvent(input$Part, {
        updateTextInput(inputId = "ger",value = seldf()$deutsch)
    })
                        
    # Antwort auf richtigkeit testen
    observeEvent(input$test,{
        if (input$eng == seldf()$english[1]) {
           v$Bewertung <- "Fein gemacht"
           v$Auswahl <- seldf()$deutsch
           #analysed
       } else {
           v$Bewertung <- paste("Korekt ist",seldf()$english)
           #analysed
       }
       #analysed
    })
    
    # Aufruf der nächsten Variable
    observeEvent(input$weiter,{
        if (input$eng == seldf()$english[1]) {
            isolate({    # Funktion isolate(), um ....
                analysed <<- analysed %>%   # Doppelpfeilzuweisung (<<-), um ...
                    mutate(CorrectlyAnswered=ifelse(english == input$eng, TRUE, CorrectlyAnswered))
                #mutate(CorrectlyAnswered = (english == input$eng)) %>%
                #filter(!CorrectlyAnswered)
            })
            #print(input$eng)
        }
        updateTextInput(inputId = "eng",value= "")
        updateTextInput(inputId = "ger",value = seldf()$deutsch)
        v$Bewertung <- ""
        v$teller <- v$teller+1
    })

    # Kontrolltext erzeugen
    output$Bewertung <- renderText({
        v$Bewertung
    })
    
    
    # Output definieren
    output$Zaehler <- renderText({paste(v$teller,"von", dim(partdf())[1])})
    #output$testtext <- renderText({summary(partdf()$Tipp)})
    output$Kontrolle <- renderTable({analysed})

 
})
