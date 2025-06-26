===========================
🔐 Données à collecter à l’inscription
===========================

🧾 Saisies manuelles par l’utilisateur :
- pseudo (recommandé : identique à celui de Discord)
- email
- steamId
- motDePasse + confirmationMotDePasse

🤖 Données techniques récupérées automatiquement :

Via ton bot Discord personnalisé :
- discordId (ID utilisateur)
- discordUsername (nom d'utilisateur global)
- discordDiscriminator (suffixe #1234 — bien que Discord tende à l’abandonner)
- discordNickname (pseudo sur le serveur)
- discordAvatar (URL de l’avatar)

Via l'API Web Steam :
- Résultat d’une vérification anti-triche (ban VAC ou non)

===========================
✅ Fonctionnement du bouton "CONNEXION DISCORD"
===========================

1. L’utilisateur clique sur le bouton CONNEXION DISCORD dans le frontend.
2. Cela l’invite à rejoindre un salon vocal Discord sur un serveur dédié.
3. Ton bot Java Discord (hors OAuth2) est déjà en attente dans ce salon.
4. Lorsque le bot détecte une nouvelle connexion vocale, il :
   - récupère les données id, username, etc.
   - les envoie via un appel HTTP POST/PUT à ton backend ms-auth
5. Le backend reçoit les données, les lie à la session utilisateur, et :
   - enregistre les données dans la BDD temporairement (ou dans un cache si non finalisé)
   - informe le frontend que la connexion Discord est validée
6. Le frontend peut alors valider la checkbox "CONNEXION DISCORD"

===========================
✅ Conditions pour activer le bouton "INSCRIPTION"
===========================

Le bouton "INSCRIPTION" n’est activable que si :
- Le pseudo, email, steamId, mot de passe et confirmation sont bien remplis.
- L’API Steam a confirmé que le compte n’a jamais été banni pour triche.
- La connexion Discord est validée (via le bot → backend → checkbox cochée).

===========================
✅ Backend ms-auth devra donc gérer :
===========================

- Une route POST /auth/discord-sync ou /auth/discord/callback pour recevoir les infos du bot
- Un système pour associer temporairement la session utilisateur du frontend à l’ID Discord reçu
- Une validation côté backend avant inscription complète

===========================
✅ Conclusion : OUI, c’est bien compris à 100 %
===========================

Ton idée est :
- claire
- techniquement cohérente
- innovante dans la manière de synchroniser un compte Discord vocal sans passer par OAuth2
