CREATE TABLE IF NOT EXISTS ingredients
(
    id_product BIGINT NOT NULL,
    id_dish    BIGINT NOT NULL,
    weight     BIGINT NOT NULL,

    CONSTRAINT ingredients_pk PRIMARY KEY (id_product, id_dish),
    CONSTRAINT fk_ingredient_product
        FOREIGN KEY (id_product)
            REFERENCES products (id),
    CONSTRAINT fk_ingredient_dish
        FOREIGN KEY (id_dish)
            REFERENCES dishes (id)
);