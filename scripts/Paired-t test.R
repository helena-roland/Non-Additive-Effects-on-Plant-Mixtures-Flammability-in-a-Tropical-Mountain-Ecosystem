# Install and load necessary packages
install.packages("ecodados")  # Install the ecodados package from CRAN
library(ecodados)             # Load the ecodados package
library(devtools)            # Load devtools for installing packages from GitHub
install_github("paternogbc/ecodados")  # Install the ecodados package from GitHub
library(ggpubr)              # Load ggpubr for creating paired plots
library(gridExtra)          # Load gridExtra for arranging multiple plots

# Perform a paired t-test
test_result <- t.test(teste.t_table$Expected, teste.t_table$Observed, paired = TRUE)
# Perform a paired t-test comparing the 'Expected' and 'Observed' columns from the data frame
# 'paired = TRUE' specifies that the test is paired

print(test_result)
# Print the results of the paired t-test

# Create a paired plot using ggpaired
teste.t <- ggpaired(data = teste.t_table, 
                    cond1 = "Expected",  # Condition 1: 'Expected' values
                    cond2 = "Observed",  # Condition 2: 'Observed' values
                    x = "Expected",      # x-axis values
                    y = "Observed",      # y-axis values
                    color = "condition",  # Color by 'condition' (if applicable)
                    line.color = "gray",  # Line color connecting paired points
                    line.size = 0.7,      # Line size
                    point.shape = 21,     # Point shape (filled circle)
                    point.size = 1.7,     # Size of the points
                    palette = c("darkorange", "darkgreen"),  # Color palette for points
                    width = 0.5,         # Width of the boxes in the plot
                    xlab = "",           # x-axis label (empty)
                    ylab = "Remaining Biomass (g)") +  # y-axis label
  theme_minimal() +  # Use a minimal theme
  ggtitle("Expected vs Observed Remaining Biomass") +  # Title of the plot
  theme(
    legend.position = "none",  # Hide the legend
    plot.title = element_text(hjust = 0.5, size = 11),  # Center and set size of plot title
    axis.text.x = element_text(size = 11),  # Set size of x-axis labels
    axis.text.y = element_text(color = "black", size = 10),  # Set color and size of y-axis labels
    panel.background = element_rect(fill = "white", color = NA),  # Set panel background color to white
    plot.background = element_rect(fill = "white", color = NA),   # Set plot background color to white
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank(),  # Remove minor grid lines
    panel.border = element_rect(colour = "black", fill=NA, size=0.5),  # Add black border around the panel
    axis.line = element_line(color = "black"),  # Add black lines for the axes
    axis.text = element_text(color = "black"),  # Set color of axis text to black
    axis.title = element_text(color = "black"), # Set color of axis titles to black
    axis.title.y = element_text(margin = margin(r = 10))  # Increase right margin of y-axis title
  )


grid.arrange(boxplot.sp, teste.t, ncol = 2, widths = c(1, 1))
