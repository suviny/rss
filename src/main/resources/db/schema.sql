-- 사용자 테이블
DROP TABLE IF EXISTS USERS CASCADE;

CREATE TABLE IF NOT EXISTS USERS (
    id                  INT                 NOT NULL    AUTO_INCREMENT,
    email               VARCHAR(45)         NOT NULL    UNIQUE,
    name                VARCHAR(15)         NOT NULL,
    enabled             TINYINT(1)          NOT NULL    DEFAULT 1,
    auth_type           VARCHAR(5)          NOT NULL,
    deleted_yn          CHAR(1)             NOT NULL    DEFAULT 'N',
    created_at          DATETIME            NOT NULL    DEFAULT NOW(),
    updated_at          DATETIME            NOT NULL,
    deleted_at          DATETIME            NULL,
    PRIMARY KEY (id)
);


-- 로컬 인증 정보 테이블
DROP TABLE IF EXISTS USER_AUTH_LOCAL CASCADE;

CREATE TABLE IF NOT EXISTS USER_AUTH_LOCAL (
    user_id             INT                 NOT NULL,
    password            VARCHAR(255)        NOT NULL,
    updated_at          DATETIME            NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES USERS (id)
);


-- 소셜 인증 정보 테이블
DROP TABLE IF EXISTS USER_AUTH_SOCIALS CASCADE;

CREATE TABLE IF NOT EXISTS USER_AUTH_SOCIALS (
    id                  INT                 NOT NULL    AUTO_INCREMENT,
    user_id             INT                 NOT NULL,
    provider            VARCHAR(50)         NOT NULL,
    provider_id         VARCHAR(255)        NOT NULL,
    created_at          DATETIME            NOT NULL    DEFAULT NOW(),
    PRIMARY KEY (id),
    UNIQUE KEY (user_id, provider),
    FOREIGN KEY (user_id) REFERENCES USERS (id)
);


-- 사용자별 보유 권한 정보 테이블
DROP TABLE IF EXISTS USER_ROLES CASCADE;

CREATE TABLE IF NOT EXISTS USER_ROLES (
    user_id             INT                 NOT NULL,
    role                VARCHAR(20)         NOT NULL,
    PRIMARY KEY (user_id, role),
    FOREIGN KEY (user_id) REFERENCES USERS (id)
);

