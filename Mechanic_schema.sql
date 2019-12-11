USE mechanic;

-- DROP --
DROP TABLE IF EXISTS worked_Hours;
DROP TABLE IF EXISTS used_parts_repair;
DROP TABLE IF EXISTS compatibility;

DROP TABLE IF EXISTS customer_Car;
DROP TABLE IF EXISTS car_model;
DROP TABLE IF EXISTS storage;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS repair;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS car_brand;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS city;

-- CREATE --
-- TABLE REPAIR--
CREATE TABLE repair(
	repair_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	begin_date DATE,
	end_date DATE,
	work_hours INTEGER
);

ALTER TABLE repair ADD CONSTRAINT PK_repair_id PRIMARY KEY (repair_id);

-- TABLE CLIENT CAR--
CREATE TABLE customer_car(
	customer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    owner_id INTEGER NOT NULL
);

-- TABLE REPAIR USED PARTS--
CREATE TABLE used_parts_repair(
    repair_id INTEGER NOT NULL,
    part_id INTEGER NOT NULL,
    used_parts INTEGER NOT NULL
);

-- TABLE COMPATIBILITY--
CREATE TABLE compatibility(
    model_id INTEGER NOT NULL,
    part_id INTEGER NOT NULL,
    PRIMARY KEY(model_id, part_id)
);

-- TABLE WORKED HOURS--
CREATE TABLE worked_Hours(
    repair_id INTEGER NOT NULL,
    employee_id  INTEGER NOT NULL,
    no_hours INTEGER NOT NULL
);

-- TABLE CUSTOMER TABLE--
CREATE TABLE customer(
	customer_id INTEGER NOT NULL,
	name VARCHAR(50),
	address VARCHAR(150),
	phone INTEGER,
	city_id INTEGER
);
ALTER TABLE customer ADD CONSTRAINT PK_customer_id PRIMARY KEY (customer_id);

-- TABLE CAR--
CREATE TABLE car(
    car_id INTEGER NOT NULL,
    brand_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    plate VARCHAR(15)
);

ALTER TABLE car ADD CONSTRAINT PK_car_id PRIMARY KEY (car_id);

-- TABLE STORAGE--
CREATE TABLE storage(
    part_id INTEGER NOT NULL,
    part_name VARCHAR(50),
    stock INTEGER NOT NULL,
    price INTEGER NOT NULL,
    code VARCHAR(50)
);

ALTER TABLE storage ADD CONSTRAINT PK_part_id PRIMARY KEY (part_id);

-- TABLE CAR BRAND--
CREATE TABLE car_brand(
    brand_id INTEGER NOT NULL,
    brand_Name VARCHAR(50)
);

ALTER TABLE car_brand ADD CONSTRAINT PK_brand_id PRIMARY KEY (brand_id);

-- TABLE CAR MODEL--
CREATE TABLE car_model(
	brand_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    model_Name VARCHAR(50)
);

ALTER TABLE car_model ADD CONSTRAINT PK_model_id PRIMARY KEY (model_id);

-- TABLE EMPLOYEE TABLE--
CREATE TABLE employee(
	employee_id INTEGER NOT NULL,
	name VARCHAR(50),
	address VARCHAR(150),
	phone INTEGER,
	job_id INTEGER NOT NULL,
	city_id INTEGER
);

ALTER TABLE employee ADD CONSTRAINT PK_employee_id PRIMARY KEY (employee_id);

-- TABLE JOB--
CREATE TABLE job(
	job_id INTEGER NOT NULL,
	job_name VARCHAR(50),
	cost_hour INTEGER
);

ALTER TABLE job ADD CONSTRAINT PK_job_id PRIMARY KEY (job_id);


-- TABLE CITY --
CREATE TABLE city(
	city_id INTEGER NOT NULL,
	name VARCHAR(50)
);
ALTER TABLE city ADD CONSTRAINT PK_city_id PRIMARY KEY (city_id);


-- FOREIGN KEYS--
ALTER TABLE customer_car ADD CONSTRAINT FK_customer_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE customer_car ADD CONSTRAINT FK_customer_owner_id FOREIGN KEY (owner_id) REFERENCES customer(customer_id);
ALTER TABLE customer_car ADD CONSTRAINT FK_customer_car_id FOREIGN KEY (car_id) REFERENCES car(car_id);

ALTER TABLE car ADD CONSTRAINT FK_car_brand_id FOREIGN KEY (brand_id) REFERENCES car_brand(brand_id);

ALTER TABLE car_model ADD CONSTRAINT FK_model_brand_id FOREIGN KEY (brand_id) REFERENCES car_brand(brand_id);

ALTER TABLE repair ADD CONSTRAINT FK_repair_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE repair ADD CONSTRAINT FK_repair_car_id FOREIGN KEY (car_id) REFERENCES car(car_id);

ALTER TABLE employee ADD CONSTRAINT FK_employee_job_id FOREIGN KEY (job_id) REFERENCES job(job_id);

ALTER TABLE worked_hours ADD CONSTRAINT FK_workHours_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id);
ALTER TABLE worked_hours ADD CONSTRAINT FK_workHours_repair_id FOREIGN KEY (repair_id) REFERENCES repair(repair_id);

ALTER TABLE used_parts_repair ADD CONSTRAINT FK_usedPartsRepair_repair_id FOREIGN KEY (repair_id) REFERENCES repair(repair_id);
ALTER TABLE used_parts_repair ADD CONSTRAINT FK_usedPartsRepair_part_id FOREIGN KEY (part_id) REFERENCES storage(part_id);

ALTER TABLE customer ADD CONSTRAINT FK_customer_city_id FOREIGN KEY (city_id) REFERENCES city(city_id);
ALTER TABLE employee ADD CONSTRAINT FK_employee_city_id FOREIGN KEY (city_id) REFERENCES city(city_id);