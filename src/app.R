library(shiny)
library(bslib)
library(readr)
library(dplyr)
library(ggplot2)

# Load the data
processed_data <- read_csv("../data/processed/housing_with_county.csv")
subset_df <- processed_data |>
  select(median_house_value, ocean_proximity)


# page setup
ui <- page_sidebar(
  # App title ----
  title = "California Housing Dashboard",
  
  # Sidebar panel for inputs ----
  sidebar = sidebar(
    title = "Filters",
    
    # Input: Select ocean proximity types ----
    checkboxGroupInput(
      inputId = "ocean",
      label = "Select Ocean Proximity:",
      choices = list("<1Hr Ocean" ="<1H OCEAN", 
                     "Near Ocean" = "NEAR OCEAN", 
                      "Near Bay" = "NEAR BAY", 
                      "Island" = "ISLAND", 
                      "Inland" ="INLAND"),
      selected = "NEAR OCEAN"
    )
  ),
  
  # Output 1: Value box ----
  value_box(
    title="Median house value",
    value=textOutput("median_value")
  ),
  
  # Output 2: Density plot ----
  card(
    card_header("House Value Density Plot"),
    plotOutput(outputId = "density_Plot")
    )
)

# server
server <- function(input, output, session) {

  # Filter data
  filtered_df <- reactive({
    req(input$ocean)
    
    subset_df |>
      filter(ocean_proximity %in% input$ocean)
  })
    
  # Median value output
  output$median_value <- renderText({
    scales::dollar(median(filtered_df()$median_house_value, na.rm=TRUE))
  })
  
  # Density plot
  output$density_Plot <- renderPlot({
    
    ggplot() +
      
      # Overall state distribution
      geom_density(
        data = subset_df,
        aes(x = median_house_value, fill = "Overall State"),
        alpha = 0.3
      ) +
      
      # Filtered distribution
      geom_density(
        data = filtered_df(),
        aes(x = median_house_value, fill = "Filtered Houses"),
        alpha = 0.6
      ) +
      
      scale_fill_manual(
        values = c(
          "Overall State" = "darkgreen",
          "Filtered Houses" = "lightblue"
        )
      ) +
      
      scale_x_continuous(labels = scales::dollar) +
      
      labs(
        x = "House Value",
        y = "Density",
        fill = "Data"
      )
    
  })
  
}


shinyApp(ui = ui, server = server)
