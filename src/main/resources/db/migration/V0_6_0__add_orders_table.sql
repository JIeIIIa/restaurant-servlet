CREATE TYPE order_status_enum AS ENUM ('COOKING', 'WAIT_PAYMENT', 'PAID');

CREATE SEQUENCE orders_id_seq;
CREATE TABLE IF NOT EXISTS orders
(
    id             BIGINT            NOT NULL DEFAULT nextval('orders_id_seq'),
    id_user        BIGINT            NOT NULL,
    order_date     TIMESTAMP         NOT NULL,
    amount_payable BIGINT,
    paid           BIGINT,
    paid_date      TIMESTAMP,
    status         order_status_enum NOT NULL,

    CONSTRAINT orders_pk PRIMARY KEY (id),
    CONSTRAINT fk_order_user
        FOREIGN KEY (id_user)
            REFERENCES users_info (id)

);
ALTER SEQUENCE orders_id_seq
    OWNED BY orders.id;

CREATE CAST (CHARACTER VARYING as order_status_enum) WITH INOUT AS IMPLICIT;