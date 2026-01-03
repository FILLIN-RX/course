# Gestion et Suivi des Séances de Cours et TD

## 📋 Vue d'ensemble

Une application de gestion centralisée des séances de cours et travaux dirigés (TD) pour le département d'Informatique de l'Université de Yaoundé I. Cette solution facilite la coordination entre le chef de département, les enseignants et l'administration.

## 🎯 Objectifs

### Objectif général
Développer une solution logicielle permettant au chef de département et aux enseignants de planifier, organiser, gérer et suivre efficacement l'ensemble des séances de cours et TD du département.

### Objectifs spécifiques
- ✅ Planification des séances (cours magistraux, TD, travaux pratiques)
- ✅ Gestion des enseignants et de leurs horaires
- ✅ Attribution et gestion des salles
- ✅ Visualisation des emplois du temps
- ✅ Suivi des séances effectuées et non effectuées
- ✅ Génération de rapports (statistiques, récapitulatifs, alertes)
- ✅ Réduction des conflits d'horaires et des doublons

## 🔧 Stack Technologique

- **Langage** : C++
- **Framework UI** : Qt 6.10.1
- **Langage de mise en page** : QML
- **Build System** : CMake
- **Base de données** : PostgreSQL
- **Compilateur** : MinGW 64-bit

## 📁 Structure du projet

```
course/
├── CMakeLists.txt              # Configuration de build
├── main.cpp                    # Point d'entrée
├── Files/
│   └── Main.qml               # Fenêtre principale
├── controllers/               # Logique métier
├── models/                    # Modèles de données
├── pages/
│   ├── Login.qml             # Écran de connexion
│   ├── Register.qml          # Écran d'enregistrement
│   └── ...
├── build/                     # Répertoire de compilation
└── .vscode/                   # Configuration VS Code
```

## 🚀 Fonctionnalités principales

### Pour les Enseignants
- Visualiser et gérer leur horaire personnel
- Signaler les modifications de séances
- Consulter les salles assignées
- Voir les statistiques de présence

### Pour le Chef de Département
- Vue globale de tous les emplois du temps
- Gestion des ressources (salles, créneaux)
- Résolution des conflits d'horaires
- Génération de rapports et statistiques
- Gestion des enseignants et leurs responsabilités

### Pour l'Administration
- Gestion centralisée des données
- Archivage et suivi historique
- Export de rapports

## 🔒 Sécurité et Contraintes

- Interface intuitive pour les utilisateurs non techniciens
- Accessible depuis ordinateur et smartphone
- Fonctionne avec un accès Internet limité ou intermittent
- Données sécurisées et protégées contre les modifications non autorisées
- Technologie adaptée à un projet pédagogique

## 📋 Prérequis

- Windows 10 ou supérieur (pour le développement)
- Qt 6.10.1 ou supérieur
- CMake 3.20 ou supérieur
- MinGW 64-bit (compilateur)
- PostgreSQL 16 ou supérieur
- Visual Studio Code (optionnel)

## 🛠️ Installation et Utilisation

### Pour les utilisateurs finaux
1. Télécharger l'exécutable de la [page releases](releases)
2. Lancer l'application
3. Se connecter avec vos identifiants

### Pour les développeurs
Consultez [DEVELOPERS.md](DEVELOPERS.md) pour les instructions détaillées.

## 📊 Contexte et Motivation

Le département d'Informatique de l'Université de Yaoundé I connaît une croissance significative de son nombre d'étudiants. Cette augmentation crée des défis organisationnels majeurs :

- Chevauchements de séances fréquents
- Difficultés dans le suivi des heures enseignées
- Retards d'informations entre enseignants et administration
- Manque de visibilité globale pour le chef de département
- Confusions dans la planification des salles

Cette application offre une solution centralisée et fiable à ces problèmes.

## 👥 Contributeurs

- Fillin (Développeur principal)

## 📄 Licence

À définir

## 📞 Support

Pour les problèmes ou suggestions, veuillez contacter le département d'Informatique.

## 🔄 Statut du projet

Status : **En développement** 🚧
