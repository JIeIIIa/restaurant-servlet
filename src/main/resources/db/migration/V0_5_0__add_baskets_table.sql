CREATE TABLE IF NOT EXISTS baskets
(
    id_user BIGINT NOT NULL,
    id_dish BIGINT NOT NULL,
    amount  BIGINT NOT NULL,

    CONSTRAINT baskets_pk PRIMARY KEY (id_user, id_dish),
    CONSTRAINT fk_ingredient_product
        FOREIGN KEY (id_user)
            REFERENCES users_info (id),
    CONSTRAINT fk_ingredient_dish
        FOREIGN KEY (id_dish)
            REFERENCES dishes (id)
);