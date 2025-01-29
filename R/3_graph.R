#==============================================================================
# VISUALISATION : ÉVOLUTION DE LA PROBABILITÉ DE VOTER PAR GENRE
# CES 1993-2021 (Canadian Election Study)
# FAS1001 - Introduction aux mégadonnées en sciences sociales
#==============================================================================

# Charger les packages
library(dplyr)
library(ggplot2)

# Charger les données combinées
ces_combined <- read.csv("data/data_vote_gender.csv")

# Calculer les moyennes par année et genre
vote_means <- ces_combined %>%
  group_by(year, ses_gender) %>%
  summarise(mean_probability = mean(vote_probability, na.rm = TRUE))

# Créer le dossier pour les graphiques si nécessaire
dir.create("results/graphs", recursive = TRUE, showWarnings = FALSE)

# Créer le ggplot
ggplot(vote_means, aes(x = year, y = mean_probability, color = ses_gender)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  scale_y_continuous(limits = c(0, 1), labels = function(x) paste0(x * 100, "%")) +
  scale_color_manual(values = c("female" = "#FF6B6B", "male" = "#4ECDC4")) +
  labs(title = "Évolution de la probabilité de voter par genre",
       x = "Année",
       y = "Probabilité moyenne de voter",
       color = "Genre") +
  theme_minimal() +
  theme(legend.position = "bottom") 
 
# Sauvegarder le graphique
ggsave("results/graphs/vote_prob.png", width = 16, height = 9, dpi = 300)
