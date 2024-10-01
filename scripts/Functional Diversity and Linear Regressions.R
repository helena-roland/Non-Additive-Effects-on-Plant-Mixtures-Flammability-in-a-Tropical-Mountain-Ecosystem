# Install and load necessary packages
install.packages("FD")          # Install the FD package from CRAN
library('FD')                   # Load the FD package for functional diversity analysis
library(openxlsx)               # Load openxlsx for writing Excel files
library('ggplot2')              # Load ggplot2 for creating plots

# Define the path to the directory containing the files
caminho <- ("D:/Documentos/Helena Doutorado/EXPERIMENTO MUFLA/tabelas pro R/FD_6/")

# List of file names (without .txt extension)
arquivos <- c("CHU_ER_HI", "CHU_ER_LE", "CHU_ER_PLE", "CHU_LE_HI", "CHU_PLE_HI", "CHU_PLE_LE",
              "CO_CHU_ER", "CO_CHU_HI", "CO_CHU_LE", "CO_CHU_PLE", "CO_ER_HI", "CO_ER_LE",
              "CO_ER_PLE", "CO_LE_HI", "CO_MA_CHU", "CO_MA_ER", "CO_MA_HI", "CO_MA_LE",
              "CO_MA_PLE", "CO_PLE_LE", "CO_PLE_HI", "ER_LE_HI", "ER_PLE_HI", "ER_PLE_LE",
              "MA_CHU_ER", "MA_CHU_HI", "MA_CHU_LE", "MA_CHU_PLE", "MA_ER_HI", "MA_ER_LE",
              "MA_ER_PLE", "MA_LE_HI", "MA_PLE_HI", "MA_PLE_LE", "PLE_LE_HI")

# Load each file as a dataframe and assign it to a variable with the same name as the file
for (nome in arquivos) {
  # Create the full path to the file
  arquivo_completo <- paste0(caminho, nome, ".txt")
  
  # Load the file using read.table and set the first column as row names
  df <- read.table(arquivo_completo, header = TRUE, sep = "\t", row.names = 1)
  
  # Assign the loaded dataframe to a variable in the global environment with the same name as the file
  assign(nome, df)
}

# Calculate functional diversity metrics and write results to Excel files
FD1 <- dbFD(CHU_ER_HI)
FD.1 <- as.data.frame(FD1)
write.xlsx(FD.1, file = "FD.1.xlsx")

FD2 <- dbFD(CHU_ER_LE)
FD.2 <- as.data.frame(FD2)
write.xlsx(FD.2, file = "FD.2.xlsx")

FD3 <- dbFD(CHU_ER_PLE)
FD.3 <- as.data.frame(FD3)
write.xlsx(FD.3, file = "FD.3.xlsx")

FD4 <- dbFD(CHU_LE_HI)
FD.4 <- as.data.frame(FD4)
write.xlsx(FD.4, file = "FD.4.xlsx")

FD5 <- dbFD(CHU_PLE_HI)
FD.5 <- as.data.frame(FD5)
write.xlsx(FD.5, file = "FD.5.xlsx")

FD6 <- dbFD(CHU_PLE_LE)
FD.6 <- as.data.frame(FD6)
write.xlsx(FD.6, file = "FD.6.xlsx")

FD7 <- dbFD(CO_CHU_ER)
FD.7 <- as.data.frame(FD7)
write.xlsx(FD.7, file = "FD.7.xlsx")

FD8 <- dbFD(CO_CHU_HI)
FD.8 <- as.data.frame(FD8)
write.xlsx(FD.8, file = "FD.8.xlsx")

FD9 <- dbFD(CO_CHU_LE)
FD.9 <- as.data.frame(FD9)
write.xlsx(FD.9, file = "FD.9.xlsx")

FD10 <- dbFD(CO_CHU_PLE)
FD.10 <- as.data.frame(FD10)
write.xlsx(FD.10, file = "FD.10.xlsx")

