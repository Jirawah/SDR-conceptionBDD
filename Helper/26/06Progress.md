## ✅ État des lieux du microservice `ms-auth` de SneakyDateReforged

Ce document récapitule :

- ✅ Ce qui a déjà été réalisé
- 🔜 Ce qu’il reste à implémenter
- 📦 Les blocs techniques à venir

---

### ✅ Ce qui a déjà été fait

#### 📁 Initialisation du projet
- Projet `ms-auth` généré via Spring Initializr
- Utilisation de **Spring Boot 3.5.3**, **Java 17**, **Maven**

#### ⚙️ Configuration technique
- `pom.xml` complet avec les dépendances :
  * Spring Web, Security, Data JPA, Validation
  * JWT (`jjwt`), Config Client, Eureka Client
  * Lombok, MySQL
  * Feign (prévu pour plus tard)
- Clé Spring Cloud définie : `${spring-cloud.version}`

#### 📦 Données & modèle
- Création de l'entité `UserAuthModel.java` avec les champs :
  * pseudo, email, steamId, password
  * discordId, username, nickname, avatar
  * validated, steamValidated, timestamps

#### 🔄 DTOs créés
- `RegisterRequest`
- `LoginRequest`
- `DiscordSyncRequest`
- `AuthResponse`

#### 📚 Repository
- `UserAuthRepository` avec les méthodes :
  * `findByEmail`
  * `existsByPseudo`
  * autres méthodes de recherche

---

### 🔜 Ce qu’il reste à faire

#### 🔐 Authentification
- Implémenter `AuthService` avec :
  * `register(RegisterRequest)`
  * `login(LoginRequest)`
  * `syncDiscord(DiscordSyncRequest)`

#### 🎮 Steam
- Créer un `SteamCheckerService` (externe ou intégré) pour :
  * Vérifier via l’API Steam si le Steam ID n’a jamais été banni
  * Marquer `steamValidated = true` si OK

#### 🗣️ Discord
- Exposer un endpoint : `POST /auth/discord-sync` :
  * Appelé par le bot Discord lorsqu’un utilisateur rejoint le vocal
  * Met à jour un utilisateur existant (via Discord ID ou pseudo/email)
  * Renseigne les données Discord

#### 🔐 Sécurité JWT
- Implémenter :
  * `JwtUtils.java` : génération + validation des tokens
  * `JwtAuthFilter.java` : filtre de sécurité
  * `SecurityConfig.java` : configuration Spring Security avec endpoints whitelistés

#### 🌐 Contrôleur
- Créer `AuthController.java` avec les routes :
  * `POST /auth/register`
  * `POST /auth/login`
  * `POST /auth/discord-sync`

#### 🧪 Tests & validation
- Activer `@Valid` dans les endpoints
- Implémenter des messages d’erreurs clairs
- Tester via Postman + plus tard dans l’interface Angular

---

### 📦 Bonus (non bloquant pour le MVP)

- Centraliser la clé secrète JWT dans `application.properties`
- Gérer les cas d’erreur explicites :
  * Email déjà utilisé
  * Steam ID invalide
- Logger les étapes d’inscription pour audit/tracabilité
