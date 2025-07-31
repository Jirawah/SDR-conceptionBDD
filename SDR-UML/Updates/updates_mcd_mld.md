# Modifications du MCD / MLD / MPD du ms-auth

## Attributs ajoutés à l'entité `USER_AUTH_MODEL`
- `discord_id` (VARCHAR, unique)
- `discord_username` (VARCHAR)
- `discord_discriminator` (VARCHAR)
- `discord_nickname` (VARCHAR)
- `discord_avatar_url` (VARCHAR)
- `discord_validated` (BOOLEAN)

## Ajustements structurels
- Aucun changement de relation ou nouvelle entité introduite.

## Compléments techniques
- Ajout d’une procédure stockée `sp_register_user` pour gérer les doublons et l’insertion propre côté BDD.

