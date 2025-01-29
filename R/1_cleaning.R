#==============================================================================
# EXERCICE DE NETTOYAGE DE DONNÉES
# CES 2021 (Canadian Election Study)
# FAS1001 - Introduction aux mégadonnées en sciences sociales
#==============================================================================

# ÉTAPE 1: Charger les packages nécessaires
library(dplyr)

# ÉTAPE 2: Charger les données
# Charger le fichier CES2021.csv et sélectionner les variables suivantes:
#   - cps21_genderid : Genre du répondant
#   - cps21_demsat : Satisfaction envers la démocratie 
#   - cps21_v_likely : Probabilité d'aller voter
#   - cps21_vaccine1 : Statut vaccinal COVID-19
#   - cps21_religion : Religion du répondant

df_raw <- read.csv("data/ces/2021/raw/ces2021.csv") # <- Insérer le chemin du fichier

# ÉTAPE 3: Créer un nouveau dataframe propre
df_clean <- data.frame(id = 1:nrow(df_raw))

#------------------------------------------------------------------------------#
# VARIABLE : cps21_genderid 
# Question : À quel genre vous identifiez-vous?
# À FAIRE: 
# - Examiner les données avec table()
# - Créer une nouvelle variable ses_gender
# - Nettoyer en "male", "female", "other"
# - Convertir en facteur
# - Vérifier avec table()
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# VARIABLE : cps21_demsat
# Question : Dans l'ensemble, quel est votre niveau de satisfaction quant au
#            fonctionnement de la démocratie au Canada? 
# À FAIRE:
# - Examiner les données avec table()
# - Créer une nouvelle variable issue_democracy_satisfaction
# - Créer une échelle de satisfaction (0 à 1)
# - Mettre les "don't know" en NA
# - Vérifier avec table() et useNA = "ifany"
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# VARIABLE : cps21_v_likely
# Question : Lors du jour de l'élection, est-il... (Intentions d'aller voter)
# DÉFI DE NETTOYAGE: 
# - Examiner les données avec table()
# - Créer une nouvelle variable vote_probability
# - RÉFLEXION: Comment traiter les "already voted"?
#   Option 1: Les mettre avec "certain to vote" (= 1)
#   Option 2: En faire une catégorie séparée
#   Option 3: Les exclure de l'analyse
# - Vérifier avec table()
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# VARIABLE : cps21_vaccine1
# Question :  Êtes-vous vacciné(e) contre la COVID-19?
# À FAIRE:
# - Examiner les données avec table()
# - Créer une nouvelle variable issue_is_vaccinated
# - Créer une variable binaire (1 = vacciné, 0 = non-vacciné)
# - Vérifier avec table() et useNA = "ifany"
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# VARIABLE : cps21_religion
# Question : Quelle est votre religion?
# À FAIRE:
# - Examiner les données avec table()
# - Créer une nouvelle variable ses_religion
# - Regrouper en 5 grandes catégories:
#   "christianisme", "islam", "judaisme", "hindouisme", "bouddhisme"
# - Que faire des autres religions? Des non-religieux? Mettre dans NA?
# - Convertir en facteur
# - Vérifier avec table()
#------------------------------------------------------------------------------#

# ÉTAPE 4: Sauvegarder les données nettoyées
# À FAIRE: Sauvegarder df_clean en format CSV dans le dossier "data/ces/2021/"
write.csv() # <- Insérer le dataframe à sauvegarder et le chemin du fichier ansi que le nom du fichier
