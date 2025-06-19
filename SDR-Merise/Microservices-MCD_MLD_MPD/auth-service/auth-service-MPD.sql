-- TABLE UTILISATEUR
CREATE TABLE sdr_user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    discord_id VARCHAR(100),
    steam_id VARCHAR(100),
    created_at DATETIME NOT NULL,
    roles TEXT
);

-- TABLE RESETTOKEN
CREATE TABLE reset_token (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    token CHAR(36) NOT NULL,
    expiration_date DATETIME NOT NULL,
    utilisateur_id BIGINT NOT NULL,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id) ON DELETE CASCADE
);
