CREATE SEQUENCE dishes_id_seq;
CREATE TABLE IF NOT EXISTS dishes
(
    id        BIGINT      NOT NULL DEFAULT nextval('dishes_id_seq'),
    title     VARCHAR(60) NOT NULL,
    price     BIGINT      NOT NULL,
    is_active bool        NOT NULL,

    CONSTRAINT dishes_pk PRIMARY KEY (id)
);
ALTER SEQUENCE dishes_id_seq
    OWNED BY dishes.id;
