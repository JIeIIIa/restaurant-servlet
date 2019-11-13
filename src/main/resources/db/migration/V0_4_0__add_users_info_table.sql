CREATE TYPE user_role_enum AS ENUM ('CLIENT', 'ADMIN', 'CHIEF');

CREATE SEQUENCE users_info_id_seq;
CREATE TABLE IF NOT EXISTS users_info
(
    id            BIGINT         NOT NULL DEFAULT nextval('users_info_id_seq'),
    login_user    VARCHAR(40)    NOT NULL,
    password_user VARCHAR(50)    NOT NULL,
    salt          VARCHAR(20)    NOT NULL,
    role          user_role_enum NOT NULL,

    CONSTRAINT users_info_pk PRIMARY KEY (id)
);
ALTER SEQUENCE users_info_id_seq
    OWNED BY users_info.id;