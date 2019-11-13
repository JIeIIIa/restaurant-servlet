CREATE SEQUENCE products_id_seq;
CREATE TABLE IF NOT EXISTS products
(
    id    BIGINT      NOT NULL DEFAULT nextval('products_id_seq'),
    title VARCHAR(60) NOT NULL,

    CONSTRAINT products_pk PRIMARY KEY (id)
);
ALTER SEQUENCE products_id_seq
    OWNED BY products.id;
