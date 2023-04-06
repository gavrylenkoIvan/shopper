CREATE TABLE companies (
                           id serial PRIMARY KEY,
                           name varchar(64) NOT NULL UNIQUE,
                           description varchar(255),
                           logo varchar(512),
                           isVerified boolean NOT NULL default false
);

CREATE TABLE users (
                       id serial PRIMARY KEY,
                       username varchar(64) NOT NULL,
                       email varchar(128) NOT NULL UNIQUE,
                       password varchar(256) NOT NULL,
                       balance float NOT NULL default 0.0,
                       isTempBlocked boolean NOT NULL default false,
                       company_id int references companies (id) default null
);

CREATE TABLE notifications (
                               id serial PRIMARY KEY,
                               title varchar(64) NOT NULL UNIQUE,
                               createdAt date NOT NULL UNIQUE,
                               text varchar(512) NOT NULL,
                               user_id int not null references users (id)
);

CREATE TABLE discounts (
                           id serial PRIMARY KEY,
                           percent int NOT NULL,
                           relevant date NOT NULL
);

CREATE TABLE items (
                       id serial PRIMARY KEY,
                       name varchar(128) NOT NULL UNIQUE,
                       description varchar(512),
                       price float NOT NULL,
                       rating float NOT NULL,
                       amount int NOT NULL,
                       keywords varchar(1024),
                       company_id int not null references companies (id),
                       isVerified boolean NOT NULL default false
);

CREATE TABLE discounts_items (
                                 id serial PRIMARY KEY,
                                 item_id int references items (id),
                                 discount_id int references discounts (id)
);

CREATE TABLE items_ratings (
                               id serial PRIMARY KEY,
                               item_id int references items (id),
                               rate int NOT NULL
);

CREATE TABLE items_history (
                               id serial PRIMARY KEY,
                               user_id int references users (id),
                               item_id int references items (id)
);

CREATE TABLE comments (
                          id serial PRIMARY KEY,
                          text varchar(512) NOT NULL,
                          item_id int references items (id)
);

CREATE TABLE properties (
    id serial PRIMARY KEY,
    name varchar(64) NOT NULL,
    value varchar(256) NOT NULL,
    item_id int references items (id)
);

INSERT INTO users (username, email, password) values ('admin', 'admin', '6d6e31326e63383947484a4b626d31696b384754444b313464d033e22ae348aeb5660fc2140aec35850c4da997')