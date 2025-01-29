# Charger les packages nécessaires
library(dplyr)

# Lire et sélectionner les données
df_raw <- read.csv("data/ces/1993/raw/ces93.csv")

# Créer un nouveau dataframe propre avec une colonne id
df_clean <- data.frame(id = 1:nrow(df_raw))

#------------------------------------------------------------------------------#
# VARIABLE : cpsigen - Gender of the respondent 
# Question : INTERVIEWER: Enter respondent's gender please
#------------------------------------------------------------------------------#
table(df_raw$cpsigen)
df_clean$ses_gender <- NA
df_clean$ses_gender[df_raw$cpsigen == "female"] <- "female"
df_clean$ses_gender[df_raw$cpsigen == "male"] <- "male"
df_clean$ses_gender <- as.factor(df_clean$ses_gender)
table(df_clean$ses_gender)

#------------------------------------------------------------------------------#
# VARIABLE : cpsa3 - Vote intention
# Question : If you do vote, which party do you think you will vote for: 
#           the Conservative Party, the Liberal Party, the New Democratic Party, 
#           the [fill rc3] or another party?
#------------------------------------------------------------------------------#
table(df_raw$cpsa3)
df_clean$vote_intention <- NA
df_clean$vote_intention[df_raw$cpsa3 == "conservative"] <- "cpc"
df_clean$vote_intention[df_raw$cpsa3 == "bloc quebecois"] <- "bq"
df_clean$vote_intention[df_raw$cpsa3 == "liberal"] <- "lpc"
df_clean$vote_intention[df_raw$cpsa3 == "ndp"] <- "ndp"
df_clean$vote_intention[df_raw$cpsa3 == "reform"] <- "rpc"
df_clean$vote_intention <- as.factor(df_clean$vote_intention)
table(df_clean$vote_intention, useNA = "ifany")

#------------------------------------------------------------------------------#
# VARIABLE : cpsg1 - GST opposition
# Question : In 1991 the Federal government adopted a new tax on goods and 
#           services, the GST. All things considered, are you VERY MUCH IN FAVOUR, 
#           SOMEWHAT IN FAVOUR, SOMEWHAT OPPOSED, or VERY MUCH OPPOSED to the GST?
# Codage   : 1 = Opposed, 0 = Favour
#------------------------------------------------------------------------------#
table(df_raw$cpsg1)
df_clean$issue_gst_opposed <- NA
df_clean$issue_gst_opposed[df_raw$cpsg1 == "verymuch favour"] <- 0
df_clean$issue_gst_opposed[df_raw$cpsg1 == "somewhat favour"] <- 0.33
df_clean$issue_gst_opposed[df_raw$cpsg1 == "somewhat opposed"] <- 0.67
df_clean$issue_gst_opposed[df_raw$cpsg1 == "verymuch opposed"] <- 1
table(df_clean$issue_gst_opposed, useNA = "ifany")

#------------------------------------------------------------------------------#
# VARIABLE : cpso11 - Born in Canada
# Question : In which country were you born?
# Codage   : 1 = Canada, 0 = Other
#------------------------------------------------------------------------------#
table(df_raw$cpso11)
df_clean$ses_born_canada <- NA
df_clean$ses_born_canada[df_raw$cpso11 == "canada"] <- 1
df_clean$ses_born_canada[df_raw$cpso11 != "canada"] <- 0
table(df_clean$ses_born_canada, useNA = "ifany")

#------------------------------------------------------------------------------#
# VARIABLE : cpsa2 - Probability of voting
# Question : How likely is it that you will vote on election day?
# Codage   : 0 = Very unlikely, 1 = Very likely
#------------------------------------------------------------------------------#
table(df_raw$cpsa2)
df_clean$vote_probability_to_vote <- NA
df_clean$vote_probability_to_vote[df_raw$cpsa2 == "very unlikely"] <- 0
df_clean$vote_probability_to_vote[df_raw$cpsa2 == "somewhatunlikely"] <- 0.33
df_clean$vote_probability_to_vote[df_raw$cpsa2 == "somewhat likely"] <- 0.67
df_clean$vote_probability_to_vote[df_raw$cpsa2 == "very likely"] <- 1
table(df_clean$vote_probability_to_vote, useNA = "ifany")

# Sort variables. ses first, then vote, then issues
df_clean <- df_clean %>% select(starts_with("ses"), starts_with("vote"), starts_with("issue"))

# Sauvegarder les données nettoyées
write.csv(df_clean, "data/ces/1993/clean/ces93_clean.csv", row.names = FALSE)