FD11 <- dbFD(CO_ER_HI)
FD.11 <- as.data.frame(FD11)
write.xlsx(FD.11, file = "FD.11.xlsx")

FD12 <- dbFD(CO_ER_LE)
FD.12 <- as.data.frame(FD12)
write.xlsx(FD.12, file = "FD.12.xlsx")

FD13 <- dbFD(CO_ER_PLE)
FD.13 <- as.data.frame(FD13)
write.xlsx(FD.13, file = "FD.13.xlsx")

FD14 <- dbFD(CO_LE_HI)
FD.14 <- as.data.frame(FD14)
write.xlsx(FD.14, file = "FD.14.xlsx")

FD15 <- dbFD(CO_MA_CHU)
FD.15 <- as.data.frame(FD15)
write.xlsx(FD.15, file = "FD.15.xlsx")

FD16 <- dbFD(CO_MA_ER)
FD.16 <- as.data.frame(FD16)
write.xlsx(FD.16, file = "FD.16.xlsx")

FD17 <- dbFD(CO_MA_HI)
FD.17 <- as.data.frame(FD17)
write.xlsx(FD.17, file = "FD.17.xlsx")

FD18 <- dbFD(CO_MA_LE)
FD.18 <- as.data.frame(FD18)
write.xlsx(FD.18, file = "FD.18.xlsx")

FD19 <- dbFD(CO_MA_PLE)
FD.19 <- as.data.frame(FD19)
write.xlsx(FD.19, file = "FD.19.xlsx")

FD20 <- dbFD(CO_PLE_LE)
FD.20 <- as.data.frame(FD20)
write.xlsx(FD.20, file = "FD.20.xlsx")

FD21 <- dbFD(CO_PLE_HI)
FD.21 <- as.data.frame(FD21)
write.xlsx(FD.21, file = "FD.21.xlsx")

FD22 <- dbFD(ER_LE_HI)
FD.22 <- as.data.frame(FD22)
write.xlsx(FD.22, file = "FD.22.xlsx")

FD23 <- dbFD(ER_PLE_HI)
FD.23 <- as.data.frame(FD23)
write.xlsx(FD.23, file = "FD.23.xlsx")

FD24 <- dbFD(ER_PLE_LE)
FD.24 <- as.data.frame(FD24)
write.xlsx(FD.24, file = "FD.24.xlsx")

FD25 <- dbFD(MA_CHU_ER)
FD.25 <- as.data.frame(FD25)
write.xlsx(FD.25, file = "FD.25.xlsx")

FD26 <- dbFD(MA_CHU_HI)
FD.26 <- as.data.frame(FD26)
write.xlsx(FD.26, file = "FD.26.xlsx")

FD27 <- dbFD(MA_CHU_LE)
FD.27 <- as.data.frame(FD27)
write.xlsx(FD.27, file = "FD.27.xlsx")

FD28 <- dbFD(MA_CHU_PLE)
FD.28 <- as.data.frame(FD28)
write.xlsx(FD.28, file = "FD.28.xlsx")

FD29 <- dbFD(MA_ER_HI)
FD.29 <- as.data.frame(FD29)
write.xlsx(FD.29, file = "FD.29.xlsx")

FD30 <- dbFD(MA_ER_LE)
FD.30 <- as.data.frame(FD30)
write.xlsx(FD.30, file = "FD.30.xlsx")

FD31 <- dbFD(MA_ER_PLE)
FD.31 <- as.data.frame(FD31)
write.xlsx(FD.31, file = "FD.31.xlsx")

FD32 <- dbFD(MA_LE_HI)
FD.32 <- as.data.frame(FD32)
write.xlsx(FD.32, file = "FD.32.xlsx")

FD33 <- dbFD(MA_PLE_HI)
FD.33 <- as.data.frame(FD33)
write.xlsx(FD.33, file = "FD.33.xlsx")

