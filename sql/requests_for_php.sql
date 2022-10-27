/*Выводит для каждого раздела имя раздела, 
его параметры и сколько товаров (активных) в нем,
если в данном разделе вообще есть активные товары,
выстраивает эти разделы в порядке убывания по числу товаров внутри*/
SELECT Section.*, count(Product_section.id_product) as number FROM Section
    JOIN Product_section ON Section.id_section=Product_section.id_section
    JOIN Full_product on Full_product.id_product=Product_section.id_product
    WHERE Full_product.is_active=true
    GROUP BY Product_section.id_section
    HAVING count(Product_section.id_product)<>0
    ORDER BY number desc;



/*При переходе в конкретный раздел*/



/*Для раздела 1 (на месте 1 будет айдишник полученный гетом) 
выводит заголовок и описание*/
SELECT DISTINCT Section.title, Section.description_section FROM Full_product 
JOIN Product_section ON Product_section.id_product=Full_product.id_product 
JOIN Section ON Section.id_section= Product_section.id_section  
WHERE  Product_section.id_section=1 AND Full_product.is_active=true;

/*Для раздела 1 выводит 12 записей и инфу по каждому товару
название, главный раздел, картинка анонса*/
SELECT Full_product.title, Section.title, Img.img, IMG.alt FROM Full_product 
JOIN Product_main_section ON Product_main_section.id_product=Full_product.id_product 
JOIN Section ON Section.id_section=Product_main_section.id_main_section 
JOIN Product_main_img ON Full_product.id_product=Product_main_img.id_product 
JOIN Img ON Img.id_img=Product_main_img.id_img 
WHERE Section.id_section=1 
limit 12;



/*Страница товара*/




/*Для товара с id=3 вывод названия, описания и цен*/
SELECT Full_product.title, Full_product.description_product, Full_product.price, 
Full_product.price_without_discont, Full_product.price_with_promo FROM Full_product 
WHERE Full_product.id_product=3;

/*В каких разделах лежит товар*/
SELECT Section.title FROM Full_product 
JOIN Product_section ON Product_section.id_product=Full_product.id_product 
JOIN Section ON Section.id_section=Product_section.id_section 
WHERE Full_product.id_product=3;

/*Выборка основной картинки*/
SELECT Img.img, Img.alt FROM Img 
JOIN Product_main_img ON Img.id_img=Product_main_img.id_img 
JOIN Full_product ON Full_product.id_product=Product_main_img.id_product 
WHERE Full_product.id_product=3;

/*Выборка доп картинок*/
SELECT Img.img, Img.alt FROM Img 
JOIN Product_other_img ON Img.id_img=Product_other_img.id_img 
JOIN Full_product ON Full_product.id_product=Product_other_img.id_product 
WHERE Full_product.id_product=3;

