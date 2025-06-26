## 🧱 Découpage proposé en microservices

### 1. `auth-service` (Authentification & Discord / Steam)

Responsable de :
    - Inscription, connexion, réinitialisation MDP
    - Connexion Discord (UC3)
    - Validation Steam (UC4)
    - Gestion des tokens JWT, sécurisation des endpoints

Entités persistées :
    - User (email, pseudo, mot de passe hashé, SteamID, DiscordID, etc.)
    - ResetToken (UUID, expiration)

DTO :
    - RegisterRequest
    - LoginRequest
    - DiscordDataDTO
    - SteamValidationDTO

---

### 2. `rdv-service` (Gestion des rendez-vous)

Responsable de :
    - Création, modification, suppression de RDV (UC7, UC8, UC9, UC10)
    - Détail des RDV + planning par jour (UC13, UC27, UC28)
    - Demande de participation (UC24)

Entités persistées :
    - Rdv (nom, date, heure, jeu, statut, slots, organisateurId)
    - Participant (userId, rdvId, rôle, statutParticipation)

DTO :
    - RdvDTO
    - CreateRdvRequest
    - RdvSummaryDTO

---

### 3. `invitation-service` (Invitations aux RDV)

Responsable de :
    - Invitations d’amis à des RDV (UC21)
    - Accepter / refuser une invitation (UC22, UC23)
    - Annuler participation (UC24)

Entités persistées :
    - Invitation (rdvId, invitéId, statut : PENDING, ACCEPTED, REFUSED)

DTO :
    - InvitationRequestDTO
    - InvitationResponseDTO

---

### 4. `friend-service` (Amis & listes d’amis)

Responsable de :
    - Ajout / suppression d’amis (UC15, UC20, UC26)
    - Création et gestion de listes d’amis (UC16, UC17, UC19)

Entités persistées :
    - Friend (userId, amiId)
    - FriendList (nom, userId)
    - FriendListMember (friendListId, amiId)

DTO :
    - FriendDTO
    - FriendListDTO

---

### 5. `profile-service` (Profils publics / statistiques)

Responsable de :
    - Voir son propre profil (UC6)
    - Voir le profil d’un joueur (UC18)
    - Voir le profil d’un ami

Entités persistées :
    - (Pas forcément besoin de base – appels agrégés aux autres services)

DTO :
    - ProfileDTO (pseudo, avatars, stats jeux, stats RDV, etc.)

---

### 6. `notification-service` (Notifications)

Responsable de :
    - Notifications RDV, amis, réponses, invitations (UC16)

Entités persistées :
    - Notification (type, message, userId, date, lue)

DTO :
    - NotificationDTO

---

## 🎯 Architecture front → back

| Frontend Angular                | Microservice ciblé         | Nom ms
|---------------------------------|----------------------------|
| Formulaire inscription/connexion| `auth-service`             | ms-auth
| Planning / Création / Détail RDV| `rdv-service`              | ms-rdv
| Invitations / réponses          | `invitation-service`       | ms-invitation
| Gestion amis / listes           | `friend-service`           | ms-friend
| Profils / recherche joueurs     | `profile-service`          | ms-profil
| Liste de notifications          | `notification-service`     | ms-notif
