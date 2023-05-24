/*
1.
Создайте таблицу с мобильными телефонами, используя графический интерфейс.
Id, ProductName, Manufacturer, ProductCount, Price
*/
CREATE TABLE `seminar_1`.`products` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(30) NOT NULL,
  `Manufacturer` VARCHAR(20) NOT NULL,
  `ProductCount` INT NULL DEFAULT 0,
  `Price` DECIMAL NULL,
  PRIMARY KEY (`Id`));

CREATE TABLE Products
(
Id INT AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(20) NOT NULL,
ProductCount INT DEFAULT 0,
Price DECIMAL
);


/*
Заполните БД данными.
*/
INSERT INTO `seminar_1`.`products` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone X', 'Apple', '3', '76000');
INSERT INTO `seminar_1`.`products` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone 8', 'Apple', '2', '51000');
INSERT INTO `seminar_1`.`products` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `seminar_1`.`products` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S8', 'Samsung', '1', '41000');
INSERT INTO `seminar_1`.`products` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('P20 Pro', 'Huawei', '5', '36000');
