# 🧪 Stratégie de tests pour `ms-auth`

---

## ✅ Étape 1 : Compléter tous les tests unitaires

### 🎯 Objectif :
S'assurer que chaque classe de service fonctionne correctement de manière isolée (sans dépendance externe réelle).

### 💡 Pourquoi commencer par là ?
- C’est rapide à exécuter (quelques millisecondes par test).
- Ça permet de corriger des erreurs de logique **avant d’intégrer**.
- Tu identifies les bugs plus précisément car les tests sont ciblés.

### 🛠️ Méthode :
- Crée un dossier `src/test/java/.../service/` si ce n’est pas déjà fait.
- Pour chaque classe de service listée dans le tableau précédent :
    - Crée sa classe de test unitaire.
    - Mocke les dépendances avec Mockito (`@Mock`, `@InjectMocks`).
    - Couvre tous les cas :
        - Succès ✅
        - Exceptions attendues ⚠️
        - Cas limites 🔍
- Utilise **JaCoCo** pour visualiser la couverture et compléter ce qui manque.

---

## 🚀 Étape 2 : Ajouter des tests d’intégration ciblés

### 🎯 Objectif :
Valider l’interconnexion des couches (contrôleurs, sécurité, service, repository, configuration Spring).

### 💡 Pourquoi ensuite ?
- Tu testes sur une **mini application**, avec Spring Boot démarré.
- Tu assures que :
    - La sécurité fonctionne (auth, rôles, JWT).
    - La sérialisation (JSON ↔ DTO) est correcte.
    - Les requêtes HTTP renvoient ce qu’elles doivent.
- Tu peux les écrire **plus sereinement**, une fois les services validés unitairement.

### 🛠️ Méthode :
- Crée un dossier `src/test/java/.../integration/` (ou suffixe `*IT.java`).
- Utilise `@SpringBootTest` avec `@AutoConfigureMockMvc` ou `TestRestTemplate`.
- Injecte des données fictives si besoin avec `@Sql` ou une base H2 en mémoire.
- Concentre-toi sur :
    - `AuthController`
    - `PasswordResetController`
    - Les appels REST avec vérification des codes (`200`, `401`, `403`, etc.)

---

## 🧪 Étape 3 *(optionnelle mais recommandée)* : Intégration avec Docker/TestContainers

### 🎯 Objectif :
Simuler un environnement réel (ex: **MySQL**, **Eureka**, **ConfigServer**) pour des tests robustes et représentatifs.

### 🛠️ Méthode :
- Utilise `@Testcontainers` avec des images comme :
    - `mysql:8`
    - `mockserver`
- Monte un fichier `docker-compose.test.yml` si besoin.
- Intègre ces tests dans un job CI (GitHub Actions, GitLab CI) pour les lancer automatiquement.

---

## 🔁 Et ensuite ?

- ⚙️ **Automatiser l’exécution** avec GitHub Actions ou GitLab CI/CD.
- 📊 **Surveiller la couverture** avec JaCoCo.
- 🗂️ **Documenter ta stratégie** dans un fichier `TESTING.md`.

---
