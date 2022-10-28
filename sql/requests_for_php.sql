	/*Выводит для каждого раздела имя раздела, 
	его параметры и сколько товаров (активных) в нем,
	если в данном разделе вообще есть активные товары,
	выстраивает эти разделы в порядке убывания по числу товаров внутри*/
	SELECT s.*, count(p_s_union.id_product) as number FROM Section as s 
	JOIN (
		(SELECT p_s.* FROM Product_section as p_s ) 
		UNION 
		(SELECT p_m_s.* FROM Product_main_section as p_m_s) 
	) as p_s_union on p_s_union.id_section=s.id_section 
	JOIN Full_product as f_p on f_p.id_product=p_s_union.id_product 
	WHERE f_p.is_active=1 
	GROUP BY p_s_union.id_section 
	ORDER BY number desc;



	/*При переходе в конкретный раздел*/



	/*Для раздела 1 (на месте 1 будет айдишник полученный гетом) 
	выводит заголовок и описание*/
	SELECT s.title, s.description_section FROM Section as s 
	WHERE  s.id_section=1;

	/*Для раздела 1 выводит 12 записей и инфу по каждому товару
	название, главный раздел, картинка анонса*/
	SELECT f_p.title, s.title, Img.img, Img.alt FROM Full_product as f_p 
    JOIN (
		(SELECT p_s.* FROM Product_section as p_s ) 
		UNION 
		(SELECT p_m_s.* FROM Product_main_section as p_m_s) 
	) as p_s_union on p_s_union.id_product=f_p.id_product 
	JOIN Product_main_section as p_m_s ON p_m_s.id_product=p_s_union.id_product  
	JOIN Section as s ON s.id_section=p_m_s.id_main_section 
	JOIN Product_main_img as p_m_i ON f_p.id_product=p_m_i.id_product 
	JOIN Img ON Img.id_img=p_m_i.id_img 
	WHERE p_s_union.id_section=3 AND f_p.is_active=1 
	limit 12, 12;



	/*Страница товара*/




	/*Для товара с id=3 вывод названия, описания и цен*/
	SELECT f_p.title, f_p.description_product, f_p.price, 
	f_p.price_without_discont, f_p.price_with_promo FROM Full_product as f_p 
	WHERE f_p.id_product=3;

	/*В каких разделах, коме главного, лежит товар*/
	SELECT * FROM Section as s 
	JOIN product_section as p_s ON s.id_section=p_s.id_section 
	WHERE p_s.id_product=3;

	/*Главный раздел для товара*/
	SELECT s.title FROM Product_main_section as p_m_s 
	JOIN Section as s ON s.id_section=p_m_s.id_main_section 
	WHERE f_p.id_product=3;


	/*Выборка основной картинки*/
	SELECT Img.img, Img.alt FROM Img 
	JOIN Product_main_img as p_m_i ON Img.id_img=p_m_i.id_img 
	WHERE p_m_i.id_product=3;

	/*Выборка доп картинок*/
	SELECT Img.img, Img.alt FROM Img 
	JOIN Product_other_img as p_o_i ON Img.id_img=p_o_i.id_img 
	WHERE p_o_i.id_product=3;

