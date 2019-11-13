ALTER TABLE users_info
    ALTER COLUMN password_user TYPE VARCHAR(70),
    ALTER COLUMN password_user SET NOT NULL;