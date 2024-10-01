# Install necessary packages
install.packages("ggpubr")
install.packages("tidyverse")
install.packages("rcompanion")
install.packages("multcompView")
install.packages("dunn.test")
install.packages("FSA")
install.packages("agricolae")
install.packages("MASS")

# Load the packages into R
library(ggpubr)
library(tidyverse)
library(rcompanion)
library(multcompView)
library(dunn.test)
library(FSA)
library(agricolae)
library(MASS)
library(car)
library(multcomp)


# # VARIANCE ANALYSES  # 

# # # # # # # # # # # # REMAINING BIOMASS # # # # # # # # # # # # # # # # # # 


# Load your data (assuming it is called 'remaining.biomass')

table <- remaining.biomass

# Convert 'Value' to numeric
table$Value <- as.numeric(table$Value)

# Convert 'SP' to a factor
table$SP <- as.factor(table$SP)

# # # # # # # # ## # #  # # 2.PERFORM ANOVA # # # # # # # # # # # # # # # 

# Conduct ANOVA
anova_result01 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result01))

# Check homogeneity of variances
leveneTest(table$Value ~ table$SP, center = mean)

# Convert the variable SP to a factor.
# This ensures that SP is treated as a categorical variable in statistical analyses.
table$SP <- as.factor(table$SP)

# 3. Perform Tukey's HSD test for multiple comparisons.
# This test is used after ANOVA to compare all pairs of group means and identify which groups are significantly different from each other.
# `glht` performs the test and `mcp(SP = "Tukey")` specifies that Tukey's test should be used.
comparacoes_tukey <- glht(anova_result02, linfct = mcp(SP = "Tukey"))

# 4. Generate the Compact Letter Display (CLD) for the Tukey test results.
# The CLD visually shows which groups are significantly different.
# Groups sharing the same letter are not significantly different from each other.
resultado_cld <- cld(comparacoes_tukey)

# 5. Print the CLD results.
# This displays the compact letter display, allowing you to interpret the differences between groups.
print(resultado_cld)




# # # # # # # # MEAN AVERAGE CONTRIBUTION TO MIXTURES FLAMMABILITY # # # # # # # # # # 

# # ## # # # # # # # # # # #   1.DATA PREPARATION # # # # # # # # # # # # # # # # # 

# Load your data (assuming it is called 'species.mean.contribution')
table <- species.mean.contribution

# Convert 'Value' to numeric
table$Value <- as.numeric(table$Value)

# Convert 'SP' to a factor
table$SP <- as.factor(table$SP)

# # # # # # # # ## # #  # # 2.PERFORM ANOVA # # # # # # # # # # # # # # # 

# Conduct ANOVA
anova_result01 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result01))

# Check homogeneity of variances
leveneTest(table$Value ~ table$SP, center = mean)

# # # # # # # 3.Data Transformation # # # # # # # # # 

# # # #  3.1 Log transformation # # # # 

# Apply log transformation
table$Value_log <- log(table$Value)

# Check homogeneity of variances for log-transformed data
leveneTest(table$Value_log ~ table$SP, center = mean)

# # # #  3.2 Square Root Transformation # # # # #

# Apply square root transformation
table$Value_sqrt <- sqrt(table$Value)

# Check homogeneity of variances for square root-transformed data
leveneTest(table$Value_sqrt ~ table$SP, center = mean)

# Perform ANOVA on square root-transformed data
anova_result02 <- aov(Value_sqrt ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result02))

# # # #  3.3 BoxCox Transformation # # # # #


# Verify if df is a data frame
is.data.frame(table)

# Perform Box-Cox transformation
boxcox_result1 <- boxcox(Value ~ SP, data = table)

# Extract the best lambda value from the Box-Cox results
best_lambda1 <- boxcox_result1$x[which.max(boxcox_result1$y)]

# Apply the Box-Cox transformation using the best lambda
table$Value <- (table$Value^best_lambda1 - 1) / 0.1

# Check homogeneity of variances for Box-Cox transformed data
leveneTest(table$Value ~ table$SP, center = mean)

# Perform ANOVA on Box-Cox transformed data
anova_result03 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result03))

# # # # # # # # ## # #  # # 4.Non-Parametric Analysis # # # # # # # # # # # # # # # 

# If none of the transformations worked, perform a non-parametric test
kruskal_cld <- kruskal(table$Value, table$SP, group = TRUE, p.adj = "bonferroni")$groups

# View results
print(kruskal_cld)

# Convert results to a data frame
cld <- as.data.frame(kruskal_cld)




# # # # # # # # MAXIMUM COMBUSTION RATE # # # # # # # # # #

# # ## # # # # # # # # # # #   1.DATA PREPARATION # # # # # # # # # # # # # # # # # 

