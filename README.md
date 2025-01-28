# Exercice de nettoyage de données - FAS1001
## Introduction aux mégadonnées en sciences sociales

Cet exercice vise à vous familiariser avec les techniques de base du nettoyage de données en R, une compétence essentielle en sciences sociales. Vous travaillerez avec les données de l'Étude électorale canadienne (CES), l'une des plus importantes études sur le comportement électoral au Canada.

## Structure du répertoire

```
exercice_cleaning
├── data
│   └── ces
│       ├── 1965
│       │   └── raw
│       │       └── ces65.csv
│       ├── 1968
│       │   └── raw
│       │       └── ces68.csv
│       ├── 1993
│       │   ├── clean
│       │   │   └── ces93_clean.csv
│       │   └── raw
│       │       └── ces93.csv
│       └── 2021
│           └── raw
│               └── ces2021.csv
├── docs
│   └── codebooks
│       ├── CES2021_codebook.pdf
│       ├── ces65_codebook.pdf
│       ├── ces68_codebook.pdf
│       └── ces93_codebook.pdf
├── R
│   └── cleaning.R
├── README.md
└── tests
    └── ex_cleaning_1.R
```

## Description de l'exercice

### 1. Exemple guidé (CES 1993)
Le script `exemple_nettoyage_1993.R` montre comment nettoyer 5 variables du CES 1993 :
- Genre du répondant
- Intention de vote
- Opposition à la TPS
- Pays de naissance
- Sentiment envers les peuples autochtones

### 2. Exercice pratique (CES 2021)
Le script `exercice_nettoyage_2021.R` vous propose de nettoyer 5 variables du CES 2021 :
- Genre (cps21_genderid)
- Satisfaction démocratique (cps21_demsat)
- Probabilité de voter (cps21_v_likely)
- Statut vaccinal (cps21_vaccine1)
- Religion (cps21_religion)

## Comment procéder

1. **Commencez par l'exemple** :
   - Exécutez le code de l'exemple ligne par ligne
   - Observez comment chaque variable est nettoyée
   - Notez les différentes techniques utilisées

2. **Passez à l'exercice** :
   - Suivez la même structure que l'exemple
   - Adaptez les techniques de nettoyage selon les spécificités de chaque variable
   - Réfléchissez aux choix méthodologiques (ex: traitement des "already voted")

## Techniques de nettoyage illustrées

- Recodage de variables catégorielles
- Création d'échelles (0 à 1)
- Gestion des valeurs manquantes (NA)
- Standardisation des noms de variables
- Création de variables binaires
- Regroupement de catégories

## Points importants à retenir

1. **Structure du code** :
   - Examiner les données brutes (`table()`)
   - Créer une nouvelle variable
   - Nettoyer les données
   - Vérifier le résultat

2. **Conventions de nommage** :
   - `ses_` pour les variables socio-démographiques
   - `issue_` pour les variables d'opinion
   - Noms descriptifs et cohérents

3. **Vérification** :
   - Toujours vérifier avant et après le nettoyage
   - Utiliser `useNA = "ifany"` pour voir les valeurs manquantes

## Note importante

Cet exercice n'est pas évalué mais est fortement recommandé comme préparation au quiz de la semaine prochaine, qui suivra une structure similaire.

## Astuces

- Prenez le temps d'examiner les données brutes avant de commencer
- Documentez vos choix de nettoyage
- N'hésitez pas à consulter l'exemple en cas de doute
- Vérifiez toujours vos résultats après chaque transformation

## Questions?

Pour toute question, utilisez le canal Slack du cours.
