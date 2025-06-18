-- TABLE FRIEND
CREATE TABLE friend (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    ami_id BIGINT NOT NULL,
    statut VARCHAR(50) NOT NULL -- PENDING, ACCEPTED, BLOCKED
);

-- TABLE FRIENDLIST
CREATE TABLE friend_list (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    user_id BIGINT NOT NULL
);

-- TABLE FRIENDLISTMEMBER
CREATE TABLE friend_list_member (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    friend_list_id BIGINT NOT NULL,
    ami_id BIGINT NOT NULL,
    FOREIGN KEY (friend_list_id) REFERENCES friend_list(id) ON DELETE CASCADE
    -- Optionnel : contrainte UNIQUE(friend_list_id, ami_id) à ajouter si nécessaire
);