# Load your data (assuming it is called 'mcr')
table <- mcr

# Convert 'Value' to numeric
table$Value <- as.numeric(table$Value)

# Convert 'SP' to a factor
table$SP <- as.factor(table$SP)

# # # # # # # # ## # #  # # 2.PERFORM ANOVA # # # # # # # # # # # # # # # 

# Conduct ANOVA
anova_result01 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result01))

# Check homogeneity of variances
leveneTest(table$Value ~ table$SP, center = mean)

# # # # # # # 3.Data Transformation # # # # # # # # # 

# # # #  3.1 Log transformation # # # # 

# Apply log transformation
table$Value_log <- log(table$Value)

# Check homogeneity of variances for log-transformed data
leveneTest(table$Value_log ~ table$SP, center = mean)

# # # #  3.2 Square Root Transformation # # # # #

# Apply square root transformation
table$Value_sqrt <- sqrt(table$Value)

# Check homogeneity of variances for square root-transformed data
leveneTest(table$Value_sqrt ~ table$SP, center = mean)

# Perform ANOVA on square root-transformed data
anova_result02 <- aov(Value_sqrt ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result02))


# Convert the variable SP to a factor.
# This ensures that SP is treated as a categorical variable in statistical analyses.
table$SP <- as.factor(table$SP)

# 3. Perform Tukey's HSD test for multiple comparisons.
# This test is used after ANOVA to compare all pairs of group means and identify which groups are significantly different from each other.
# `glht` performs the test and `mcp(SP = "Tukey")` specifies that Tukey's test should be used.
comparacoes_tukey <- glht(anova_result02, linfct = mcp(SP = "Tukey"))

# 4. Generate the Compact Letter Display (CLD) for the Tukey test results.
# The CLD visually shows which groups are significantly different.
# Groups sharing the same letter are not significantly different from each other.
resultado_cld <- cld(comparacoes_tukey)

# 5. Print the CLD results.
# This displays the compact letter display, allowing you to interpret the differences between groups.
print(resultado_cld)




# # # # # # # # FUEL MOISTURE CONTENT AT IGNITION POINT # # # # # # # # # # 

# # ## # # # # # # # # # # #   1.DATA PREPARATION # # # # # # # # # # # # # # # # # 

# Load your data (assuming it is called 'FMCig')
table <- FMCig

# Convert 'Value' to numeric
table$Value <- as.numeric(table$Value)

# Convert 'SP' to a factor
table$SP <- as.factor(table$SP)

# # # # # # # # ## # #  # # 2.PERFORM ANOVA # # # # # # # # # # # # # # # 

# Conduct ANOVA
anova_result01 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result01))

# Check homogeneity of variances
leveneTest(table$Value ~ table$SP, center = mean)

# # # # # # # 3.Data Transformation # # # # # # # # # 

# # # #  3.1 Log transformation # # # # 

# Apply log transformation
table$Value_log <- log(table$Value)

# Check homogeneity of variances for log-transformed data
leveneTest(table$Value_log ~ table$SP, center = mean)

# # # #  3.2 Square Root Transformation # # # # #

# Apply square root transformation
table$Value_sqrt <- sqrt(table$Value)

# Check homogeneity of variances for square root-transformed data
leveneTest(table$Value_sqrt ~ table$SP, center = mean)

# Perform ANOVA on square root-transformed data
anova_result02 <- aov(Value_sqrt ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result02))

# # # #  3.3 BoxCox Transformation # # # # #


# Verify if df is a data frame
is.data.frame(table)

# Perform Box-Cox transformation
boxcox_result1 <- boxcox(Value ~ SP, data = table)

# Extract the best lambda value from the Box-Cox results
best_lambda1 <- boxcox_result1$x[which.max(boxcox_result1$y)]

# Apply the Box-Cox transformation using the best lambda
table$Value <- (table$Value^best_lambda1 - 1) / 0.1

# Check homogeneity of variances for Box-Cox transformed data
leveneTest(table$Value ~ table$SP, center = mean)

# Perform ANOVA on Box-Cox transformed data
anova_result03 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result03))

# # # # # # # # ## # #  # # 4.Non-Parametric Analysis # # # # # # # # # # # # # # # 

# If none of the transformations worked, perform a non-parametric test

table <- FMCig

kruskal_cld <- kruskal(table$Value, table$SP, group = TRUE, p.adj = "bonferroni")$groups

# View results
print(kruskal_cld)

# Convert results to a data frame
cld <- as.data.frame(kruskal_cld)




# # # # # # # # # # # # # # #  Specific Leaf Area # # # # # # # # # # # # # # 

# # ## # # # # # # # # # # #   1.DATA PREPARATION # # # # # # # # # # # # # # # # # 

# Load your data (assuming it is called 'sla')
table <- sla

