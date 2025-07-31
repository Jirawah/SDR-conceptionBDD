# Modifications des cas d'utilisation du ms-auth

## Ajouts ou ajustements
- Intégration de la validation Discord à l’inscription (non prévue initialement dans les use cases).
- Appel à une API externe Steam pour valider le SteamID (déjà prévu, mais renforcé avec vérification de bannissement).
- Création automatique du profil Steam via l’API Web Steam dès l’inscription.

## Supprimés ou non implémentés
- Aucun cas d’utilisation supprimé pour le moment.

## Ajustements mineurs
- La vérification du compte Discord via un bot Discord n'était pas prévue, elle est désormais intégrée via `VoiceChannelListener`.