FD34 <- dbFD(MA_PLE_LE)
FD.34 <- as.data.frame(FD34)
write.xlsx(FD.34, file = "FD.34.xlsx")

FD35 <- dbFD(PLE_LE_HI)
FD.35 <- as.data.frame(FD35)
write.xlsx(FD.35, file = "FD.35.xlsx")

# Perform regressions and plot results
### Regressions

# Regression for FRich
FLAMxFRic <- lm(FLAM ~ FRic, data = FD_all)  # Fit linear model
plot(FLAM ~ FRic, data = FD_all)              # Plot FLAM vs FRic
shapiro.test(resid(FLAMxFRic))                # Test residuals for normality
REG1 <- summary(FLAMxFRic)                    # Get summary of regression
REG1$r.squared                              # Extract R-squared value
REG1$coefficients[2, 4]                     # Extract p-value

# Regression for FDis
FLAMxFDis <- lm(FLAM ~ FDis, data = FD_all)  # Fit linear model
plot(FLAM ~ FDis, data = FD_all)              # Plot FLAM vs FDis
shapiro.test(resid(FLAMxFDis))                # Test residuals for normality
REG4 <- summary(FLAMxFDis)                    # Get summary of regression
REG4$r.squared                              # Extract R-squared value
REG4$coefficients[2, 4]                     # Extract p-value


# Regression for FDiv
FLAMxFDiv <- lm(FLAM ~ FDiv, data = FD_all)  # Fit linear model
plot(FLAM ~ FDiv, data = FD_all)              # Plot FLAM vs FDiv
shapiro.test(resid(FLAMxFDiv))                # Test residuals for normality
REG5 <- summary(FLAMxFDiv)                    # Get summary of regression
REG5$r.squared                              # Extract R-squared value
REG5$coefficients[2, 4]                     # Extract p-value

# Regression for CWM.LDMC
FLAMxCWM.LDMC <- lm(FLAM ~ CWM.LDMC, data = FD_all)  # Fit linear model
plot(FLAM ~ CWM.LDMC, data = FD_all)                  # Plot FLAM vs CWM.LDMC
shapiro.test(resid(FLAMxCWM.LDMC))                    # Test residuals for normality
REG6 <- summary(FLAMxCWM.LDMC)                        # Get summary of regression
REG6$r.squared                                  # Extract R-squared value
REG6$coefficients[2, 4]                         # Extract p-value

# Regression for CWM.SLA
FLAMxCWM.SLA <- lm(FLAM ~ CWM.SLA, data = FD_all)  # Fit linear model
plot(FLAM ~ CWM.SLA, data = FD_all)                # Plot FLAM vs CWM.SLA
shapiro.test(resid(FLAMxCWM.SLA))                  # Test residuals for normality
REG7 <- summary(FLAMxCWM.SLA)                      # Get summary of regression
REG7$r.squared                                # Extract R-squared value
REG7$coefficients[2, 4]                       # Extract p-value

# Regression for CWM.TUCig
FLAMxCWM.TUCig <- lm(FLAM ~ CWM.TUCig, data = FD_all)  # Fit linear model
plot(FLAM ~ CWM.TUCig, data = FD_all)                  # Plot FLAM vs CWM.TUCig
shapiro.test(resid(FLAMxCWM.TUCig))                    # Test residuals for normality
REG8 <- summary(FLAMxCWM.TUCig)                        # Get summary of regression
REG8$r.squared                                  # Extract R-squared value
REG8$coefficients[2, 4]                         # Extract p-value

# Regression for CWM.TMC
FLAMxCWM.TMC <- lm(FLAM ~ CWM.TMC, data = FD_all)  # Fit linear model
plot(FLAM ~ CWM.TMC, data = FD_all)                # Plot FLAM vs CWM.TMC
shapiro.test(resid(FLAMxCWM.TMC))                  # Test residuals for normality
REG9 <- summary(FLAMxCWM.TMC)                      # Get summary of regression
REG9$r.squared                                # Extract R-squared value
REG9$coefficients[2, 4]                       # Extract p-value



