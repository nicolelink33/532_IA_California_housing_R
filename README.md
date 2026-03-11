# California Housing Dashboard

An interactive dashboard for exploring the geographic and socioeconomic drivers of housing prices in California (1990).

**Live dashboards**


## Run locally
### Install required packages
- open a new R or RStudio session and run:
```R
install.packages("shiny")
```

### Clone the repository
Using HTTPS:
```bash
git clone https://github.com/nicolelink33/532_IA.git
```

Or using SSH:
```bash
git clone git@github.com:nicolelink33/532_IA.git
```

In RStudio session, navigate to the project root:
```R
setwd("532_IA")
```

Launch the dashboard
```R
library(shiny)
runApp("src")
```

You can view the dashboard in the RStudio pop up or at: http://127.0.0.1:7496.


