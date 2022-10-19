USE i20Store;

INSERT INTO Section (title, description_section)
VALUES
('Блузки и рубашки','Все виды рубашек которые пожелает ваша душа'),
('Брюки','Все виды брюк которые пожелает ваша душа'),
('Верхняя одежда','Все виды верхней одежды которые пожелает ваша душа'),
('Обувь','Все виды обуви которые пожелает ваша душа');

INSERT INTO ProductSection(id_section, id_product)
VALUES
(1, 1),(1, 2),(1, 3),
(1, 4),(1, 5),(1, 6),
(1, 7),(1, 8),(1, 9),
(1, 10),(1, 11),(1, 12),
(1, 13),(1, 14),(2, 15),
(2, 16),(3, 17),(3, 18),
(3,19);

INSERT INTO FullProduct (title, price, price_without_discont, price_with_promo, description_product)
VALUES
('Рубашка Medicine', 2499, 2699, 2227, 'Рубашка Medicine выполнена из вискозной ткани с клетчатым узором.'),
('Блузка Zarina', 1439, 1799, 1222, 'Блузка Zarina выполнена из хлопка и полиэстра. Узор - однотонный.'),
('Рубашка In StyIe', 1600, 3543, 1235, 'Рубашки повседневная из микро вельвет это тренд этого сезона.'),
('Атласная блузка', 2340, 3500, 2150, 'Состав: 96% полиэстер, 4% эластан. Страна-производитель: КИТАЙ'),
('Рубашка из экокожи', 2500, 4325, 2340, 'Состав: 100% полиуретан, 100% полиэстер. Страна-производитель: КИТАЙ'),
('Блузка из вискозы', 1956, 2345, 1756, 'Состав: 53% вискоза, 47% полиэстер. Страна-производитель: КИТАЙ'),
('Блузка с карманами на груди', 2000, 2456, 1890, 'Состав: 55% хлопок, 45% полиэстер. Страна-производитель: ВЬЕТНАМ'),
('Боди с длинным рукавом', 1800, 2456, 1600, 'Состав: 95% полиэстер, 5% эластан. Страна-производитель: КИТАЙ'),
('Блузка из вискозы', 1800, 2356, 1600,'Состав: 100% вискоза. Страна-производитель: ВЬЕТНАМ'),
('Блузка из органзы', 3500, 6700, 3200, 'Состав: 100% полиэстер. Страна-производитель: КИТАЙ'),
('Удлиненная блузка', 3000, 4578, 2500, 'Состав: 56% полиэстер, 40% полиамид, 4% эластан. Страна-производитель: ТУРЦИЯ'),
('Асимметричная блузка', 1600, 2800, 1400, 'Состав: 70% вискоза, 30% полиэстер. Страна-производитель: КИТАЙ'),
('Топ из вискозы', 1000, 1800, 800, 'Состав: 70% вискоза, 30% полиамид. Страна-производитель: БАНГЛАДЕШ'),
('Майка с пуговицами', 990, 1300, 600, 'Состав: 95% хлопок, 5% эластан. Страна-производитель: УЗБЕКИСТАН')
('Брюки палаццо', 2599, 3700, 2350, 'Состав: 92% полиэстер, 8% эластан. Страна-производитель: КИТАЙ'),
('Брюки из вельвета', 2800, 3400, 2400,'Состав: 85% полиэстер, 12% полиамид, 3% эластан. Страна-производитель: КИТАЙ'),
('Дутое пальто', 8000, 12000, 7560, 'Состав: 100% полиэстер, 100% полиэстер, 100% полиэстер. Страна-производитель: КИТАЙ'),
('Стеганая куртка', 7000, 11000, 6543, 'Состав: 100% полиамид, 100% полиэстер, 100% полиэстер. Страна-производитель: КИТАЙ'),
('Куртка с капюшоном', 9000, 15000, 7543, 'Состав: 100% полиэстер, 100% полиэстер, 100% полиэстер. Страна-производитель: КИТАЙ');

