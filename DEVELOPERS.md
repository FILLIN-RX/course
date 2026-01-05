# 👨‍💻 Guide de développement

## Installation pour les développeurs

Ce guide explique comment configurer l'environnement de développement pour travailler sur ce projet.

## 📋 Prérequis

Avant de commencer, assurez-vous d'avoir installé :

### 1. **Qt Creator** (Essentiel)
   - **Télécharger** : https://www.qt.io/download-open-source
   - **Version requise** : Qt 6.10.1 ou supérieur
   - **Composants à installer** :
     - Qt 6.10.1 (MinGW 64-bit)
     - Qt Creator
     - CMake (si pas déjà installé)
     - MinGW 64-bit compiler

### 2. **CMake**
   - **Télécharger** : https://cmake.org/download/
   - **Version requise** : 3.20 ou supérieur
   - **Vérifier l'installation** :
     ```bash
     cmake --version
     ```

### 3. **MinGW 64-bit**
   - Généralement installé avec Qt Creator
   - **Sinon télécharger** : https://www.mingw-w64.org/
   - **Vérifier** :
     ```bash
     g++ --version
     ```

### 4. **PostgreSQL** (pour la base de données)
   - **Télécharger** : https://www.postgresql.org/download/windows/
   - **Version requise** : 16 ou supérieur
   - **Vérifier l'installation** :
     ```bash
     psql --version
     ```

### 5. **Git**
   - **Télécharger** : https://git-scm.com/
   - **Vérifier** :
     ```bash
     git --version
     ```

### 6. **Visual Studio Code** (Optionnel)
   - **Télécharger** : https://code.visualstudio.com/
   - **Extensions recommandées** :
     - C/C++ Extension Pack
     - Qt for Python
     - CMake Tools

## 🔧 Configuration de l'environnement

### Étape 1 : Cloner le repository

```bash
git clone https://github.com/[votre-username]/course.git
cd course
```

### Étape 2 : Ouvrir avec Qt Creator

1. Lancez **Qt Creator**
2. Allez à **File → Open File or Project**
3. Sélectionnez le fichier `CMakeLists.txt` du projet
4. Qt Creator détectera automatiquement les kits disponibles
5. Sélectionnez le kit **Desktop Qt 6.10.1 MinGW 64-bit** 
6. Cliquez sur **Configure Project**

### Étape 3 : Configurer la base de données

1. **Démarrer PostgreSQL** :
   ```bash
   # Sur Windows, PostgreSQL démarre automatiquement en tant que service
   # Vérifier le statut :
   pg_isready
   ```

<!-- 2. **Créer la base de données** :
   ```bash
   psql -U postgres
   ```
   Puis dans le prompt PostgreSQL :
   ```sql
   CREATE DATABASE course_db;
   ```

3. **Initialiser le schéma** (si fourni) :
   ```bash
   psql -U postgres -d course_db -f schema.sql
   ``` -->

## 🚀 Lancer l'application

### Option 1 : Via Qt Creator (Recommandé)
1. Ouvrez le projet dans Qt Creator
2. Appuyez sur **Ctrl+R** ou cliquez sur le bouton **Run** (triangle vert)
3. L'application se lancera en mode Debug

### Option 2 : En ligne de commande

```bash
# Créer le répertoire de build
mkdir build
cd build

# Configurer le projet
cmake ..

# Compiler
cmake --build .

# Lancer l'exécutable
./appcourse.exe
```

## 📁 Structure pour développer

```
course/
├── CMakeLists.txt              # Configuration CMake
├── main.cpp                    # Point d'entrée C++
├── Files/
│   ├── Main.qml               # Interface principale
│   └── pages/
│       ├── Login.qml          # Page de connexion
│       ├── Register.qml       # Page d'enregistrement
│       └── ...
├── controllers/               # Logique métier (C++)
├── models/                    # Modèles de données (C++)
├── build/                     # Répertoire de build (généré)
│   └── appcourse.exe          # Exécutable compilé
└── .vscode/                   # Configuration VS Code
```

## 🔨 Workflow de développement

### 1. Créer une branche pour votre fonctionnalité
```bash
git checkout -b feature/ma-fonctionnalité
git checkout -b fix/mon-bug
```

### 2. Développer et tester
- Modifiez les fichiers QML dans `Files/`
- Modifiez la logique C++ dans `controllers/` et `models/`
- Compilez avec **Ctrl+B** dans Qt Creator
- Testez avec **Ctrl+R**

### 3. Pousser vos changements
```bash
git add .
git commit -m "Description claire du changement"
git push -u origin feature/ma-fonctionnalité
```

### 4. Créer une Pull Request
- Allez sur GitHub
- Créez une PR avec une description détaillée
- Attendez la revue de code

## 🐛 Debugging

### Avec Qt Creator
- Appuyez sur **F5** pour lancer le debugger
- Utilisez les breakpoints (clic à gauche du numéro de ligne)
- Inspectez les variables dans le panneau **Locals** et **Watchers**

### Avec VS Code
- Installer l'extension **C/C++ Extension Pack**
- Utiliser **launch.json** (déjà configuré)
- Appuyer sur **F5** pour lancer le debugging

## 📝 Convention de code

### QML
```qml
// Utiliser des noms clairs et descriptifs
Rectangle {
    id: mainContainer
    width: 800
    height: 600
    
    property string userEmail: ""
    
    signal loginSuccess()
    
    function validateForm() {
        // Logique de validation
    }
}
```

### C++
```cpp
// Classe pour un contrôleur
class LoginController {
public:
    LoginController();
    ~LoginController();
    
    bool authenticate(const QString& email, const QString& password);
    
private:
    QString currentUserEmail;
};
```

## 🧪 Tests

Pour ajouter des tests unitaires :
1. Créer un dossier `tests/`
2. Utiliser Qt Test Framework
3. Exécuter : `cmake --build . --target test`

## 📦 Build et Distribution

### Créer un build Release
```bash
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
```

### Créer un installateur
- Utiliser Qt Installer Framework
- Documentation : https://doc.qt.io/qtinstallerframework/

## ⚠️ Problèmes courants

### Erreur : "Qt not found"
- Vérifiez que Qt 6.10.1 est installé
- Dans Qt Creator : **Tools → Options → Kits** et configurez le kit

### Erreur : "cmake not found"
- Assurez-vous que CMake est dans le PATH
- Redémarrez Qt Creator après installation

### Base de données non trouvée
- Vérifiez que PostgreSQL fonctionne
- Vérifiez la chaîne de connexion dans le code

### Problèmes de compilation
```bash
# Nettoyer et reconstruire
rm -rf build
mkdir build
cd build
cmake ..
cmake --build .
```

## 📚 Ressources utiles

- **Qt Documentation** : https://doc.qt.io/
- **CMake Documentation** : https://cmake.org/documentation/
- **QML Guide** : https://doc.qt.io/qt-6/qmlbasics.html
- **PostgreSQL Documentation** : https://www.postgresql.org/docs/

## 🤝 Contribution

1. Fork le projet
2. Créez une branche (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Poussez la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## 📞 Support

Pour des questions sur le setup, ouvrez une issue ou contactez l'équipe de développement.

Bon développement ! 🚀
