CREATE TABLE sales_invoice(
        invoice_id SERIAL PRIMARY KEY,
        invoice_date timestamp,
        car_id INTEGER,
        customer_id INTEGER,
        salesperson_id INTEGER
        );
      
INSERT INTO sales_invoice(
        invoice_date,
        car_id,
        customer_id,
        salesperson_id
        )VALUES(
        '2023-02-24 09:19:42',
        1,
        1,
        1
        ),(
        '2023-05-23 10:15:32',
        2,
        2,
        2
        );    
SELECT *
FROM sales_invoice
       
CREATE TABLE salesperson(
        salesperson_id varchar(45),
        first_name varchar(45),
        last_name varchar(45)
        );
INSERT INTO salesperson (
        salesperson_id,
        first_name,
        last_name
        )VALUES(
        1,
        'luam',
        'gebremikael'
        ),(
        2,
        'cahd',
        'Nguyen'
        );
        
SELECT *
FROM salesperson 
       
DROP TABLE car;
CREATE TABLE car(
        car_id SERIAL PRIMARY KEY,
        serial_number integer,
        make varchar(45),
        model varchar(45),
        color varchar(45),
        YEAR  integer,
        sold_not_sold varchar(45)
        );      
INSERT INTO car( serial_number,make,model,color,"year",sold_not_sold)
VALUES(23,'Toyota','corolla','red',2017,'not sold'),
( 33,'Audi','A3 subcompact sedan','black',
       2022,
        'not sold'
        ),(44,
        'Mercedes',
        'GLA SUV',
        'WHIE',
        2022,
        'sold');
SELECT *
FROM car
DROP TABLE Mechanic;
CREATE TABLE Mechanic(
        Mechanic_id SERIAL PRIMARY KEY,
        first_name varchar(45),
        last_name varchar(45)  
        );
INSERT INTO mechanic(
        first_name,
        last_name
        )VALUES(
        'Abel',
        'Kiflu'),(
        'elias',
        'Kidane');
SELECT *
FROM mechanic
DROP TABLE customer;     
CREATE TABLE customer(
        customer_id SERIAL PRIMARY KEY,
        first_name varchar(45),
        last_name varchar(45),
        phone_number varchar(45),
        address varchar(45),
        email varchar(45)
        );
INSERT INTO customer(
        first_name,
        last_name,
        phone_number,
        address,
        email
         )VALUES(
        'betty',
        'mehari',
        '614-789-835',
        '3424 main st columbus OH',
        'bettymehari1212@gmail.com'
        ),(
        'chad',
        'Neguen',
        '154-789-835',
        '5191 broad st columbus OH',
        'chadneguen1212@gmail.com'
        ),(
        'Arsema',
        'Aragie',
        '614-624-835',
        '1675 dublin columbus OH',
        'arsemaaragie1343@gmail.com'
        ),(
        'Simon',
        'Abraham',
        '184-886-647',
        '1694 downtown columbus OH',
        'simonabraham1343@gmail.com'
         );
       
SELECT *
FROM customer 

CREATE TABLE service_ticket(
         service_ticket_id SERIAL PRIMARY KEY,
         card_id integer,
         customer_id integer,
         data_serviced varchar(45),
         COMMENTS TEXT,
         data_returned varchar(45),
         service_id INTEGER
         );
INSERT INTO service_ticket(
         card_id,
         customer_id,
         data_serviced,
         "comments"
         data_returned,
         service_id
         )VALUES(
         12,
         2,
         
          )
DROP TABLE service;
CREATE TABLE service(
          service_id SERIAL PRIMARY KEY,
          service_Name varchar(45),
          COST float(45),
          mechanic_id integer
          );
INSERT INTO service(
           service_name,
           COST,
           mechanic_id
           )VALUES(
           'Quality Auto service',
           52,
           2
           );
           

SELECT *
FROM service
        
CREATE OR REPLACE FUNCTION insertcar(
	_serial_number integer,
	_make varchar(255),
	_model varchar(255),
	_color varchar(255),
	_year integer,
	_sold_not_sold varchar(45)
	) 
RETURNS VOID AS 

$$
BEGIN
    INSERT INTO insertcar(
   		serial_number, make, model, color, "year",sold_not_sold) 
   	VALUES (
   		_serial_number, _make, _model, _color, _year,_sold_not_sold);
END
$$
LANGUAGE 'plpgsql';





CREATE OR REPLACE PROCEDURE insertCustomer(
    first_name VARCHAR(45),
	last_name VARCHAR(45),
	phone_number VARCHAR(45),
	address VARCHAR(255),
	email varchar(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO customer(
        first_name,
        last_name,
        phone_number,
        address,
        email
    ) VALUES (
        first_name,
        last_name,
        phone_number,
        address,
        email
    );
    COMMIT;
END;
$$

SELECT insertCustomer()
