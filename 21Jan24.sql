create database retail;
create table orders(
	orderNumber numeric(10),
    orderDate date,
    requiredDate date,
    shippedDate date,
    orderStatus text(10),
    comments text(20),
    customerNumber numeric(10),
    primary key (orderNumber)
    );
    
    insert into orders values(121212, '2021-10-10', '2021-11-10', '2021-10-15', 'Shipped', 'None', 1111);
    insert into orders values(101010, '2021-11-10', '2021-10-15', '2021-10-15', 'Shipped', 'None', 1111);
    
    SELECT * FROM ORDERS;
    
    CREATE TABLE orderdetails(
		orderNumber numeric(10),
        productCode numeric(10),
        quantityOrdered numeric(4),
        priceEach float(6,2),
        orderLineNumber numeric(5),
        primary key (orderLineNumber)
	);


insert into orderdetails values(121212, 1234, 100, 200, 5555);
insert into orderdetails values(101010, 5678, 100, 200, 6666);

select * from orderdetails;

create table products(
	productCode numeric(10),
    productName text(20),
    productSuppId varchar(20),
    primary key (productCode)
);

insert into products values(5676, 'Shampoo', 'D400');
insert into products values(1234, 'detergent', 'D400');
SELECT * FROM PRODUCTS;

select concat(productCode, '-',productName) as productdetails from products;

select orders.orderNumber, orders.customerNumber, orderdetails.priceEach 
from orders 
inner join orderdetails on orders.orderNumber=orderdetails.orderNumber;

select orders.orderNumber, orders.customerNumber, products.productCode, products.productName, orders.orderStatus, orderDetails.priceEach
from orders
inner join orderDetails on orders.orderNumber=orderdetails.orderNumber
inner join products on orderDetails.productCode=products.productCode;

select orders.orderNumber, orders.customerNumber, products.productCode, products.productName, orders.orderStatus, sum(quantityOrdered * priceEach)  total
from orders
inner join orderdetails on orders.orderNumber=orderdetails.orderNumber
inner join products on orderdetails.productCode = products.productCode
group by orderNumber;

/*select orders.orderNumber, orders.customerNumber, products.productCode */

select sum(quantityOrdered)
from orderdetails
where orderNumber=101010;

select avg(quantityOrdered)
from orderdetails
where orderNumber=101010;



    
    
    
    