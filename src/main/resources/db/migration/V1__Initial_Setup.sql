CREATE TABLE account (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(60) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE employee (
	id INT PRIMARY KEY AUTO_INCREMENT,
	job_number VARCHAR(30) UNIQUE NOT NULL,
	name VARCHAR(30) NOT NULL,
	gender VARCHAR(30),
	age INT,
	marital_status VARCHAR(30),
	hire_year INT NOT NULL,
	hire_month INT NOT NULL,
	hire_day INT NOT NULL,
	email VARCHAR(60),
	phone VARCHAR(30),
	birth_date DATE,
	created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now(),
    account_id INT NOT NULL
);

INSERT INTO account (id, name, password) VALUES (1, 'root', 'root');

INSERT INTO employee (job_number, name, hire_year, hire_month, hire_day, account_id) VALUES ('root', 'root', 2022, 1, 1, 1);