# Adjust p-values using Holm's correction
p_adjusted <- p.adjust(p.correction$p, method = "holm")  # Adjust p-values for multiple comparisons using Holm's method

# Load required libraries
library(ggplot2)  # For creating plots
library(dplyr)    # For data manipulation

# Plot for CWM.SLA
g1 <- ggplot(data = FD_all, aes(x = CWM.SLA, y = FLAM)) +
  geom_point(color = 'darkgreen', fill = 'palegreen3', shape = 21, size = 3) + # Points with dark green border and pale green fill
  geom_smooth(method = "lm", formula = y ~ x, col = "darkgreen", linetype = "dashed", fill = "palegreen3") + # Green dashed line and fill
  ggtitle("(a)") +
  xlab("SLA (mm² mg⁻¹)") +
  ylab("Remaining Biomass (g)") +
  theme_bw() +
  theme(
    text = element_text(family = "Arial"),
    axis.line = element_line(size = 1), # Adjust axis line thickness
    panel.grid.major = element_blank(), # Remove major grid lines
    panel.grid.minor = element_blank(), # Remove minor grid lines
    panel.border = element_blank() # Remove panel border
  ) +
  scale_x_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format x-axis numbers
  scale_y_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format y-axis numbers
  annotate("text", x = Inf, y = max(FD_all$FLAM) + 0.027, label = paste("R² = ", round(r2_3, 2), "\n", "p =  0.02"), 
           hjust = 1.1, vjust = 1.1, size = 3) # Add R² and p-value annotation

# Plot for CWM.LDMC
g2 <- ggplot(data = FD_all, aes(x = CWM.LDMC, y = FLAM)) +
  geom_point(color = 'darkgreen', fill = 'palegreen3', shape = 21, size = 3) + # Points with dark green border and pale green fill
  geom_smooth(method = "lm", formula = y ~ x, col = "darkgreen", linetype = "dashed", fill = "palegreen3") + # Green dashed line and fill
  ggtitle("(b)") +
  xlab("LDMC (%)") +
  ylab("Remaining Biomass (g)") +
  theme_bw() +
  theme(
    text = element_text(family = "Arial"),
    axis.line = element_line(size = 1), # Adjust axis line thickness
    panel.grid.major = element_blank(), # Remove major grid lines
    panel.grid.minor = element_blank(), # Remove minor grid lines
    panel.border = element_blank() # Remove panel border
  ) +
  scale_x_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format x-axis numbers
  scale_y_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format y-axis numbers
  annotate("text", x = Inf, y = max(FD_all$FLAM) + 0.027, label = paste("R² = ", round(r2_4, 2), "\n", "p = 0.03"), 
           hjust = 1.1, vjust = 1.1, size = 3) # Add R² and p-value annotation

# Plot for CWM.TUCig
g3 <- ggplot(data = FD_all, aes(x = CWM.TUCig, y = FLAM)) +
  geom_point(color = 'black', fill = 'white', shape = 1, size = 3) + # Black border with no fill
  geom_smooth(method = "lm", formula = y ~ x, col = "black", linetype = "dashed") + # Black dashed line
  ggtitle("(c)") +
  xlab("LFMCig (%)") +
  ylab("Remaining Biomass (g)") +
  theme_bw() +
  theme(
    text = element_text(family = "Arial"),
    axis.line = element_line(size = 1), # Adjust axis line thickness
    panel.grid.major = element_blank(), # Remove major grid lines
    panel.grid.minor = element_blank(), # Remove minor grid lines
    panel.border = element_blank() # Remove panel border
  ) +
  scale_x_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format x-axis numbers
  scale_y_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format y-axis numbers
  annotate("text", x = Inf, y = max(FD_all$FLAM) + 0.027, label = paste("R² = ", round(r2_5, 2), "\n", "p = 0.14"), 
           hjust = 1.1, vjust = 1.1, size = 3) # Add R² and p-value annotation

