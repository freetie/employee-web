CREATE TABLE account (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(60) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now(),
);

CREATE TABLE employee (
	id INT PRIMARY KEY AUTO_INCREMENT,
	job_number INT UNIQUE NOT NULL,
	name VARCHAR(30) NOT NULL,
	gender VARCHAR(30),
	marital_status VARCHAR(30),
	hire_year INT NOT NULL,
	hire_month INT NOT NULL,
	hire_day INT NOT NULL,
	email VARCHAR(60),
	phone VARCHAR(30),
	birth_date TIMESTAMP,
	created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now(),
    account_id INT NOT NULL,
);