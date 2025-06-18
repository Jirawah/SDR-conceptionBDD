-- VUE VIRTUELLE : profil_vue
-- Agrège les données des services auth, rdv et friend

-- Cette vue n’est PAS matérialisée, elle est calculée dynamiquement côté backend.

-- Structure indicative pour documentation :
-- (non exécutable telle quelle sans jointures, utilisée à but de structuration)

-- profil_vue (
--     user_id BIGINT,
--     pseudo VARCHAR,
--     avatar_url VARCHAR,
--     steam_id VARCHAR,
--     discord_id VARCHAR,
--     nombre_amis INT,
--     nombre_rdvs INT,
--     prochain_rdv DATETIME,
--     stats_total INT,
--     stats_confirmes INT,
--     stats_annules INT,
--     stats_participations INT
-- );
