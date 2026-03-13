# California Housing Dashboard

An interactive dashboard for exploring how proximity to the ocean impacts housing prices in California (1990). This dashboard uses publicly available data from Kaggle (https://www.kaggle.com/datasets/camnugent/california-housing-prices). 


**Live dashboard:** <https://019ce8b5-0595-235d-b56f-5465ae351985.share.connect.posit.cloud/>


## Run locally
### Clone the repository
Using HTTPS:
```bash
git clone https://github.com/nicolelink33/532_IA_California_housing_R.git
```

Or using SSH:
```bash
git clone git@github.com:nicolelink33/532_IA_California_housing_R.git
```

### Set up RStudio
Open a new RStudio session and navigate to the project root by going to `Select` --> `Set Working Directory` --> `Choose Directory` and selecting the folder "532_IA_California_housing_R". 

Install the required packages by running:
```R
install.packages(c("shiny", "bslib", "readr", "dplyr", "ggplot2", "scales"))
```

### Launch the dashboard
Open `app.R` and click `Run App`, or run the following in the RStudio Console:
```R
library(shiny)
runApp()
```

You can view the dashboard in the RStudio pop up or at: http://127.0.0.1:7496.
