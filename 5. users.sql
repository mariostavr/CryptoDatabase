#----------ROLES----------#
# Create Role 'Admin' that has all the privileges but only from the server of the DB (localhost)
DROP ROLE IF EXISTS 'admin';
flush privileges;
CREATE ROLE 'admin';
GRANT ALL PRIVILEGES ON cryptodb.* TO 'admin';

# Create Role 'Employee' that can perform select, insert, update and delete but only from the server of the DB (localhost)
DROP ROLE IF EXISTS 'employee';
flush privileges;
CREATE ROLE 'employee';
GRANT SELECT, INSERT, UPDATE, DELETE ON cryptodb.* TO 'employee';

# Create Role 'Guestuser' that can perform select queries in the DB
DROP ROLE IF EXISTS 'guestuser';
flush privileges;
CREATE ROLE 'guestuser';
GRANT SELECT ON cryptodb.* TO 'guestuser';

# Create Role 'User' that can perform select, delete, insert and update in the DB
DROP ROLE IF EXISTS 'user';
flush privileges;
CREATE ROLE 'user';
GRANT SELECT ON cryptodb.* TO 'user';
GRANT SELECT ON cryptodb.* TO 'user';
GRANT INSERT, DELETE ON cryptodb.favorites TO 'user';
GRANT INSERT, DELETE ON cryptodb.favorites TO 'user';
GRANT INSERT, DELETE, UPDATE ON cryptodb.user_rate_tradingpage TO 'user';
GRANT INSERT, DELETE, UPDATE ON cryptodb.user_rate_tradingpage  TO 'user';
GRANT INSERT, DELETE, UPDATE ON cryptodb.user_rate_wallet TO 'user';
GRANT INSERT, DELETE, UPDATE ON cryptodb.user_rate_wallet TO 'user';


#---------USERS---------#
# Create user admin that has all the privileges but only from the server of the DB (localhost)
DROP USER IF exists 'admin1'@'localhost';
CREATE USER 'admin1'@'localhost' IDENTIFIED BY 'adminpassword';
GRANT 'admin' TO 'admin1'@'localhost';

# Create user employee that can perform select, insert, update and delete but only from the server of the DB (localhost)
DROP USER IF exists 'employee1'@'localhost';
CREATE USER 'employee1'@'localhost' IDENTIFIED BY 'employeepassword';
GRANT 'employee' TO 'employee1'@'localhost';

# Create user guestuser that can perform select queries in the DB
DROP USER IF exists 'guestuser1'@'localhost';
DROP USER IF exists 'guestuser1'@'%';
CREATE USER 'guestuser1'@'localhost' IDENTIFIED BY 'guest';
CREATE USER 'guestuser1'@'%' IDENTIFIED BY 'guest';
GRANT 'guestuser' TO 'guestuser1'@'localhost';
GRANT 'guestuser' TO 'guestuser1'@'%';


# Create user accountuser that can perform select, insert in the DB
DROP USER IF exists 'user1'@'localhost';
DROP USER IF exists 'user1'@'%';
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'user1'@'%' IDENTIFIED BY 'password';
GRANT 'user' TO 'user1'@'localhost';
GRANT 'user' TO 'user1'@'%';
