#==============================================================================
# EXERCICE DE MERGING DE DONNÉES
# CES 1993 et 2021 (Canadian Election Study)
# FAS1001 - Introduction aux mégadonnées en sciences sociales
#==============================================================================

# ÉTAPE 1: Charger les packages nécessaires
library(dplyr)
library(ggplot2)

#------------------------------------------------------------------------------#
# PARTIE 1 : CHARGEMENT DES DONNÉES
# À FAIRE:
# - Charger les données nettoyées de 1993
# - Charger les données nettoyées de 2021
#------------------------------------------------------------------------------#

# Charger CES 1993
df_ces93 <- read.csv("data/ces/1993/clean/ces93_clean.csv")

# Charger CES 2021
df_ces21 <- read.csv("data/ces/2021/clean/ces21_clean.csv")

#------------------------------------------------------------------------------#
# PARTIE 2 : SÉLECTION DES VARIABLES
# À FAIRE:
# - Garder uniquement les variables de genre et probabilité de voter
# - Utiliser select() de dplyr
#------------------------------------------------------------------------------#

df_ces93_subset <- ces93 %>%
  select(ses_gender, vote_probability_to_vote)

df_ces21_subset <- ces21 %>%
  select(ses_gender, vote_probability)

#------------------------------------------------------------------------------#
# PARTIE 3 : STANDARDISATION DES NOMS DE VARIABLES
# À FAIRE:
# - S'assurer que les noms des variables sont identiques dans les deux datasets
# - Utiliser rename() si nécessaire
#------------------------------------------------------------------------------#

# La variable de probabilité de voter a un nom différent dans les deux datasets
df_ces93_subset <- df_ces93_subset %>%
  rename(vote_probability = vote_probability_to_vote)

#------------------------------------------------------------------------------#
# PARTIE 4 : AJOUT DE LA VARIABLE TEMPORELLE
# À FAIRE:
# - Créer une variable 'year' dans chaque dataset
# - 1993 pour CES93
# - 2021 pour CES21
#------------------------------------------------------------------------------#

df_ces93_subset$year <- 1993
df_ces21_subset$year <- 2021

#------------------------------------------------------------------------------#
# PARTIE 5 : FUSION DES DONNÉES
# À FAIRE:
# - Utiliser rbind() pour combiner les deux datasets
# - Les colonnes doivent être dans le même ordre
# Note: rbind() est plus simple que merge() ici car nous voulons simplement
# empiler les données verticalement
#------------------------------------------------------------------------------#

df_combined <- rbind(df_ces93_subset, df_ces21_subset)

#------------------------------------------------------------------------------#
# PARTIE 6 : SAUVEGARDE DES DONNÉES
# À FAIRE:
# - Sauvegarder le dataset combiné
# - Utiliser un nom descriptif
#------------------------------------------------------------------------------#

write.csv(df_combined, "data/data_vote_gender.csv", row.names = FALSE)
