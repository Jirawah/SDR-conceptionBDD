# Modifications du diagramme de classes du ms-auth

## Classes ajoutées
- `DiscordBot` : classe de gestion du bot Discord via JDA.
- `VoiceChannelListener` : écoute les entrées dans les salons vocaux Discord.
- `DiscordController` : expose un endpoint REST `/api/auth/discord/sync`.
- `DiscordSyncService` : service de liaison entre DTO Discord et la BDD.
- `UserAuthService` : service responsable de la mise à jour du profil utilisateur via Discord.
- `DiscordSyncRequestDTO` : structure les données reçues du bot Discord.

## Attributs ajoutés à `UserAuthModel`
- `discordId`
- `discordUsername`
- `discordDiscriminator`
- `discordNickname`
- `discordAvatarUrl`
- `discordValidated`

## Refactorisation
- La méthode `syncDiscord` initialement dans `AuthService` a été partiellement déléguée à `UserAuthService` pour séparation des responsabilités.
