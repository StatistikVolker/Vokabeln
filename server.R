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
    
#    teller = teller+1
    
    unitdf <- reactive({
        req(input$Unit)
        vocdf %>% filter(Unit %in% input$Unit)
    })
    
    partdf <- reactive({
        req(input$Part)
        unitdf() %>% filter(Part %in% input$Part) #%>% mutate(Tipp = 0)
        })
    
    seldf <- reactive({
        #partdf() %>% filter(Tipp == 0)
        input$proove
        partdf() %>% filter(!AnsweredCorrectly) %>% head(1)
        
    })
 
    observeEvent(input$Unit,{
        parts <- unique(unitdf()$Part)
        updateCheckboxGroupInput(session, inputId= "Part", label = "Wähle den Abschnitt aus:",choices = parts, selected=parts)
    }, ignoreNULL=FALSE)
    
    selpart <- reactive({
        input$Part
    })
                        
    #rowid <- reactive({
    #    if (dim(seldf())[1]> 0  | (dim(seldf())[1]> 0 & input$weiter)) {sample_n(seldf(),1)}
    #    #if (dim(partdf())[1]> 0  | (dim(partdf())[1]> 0 & input$weiter)) {sample_n(partdf(),1)}
    #})

    #observeEvent(partdf(), {
    #    v$auswahl <- rowid()$deutsch
    #    updateTextInput(inputId = "ger",value = v$auswahl)
    #})
    
    observeEvent(input$test,{
       if (input$eng == seldf()$english[1]) {
           vocdf <- vocdf %>% 
               mutate(CorrectlyAnswered=ifelse(
                       English == input$answerText, 
                       TRUE, 
                       CorrectlyAnswered
                   )
               )
           v$Bewertung <- "Fein gemacht"
           v$Auswahl <- seldf()$deutsch
           
 
       } else {
           v$Bewertung <- paste("Korekt ist",rowid()$english)
       }
    })
    
    #partdf2 <- eventReactive(input$test, {
    #    partdf <- partdf() 
    #    partdf$Tipp[partdf$deutsch == rowid()$deutsch] <- 1
    #    partdf
    #}) 

    observeEvent(input$weiter,{
        updateTextInput(inputId = "eng",value= "")
        updateTextInput(inputId = "ger",value = rowid()$deutsch)
        v$Bewertung <- ""
        v$teller = v$teller + 1
    })

    output$Bewertung <- renderText({
        v$Bewertung
        #unit()
    })
    
    output$Zaehler <- renderText({paste(v$teller,"von", dim(seldf())[1])})
    output$testtext <- renderText({summary(partdf()$Tipp)})
    
    #output$Kontrolle <- renderTable(partdf2())
    
    #output$Kontrolle({
    #    ctrltab()
    #})
    
 
})
