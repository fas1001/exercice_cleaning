# Charger les packages nécessaires
library(dplyr)

# Lire et sélectionner les données
df_raw <- read.csv("data/ces/1993/raw/CES-E-1993_F1_subset.csv")

# Créer un nouveau dataframe propre avec une colonne id
df_clean <- data.frame(id = 1:nrow(df_raw))

#------------------------------------------------------------------------------#
# VARIABLE : CPSIGEN - Gender of the respondent 
# Question : INTERVIEWER: Enter respondent's gender please
#------------------------------------------------------------------------------#
table(df_raw$CPSIGEN, useNA = "ifany")
df_clean$ses_gender <- NA
df_clean$ses_gender[df_raw$CPSIGEN == 1] <- "male"
df_clean$ses_gender[df_raw$CPSIGEN == 5] <- "female"
df_clean$ses_gender <- as.factor(df_clean$ses_gender)
table(df_clean$ses_gender, useNA = "ifany")

#------------------------------------------------------------------------------#
# VARIABLE : CPSA3 - Vote intention
# Question : If you do vote, which party do you think you will vote for: 
#           the Conservative Party, the Liberal Party, the New Democratic Party, 
#           the [fill rc3] or another party?
#------------------------------------------------------------------------------#
table(df_raw$CPSA3, useNA = "ifany")
df_clean$vote_intention <- NA
df_clean$vote_intention[df_raw$CPSA3 == 1] <- "cpc"
df_clean$vote_intention[df_raw$CPSA3 == 5] <- "bq"
df_clean$vote_intention[df_raw$CPSA3 == 2] <- "lpc"
df_clean$vote_intention[df_raw$CPSA3 == 3] <- "ndp"
df_clean$vote_intention[df_raw$CPSA3 == 4] <- "rpc"
df_clean$vote_intention <- as.factor(df_clean$vote_intention)
table(df_clean$vote_intention, useNA = "ifany")

#------------------------------------------------------------------------------#
# VARIABLE : CPSG1 - GST opposition
# Question : In 1991 the Federal government adopted a new tax on goods and 
#           services, the GST. All things considered, are you VERY MUCH IN FAVOUR, 
#           SOMEWHAT IN FAVOUR, SOMEWHAT OPPOSED, or VERY MUCH OPPOSED to the GST?
# Codage   : 1 = Opposed, 0 = Favour
#------------------------------------------------------------------------------#
table(df_raw$CPSG1, useNA = "ifany")
df_clean$issue_gst_opposed <- NA
df_clean$issue_gst_opposed[df_raw$CPSG1 == 1] <- 0
df_clean$issue_gst_opposed[df_raw$CPSG1 == 3] <- 0.33
df_clean$issue_gst_opposed[df_raw$CPSG1 == 5] <- 0.67
df_clean$issue_gst_opposed[df_raw$CPSG1 == 7] <- 1
table(df_clean$issue_gst_opposed, useNA = "ifany")

#------------------------------------------------------------------------------#
# VARIABLE : CPSO11 - Born in Canada
# Question : In which country were you born?
# Codage   : 1 = Canada, 0 = Other
#------------------------------------------------------------------------------#
table(df_raw$CPSO11, useNA = "ifany")
df_clean$ses_born_canada <- NA
df_clean$ses_born_canada[df_raw$CPSO11 == 1] <- 1
df_clean$ses_born_canada[df_raw$CPSO11 != 1] <- 0
table(df_clean$ses_born_canada, useNA = "ifany")

#------------------------------------------------------------------------------#
# VARIABLE : CPSA2 - Probability of voting
# Question : How likely is it that you will vote on election day?
# Codage   : 0 = Very unlikely, 1 = Very likely
#------------------------------------------------------------------------------#
table(df_raw$CPSA2)
df_clean$vote_probability_to_vote <- NA
df_clean$vote_probability_to_vote[df_raw$CPSA2 == 7] <- 0
df_clean$vote_probability_to_vote[df_raw$CPSA2 == 5] <- 0.33
df_clean$vote_probability_to_vote[df_raw$CPSA2 == 3] <- 0.67
df_clean$vote_probability_to_vote[df_raw$CPSA2 == 1] <- 1
table(df_clean$vote_probability_to_vote, useNA = "ifany")

# Sort variables. ses first, then vote, then issues
df_clean <- df_clean %>% select(starts_with("ses"), starts_with("vote"), starts_with("issue"))

# Sauvegarder les données nettoyées
write.csv(df_clean, "data/ces/1993/clean/ces93_clean.csv", row.names = FALSE)
