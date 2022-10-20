CREATE DATABASE IF NOT EXISTS i20Store;

USE i20Store;

CREATE TABLE Section
(
	id_section INT AUTO_INCREMENT,
    title VARCHAR(30),
    description_section TEXT,
    PRIMARY KEY(id_section)
);

CREATE TABLE Product_section
(
	id_section INT,
    id_product INT
);

CREATE TABLE Full_product
(
	id_product INT AUTO_INCREMENT,
    title VARCHAR(30),
    price DECIMAL(7,2),
    price_without_discont DECIMAL(7,2),
    price_with_promo DECIMAL(7,2),
    description_product TEXT,
    main_section INT,
    is_active BOOL,
    PRIMARY KEY(id_product)
);

CREATE TABLE Product_other_img
(
	id_product INT,
    id_img INT
);


CREATE TABLE Product_main_img
(
	id_product INT,
    id_img INT
);


CREATE TABLE Img
(
	id_img INT AUTO_INCREMENT,
    img TEXT,
    alt TEXT,
    PRIMARY KEY(id_img)
);