# Convert 'Value' to numeric
table$Value <- as.numeric(table$Value)

# Convert 'SP' to a factor
table$SP <- as.factor(table$SP)

# # # # # # # # ## # #  # # 2.PERFORM ANOVA # # # # # # # # # # # # # # # 

# Conduct ANOVA
anova_result01 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result01))

# Check homogeneity of variances
leveneTest(table$Value ~ table$SP, center = mean)

# # # # # # # 3.Data Transformation # # # # # # # # # 

# # # #  3.1 Log transformation # # # # 

# Apply log transformation
table$Value_log <- log(table$Value)

# Check homogeneity of variances for log-transformed data
leveneTest(table$Value_log ~ table$SP, center = mean)

# # # #  3.2 Square Root Transformation # # # # #

# Apply square root transformation
table$Value_sqrt <- sqrt(table$Value)

# Check homogeneity of variances for square root-transformed data
leveneTest(table$Value_sqrt ~ table$SP, center = mean)

# Perform ANOVA on square root-transformed data
anova_result02 <- aov(Value_sqrt ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result02))

# # # #  3.3 BoxCox Transformation # # # # #


# Verify if df is a data frame
is.data.frame(table)

# Perform Box-Cox transformation
boxcox_result1 <- boxcox(Value ~ SP, data = table)

# Extract the best lambda value from the Box-Cox results
best_lambda1 <- boxcox_result1$x[which.max(boxcox_result1$y)]

# Apply the Box-Cox transformation using the best lambda
table$Value <- (table$Value^best_lambda1 - 1) / 0.1

# Check homogeneity of variances for Box-Cox transformed data
leveneTest(table$Value ~ table$SP, center = mean)

# Perform ANOVA on Box-Cox transformed data
anova_result03 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result03))

# # # # # # # # ## # #  # # 4.Non-Parametric Analysis # # # # # # # # # # # # # # # 

# If none of the transformations worked, perform a non-parametric test

table <- sla

kruskal_cld <- kruskal(table$Value, table$SP, group = TRUE, p.adj = "bonferroni")$groups

# View results
print(kruskal_cld)

# Convert results to a data frame
cld <- as.data.frame(kruskal_cld)




# # # # # # # # # # # # # # #  Leaf Dry Matter Content # # # # # # # # # # # # # #

# # ## # # # # # # # # # # #   1.DATA PREPARATION # # # # # # # # # # # # # # # # # 

# Load your data (assuming it is called 'ldmc')
table <- ldmc

# Convert 'Value' to numeric
table$Value <- as.numeric(table$Value)

# Convert 'SP' to a factor
table$SP <- as.factor(table$SP)

# # # # # # # # ## # #  # # 2.PERFORM ANOVA # # # # # # # # # # # # # # # 

# Conduct ANOVA
anova_result01 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result01))

# Check homogeneity of variances
leveneTest(table$Value ~ table$SP, center = mean)

# # # # # # # 3.Data Transformation # # # # # # # # # 

# # # #  3.1 Log transformation # # # # 

# Apply log transformation
table$Value_log <- log(table$Value)

# Check homogeneity of variances for log-transformed data
leveneTest(table$Value_log ~ table$SP, center = mean)

# # # #  3.2 Square Root Transformation # # # # #

# Apply square root transformation
table$Value_sqrt <- sqrt(table$Value)

# Check homogeneity of variances for square root-transformed data
leveneTest(table$Value_sqrt ~ table$SP, center = mean)

# Perform ANOVA on square root-transformed data
anova_result02 <- aov(Value_sqrt ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result02))

# # # #  3.3 BoxCox Transformation # # # # #


# Verify if table is a data frame
is.data.frame(table)

# Perform Box-Cox transformation
boxcox_result1 <- boxcox(Value ~ SP, data = table)

# Extract the best lambda value from the Box-Cox results
best_lambda1 <- boxcox_result1$x[which.max(boxcox_result1$y)]

# Apply the Box-Cox transformation using the best lambda
table$Value <- (table$Value^best_lambda1 - 1) / 0.1

# Check homogeneity of variances for Box-Cox transformed data
leveneTest(table$Value ~ table$SP, center = mean)

# Perform ANOVA on Box-Cox transformed data
anova_result03 <- aov(Value ~ SP, data = table)

# Check residuals for normality
shapiro.test(resid(anova_result03))

# # # # # # # # ## # #  # # 4.Non-Parametric Analysis # # # # # # # # # # # # # # # 

# If none of the transformations worked, perform a non-parametric test

table <- ldmc

kruskal_cld <- kruskal(table$Value, table$SP, group = TRUE, p.adj = "bonferroni")$groups

# View results
print(kruskal_cld)

# Convert results to a data frame
cld <- as.data.frame(kruskal_cld)



