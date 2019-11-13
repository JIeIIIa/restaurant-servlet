CREATE SEQUENCE cooked_dishes_id_seq;
CREATE TABLE IF NOT EXISTS cooked_dishes
(
    id       BIGINT  NOT NULL,
    id_dish  BIGINT  NOT NULL,
    id_order BIGINT  NOT NULL,
    is_ready BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT cooked_dishes_pk PRIMARY KEY (id),
    CONSTRAINT fk_cooked_dishes_dish
        FOREIGN KEY (id_dish)
            REFERENCES dishes (id),
    CONSTRAINT fk_cooked_dishes_order
        FOREIGN KEY (id_order)
            REFERENCES orders (id)
);
ALTER SEQUENCE cooked_dishes_id_seq
    OWNED BY cooked_dishes.id;
