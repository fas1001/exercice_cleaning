# Exercice de nettoyage et fusion de données - FAS1001

## Introduction aux mégadonnées en sciences sociales

Cet exercice vise à vous familiariser avec les techniques de base du nettoyage et de la fusion de données en R, des compétences essentielles en sciences sociales. Vous travaillerez avec les données de l'Étude électorale canadienne (CES) de 1993 et 2021.

## Structure du répertoire

```
exercice_cleaning
├── data
│   └── ces
│       ├── 1993
│       │   ├── clean
│       │   │   └── ces93_clean.csv
│       │   └── raw
│       │       └── ces93.csv
│       └── 2021
│           └── raw
│               └── ces2021.csv
├── docs
│   └── codebooks
│       ├── ces21_codebook.pdf
│       └── ces93_codebook.pdf
├── R
│   ├── 1_cleaning.R
│   ├── 2_merging.R
│   └── 3_graph.R
├── README.md
└── tests
    └── ex_cleaning_1.R
```

## Description des exercices

### 1. Nettoyage des données (`1_cleaning.R`)
Basé sur l'exemple fourni dans `tests/ex_cleaning_1.R`, vous devrez nettoyer les données du CES 2021 :
- Genre (cps21_genderid)
- Satisfaction démocratique (cps21_demsat)
- Probabilité de voter (cps21_v_likely)
- Statut vaccinal (cps21_vaccine1)
- Religion (cps21_religion)

### 2. Fusion des données (`2_merging.R`)
Après le nettoyage, vous devrez :
- Charger les données nettoyées de 1993 et 2021
- Sélectionner les variables de genre et probabilité de vote
- Standardiser les noms de variables
- Ajouter une variable temporelle
- Fusionner les datasets

### 3. Visualisation (`3_graph.R`)
Finalement, vous créerez un graphique montrant :
- L'évolution de la probabilité de voter entre 1993 et 2021
- Les différences selon le genre
- Une visualisation claire avec ggplot2

## Comment procéder

1. **Examinez l'exemple** (`tests/ex_cleaning_1.R`)
   - Comprendre les techniques de nettoyage
   - Noter la structure du code
   - Observer les transformations

2. **Nettoyez les données** (`1_cleaning.R`)
   - Appliquer les mêmes principes au CES 2021
   - Sauvegarder les données nettoyées

3. **Fusionnez les données** (`2_merging.R`)
   - Combiner les deux années
   - Créer un dataset longitudinal

4. **Créez la visualisation** (`3_graph.R`)
   - Produire un graphique comparatif
   - Analyser les tendances

## Techniques illustrées

- Nettoyage de données
  - Recodage de variables
  - Gestion des NA
  - Standardisation
  - Création d'échelles

- Fusion de données
  - Sélection de variables
  - Uniformisation des noms
  - Fusion verticale (rbind)

- Visualisation
  - ggplot2
  - Graphiques de tendances
  - Comparaisons par groupe

## Points importants à retenir

1. **Structure du code** :
   - Examiner (`table()`)
   - Nettoyer
   - Vérifier
   - Documenter

2. **Conventions de nommage** :
   - `ses_` (variables socio-démographiques)
   - `issue_` (variables d'opinion)
   - Noms descriptifs et cohérents

3. **Vérification** :
   - Avant/après nettoyage
   - `useNA = "ifany"`
   - Validation visuelle

## Note importante
Cet exercice n'est pas évalué mais est fortement recommandé comme préparation au quiz de la semaine prochaine.

## Astuces
- Suivez l'ordre numérique des scripts (1, 2, 3)
- Vérifiez vos résultats à chaque étape
- Consultez les codebooks au besoin
- Documentez vos choix méthodologiques

## Questions?
Pour toute question, utilisez le canal Slack du cours.