INSERT INTO ProductOtherImg(id_product, id_img)
VALUES
(1, 2), (1, 3), (2, 5),
(2, 6), (3, 8), (3, 9),
(4, 11), (4, 12), (5, 14),
(5, 15), (6, 17), (6, 18),
(7, 20), (7, 21), (8, 23),
(8, 24), (9, 26), (9, 27),
(10, 29), (10, 30), (11, 32),
(11, 33), (12, 35), (12, 36),
(13, 38), (13, 39), (14, 41),
(14, 42), (15, 44), (15, 45),
(16, 47), (16, 48), (17, 50),
(17, 51), (18, 53), (18, 54),
(19, 56), (19, 57);


INSERT INTO ProductMainImg(id_product, id_img)
VALUES
(1, 1), (2, 4), (3, 7),
(4, 10), (5, 13), (6, 16),
(7, 19), (8, 22), (9, 25),
(10, 28), (11, 31), (12, 34),
(13, 37), (14, 40), (15, 43),
(16, 46), (17, 49), (18, 52),
(19, 55);



INSERT INTO Img (img)
VALUES
('shirt.png'),
('shirt-2.jpg'),
('shirt-3.jpg'),
('https://a.lmcdn.ru/img600x866/M/P/MP002XW0KVO1_18033464_1_v1_2x.jpeg'),
('https://a.lmcdn.ru/img600x866/M/P/MP002XW0KVO1_18033466_2_v1_2x.jpeg'),
('https://a.lmcdn.ru/img600x866/M/P/MP002XW0KVO1_18033470_4_v1_2x.jpeg'),
('https://imgcdn.zarina.ru/upload/images/23691/thumb/450_9999/2369101301_62_1.jpg?t=1661873747'),
('https://imgcdn.zarina.ru/upload/images/23691/thumb/450_9999/2369101301_62_3.jpg?t=1661873747'),
('https://imgcdn.zarina.ru/upload/images/23691/thumb/450_9999/2369101301_62_8.jpg?t=1661873747'),
('https://imgcdn.zarina.ru/upload/images/24611/thumb/450_9999/2461110310_248_3.jpg?t=1662113728'),
('https://imgcdn.zarina.ru/upload/images/24611/thumb/450_9999/2461110310_248_8.jpg?t=1662113733'),
('https://imgcdn.zarina.ru/upload/images/24611/thumb/450_9999/2461110310_248_9.jpg?t=1662113734'),
('https://imgcdn.zarina.ru/upload/images/23691/thumb/450_9999/2369102302_2_2.jpg?t=1662474728'),
('https://imgcdn.zarina.ru/upload/images/23691/thumb/450_9999/2369102302_2_5.jpg?t=1662474728'),
('https://imgcdn.zarina.ru/upload/images/23691/thumb/450_9999/2369102302_2_8.jpg?t=1662474728'),
('https://imgcdn.zarina.ru/upload/images/24611/thumb/450_9999/2461130330_40_1.jpg?t=1662367168'),
('https://imgcdn.zarina.ru/upload/images/24611/thumb/450_9999/2461130330_40_3.jpg?t=1662367170'),
('https://imgcdn.zarina.ru/upload/images/24611/thumb/450_9999/2461130330_40_8.jpg?t=1662367173'),
('https://imgcdn.zarina.ru/upload/images/23681/thumb/450_9999/2368118360_50_1.jpg?t=1661779282'),
('https://imgcdn.zarina.ru/upload/images/23681/thumb/450_9999/2368118360_50_3.jpg?t=1661779284'),
('https://imgcdn.zarina.ru/upload/images/23681/thumb/450_9999/2368118360_50_2.jpg?t=1661779283'),
('https://imgcdn.zarina.ru/upload/images/24615/thumb/450_9999/2461503403_66_1.jpg?t=1662386031'),
('https://imgcdn.zarina.ru/upload/images/24615/thumb/450_9999/2461503403_66_5.jpg?t=1662386033'),
('https://imgcdn.zarina.ru/upload/images/24615/thumb/450_9999/2461503403_66_6.jpg?t=1662386033'),
('https://imgcdn.zarina.ru/upload/images/23681/thumb/450_9999/2368123323_60_1.jpg?t=1663236554'),
('https://imgcdn.zarina.ru/upload/images/23681/thumb/450_9999/2368123323_60_4.jpg?t=1663236554'),
('https://imgcdn.zarina.ru/upload/images/23681/thumb/450_9999/2368123323_60_8.jpg?t=1663236554'),
('https://imgcdn.zarina.ru/upload/images/14221/thumb/450_9999/1422101301_50_1.jpg?t=1665059420'),
('https://imgcdn.zarina.ru/upload/images/14221/thumb/450_9999/1422101301_50_7.jpg?t=1665059522'),
('https://imgcdn.zarina.ru/upload/images/14221/thumb/450_9999/1422101301_50_2.jpg?t=1665059421'),
('https://imgcdn.zarina.ru/upload/images/23682/thumb/450_9999/2368257329_50_3.jpg?t=1661853495'),
('https://imgcdn.zarina.ru/upload/images/23682/thumb/450_9999/2368257329_50_5.jpg?t=1661853495'),
('https://imgcdn.zarina.ru/upload/images/23682/thumb/450_9999/2368257329_50_5.jpg?t=1661853495'),
('https://imgcdn.zarina.ru/upload/images/23681/thumb/450_9999/2368130330_133_3.jpg?t=1661853495'),
('https://imgcdn.zarina.ru/upload/images/23681/thumb/450_9999/2368130330_133_3.jpg?t=1661853495'),
('https://imgcdn.zarina.ru/upload/images/23681/thumb/450_9999/2368130330_133_9.jpg?t=1661853496'),
('https://imgcdn.zarina.ru/upload/images/23686/thumb/450_9999/2368655855_49_1.jpg?t=1659955890'),
('https://imgcdn.zarina.ru/upload/images/23686/thumb/450_9999/2368655855_49_3.jpg?t=1659955892'),
('https://imgcdn.zarina.ru/upload/images/23686/thumb/450_9999/2368655855_49_5.jpg?t=1659955893'),
('https://imgcdn.zarina.ru/upload/images/22655/thumb/450_9999/2265551458_50_3.jpg?t=1658412436'),
('https://imgcdn.zarina.ru/upload/images/22655/thumb/450_9999/2265551458_50_5.jpg?t=1658412438'),
('https://imgcdn.zarina.ru/upload/images/22655/thumb/450_9999/2265551458_50_5.jpg?t=1658412438'),
('https://imgcdn.zarina.ru/upload/images/24612/thumb/450_9999/2461240740_50_1.jpg?t=1665059463'),
('https://imgcdn.zarina.ru/upload/images/24612/thumb/450_9999/2461240740_50_4.jpg?t=1665059466'),
('https://imgcdn.zarina.ru/upload/images/24612/thumb/450_9999/2461240740_50_4.jpg?t=1665059466'),
('https://imgcdn.zarina.ru/upload/images/24602/thumb/450_9999/2460212712_60_1.jpg?t=1665059436'),
('https://imgcdn.zarina.ru/upload/images/24602/thumb/450_9999/2460212712_60_4.jpg?t=1665059439'),
('https://imgcdn.zarina.ru/upload/images/24602/thumb/450_9999/2460212712_60_7.jpg?t=1665059441'),
('https://imgcdn.zarina.ru/upload/images/24604/thumb/450_9999/2460419119_183_1.jpg?t=1661862569'),
('https://imgcdn.zarina.ru/upload/images/24604/thumb/450_9999/2460419119_183_2.jpg?t=1661862569'),
('https://imgcdn.zarina.ru/upload/images/24604/thumb/450_9999/2460419119_183_5.jpg?t=1661862571'),
('https://imgcdn.zarina.ru/upload/images/24604/thumb/450_9999/2460407107_50_1.jpg?t=1661779341'),
('https://imgcdn.zarina.ru/upload/images/24604/thumb/450_9999/2460407107_50_2.jpg?t=1661779342'),
('https://imgcdn.zarina.ru/upload/images/24604/thumb/450_9999/2460407107_50_1.jpg?t=1661779341'),
('https://imgcdn.zarina.ru/upload/images/24614/thumb/450_9999/2461433133_30_1.jpg?t=1662368319'),
('https://imgcdn.zarina.ru/upload/images/24614/thumb/450_9999/2461433133_30_3.jpg?t=1662368320'),
('https://imgcdn.zarina.ru/upload/images/24614/thumb/450_9999/2461433133_30_3.jpg?t=1662368320');