# Plot for CWM.TMC
g4 <- ggplot(data = FD_all, aes(x = CWM.TMC, y = FLAM)) +
  geom_point(color = 'darkgreen', fill = 'palegreen3', shape = 21, size = 3) + # Points with dark green border and pale green fill
  geom_smooth(method = "lm", formula = y ~ x, col = "darkgreen", linetype = "dashed", fill = "palegreen3") + # Green dashed line and fill
  ggtitle("(d)") +
  xlab("MCR (gs⁻¹)") +
  ylab("Remaining Biomass (g)") +
  theme_bw() +
  theme(
    text = element_text(family = "Arial"),
    axis.line = element_line(size = 1), # Adjust axis line thickness
    panel.grid.major = element_blank(), # Remove major grid lines
    panel.grid.minor = element_blank(), # Remove minor grid lines
    panel.border = element_blank() # Remove panel border
  ) +
  scale_x_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format x-axis numbers
  scale_y_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format y-axis numbers
  annotate("text", x = Inf, y = max(FD_all$FLAM) + 0.027, label = paste("R² = ", round(r2_6, 2), "\n", "p = 0.002"), 
           hjust = 1.1, vjust = 1.1, size = 3) # Add R² and p-value annotation

# Plot for FRic
g5 <- ggplot(data = FD_all, aes(x = FRic, y = FLAM)) +
  geom_point(color = 'darkgreen', fill = 'palegreen3', shape = 21, size = 3) + # Points with dark green border and pale green fill
  geom_smooth(method = "lm", formula = y ~ x, col = "darkgreen", linetype = "dashed", fill = "palegreen3") + # Green dashed line and fill
  ggtitle("(e)") +
  xlab("FRic") +
  ylab("Remaining Biomass (g)") +
  theme_bw() +
  theme(
    text = element_text(family = "Arial"),
    axis.line = element_line(size = 1), # Adjust axis line thickness
    panel.grid.major = element_blank(), # Remove major grid lines
    panel.grid.minor = element_blank(), # Remove minor grid lines
    panel.border = element_blank() # Remove panel border
  ) +
  scale_x_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format x-axis numbers
  scale_y_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format y-axis numbers
  annotate("text", x = Inf, y = max(FD_all$FLAM) + 0.027, label = paste("R² = ", round(r2_1, 2), "\n", "p = 0.02"), 
           hjust = 1.1, vjust = 1.1, size = 3) # Add R² and p-value annotation


# Plot for FDiv
g6 <- ggplot(data = FD_all, aes(x = FDiv, y = FLAM)) +
  geom_point(color = 'black', fill = 'white', shape = 1, size = 3) + # Black border with no fill
  geom_smooth(method = "lm", formula = y ~ x, col = "black", linetype = "dashed") + # Black dashed line
  ggtitle("(f)") +
  xlab("FDiv") +
  ylab("Remaining Biomass (g)") +
  theme_bw() +
  theme(
    text = element_text(family = "Arial"),
    axis.line = element_line(size = 1), # Adjust axis line thickness
    panel.grid.major = element_blank(), # Remove major grid lines
    panel.grid.minor = element_blank(), # Remove minor grid lines
    panel.border = element_blank() # Remove panel border
  ) +
  scale_x_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format x-axis numbers
  scale_y_continuous(labels = scales::number_format(accuracy = 0.01)) + # Format y-axis numbers
  annotate("text", x = Inf, y = max(FD_all$FLAM) + 0.027, label = paste("R² = ", round(r2_2, 2), "\n", "p = 0.07"), 
           hjust = 1.1, vjust = 1.1, size = 3) # Add R² and p-value annotation

# Load the gridExtra library for arranging multiple plots
library(gridExtra)

# Arrange and display all plots in a grid layout with 2 columns
grid.arrange(g1, g2, g3, g4, g5, g6, ncol = 2, widths = c(1, 1))

