<?php require "../modules/bd.php";

    if(isset($_GET['id_product']))
    {
        $id_product=$_GET['id_product'];

        $sql = "SELECT F_p.id_product FROM Full_product as f_p 
            WHERE f_p.is_active = 1 AND f_p.id_product=$id_product";
            if($result = $conn->query($sql))
            {
                if($result->num_rows <= 0)
                {
                    header('Location: 404_page.php');
                    exit;
                }
            }
    }
    if(isset($_GET['id_section']))
    {
        $id_this_section = $_GET['id_section'];

        $sql = "SELECT p_s_union.id_section FROM (
            (SELECT p_s.* FROM Product_section as p_s 
            JOIN full_product as f_p ON f_p.id_product = p_s.id_product
            WHERE f_p.is_active=1) 
            UNION 
            (SELECT p_m_s.* FROM Product_main_section as p_m_s
            JOIN full_product as f_p ON f_p.id_product = p_m_s.id_product
            WHERE f_p.is_active=1) 
            ) as p_s_union 
            WHERE p_s_union.id_section = $id_this_section  
            GROUP BY id_section";
            if($result = $conn->query($sql))
            {
                if($result->num_rows <= 0)
                {
                    header('Location: 404_page.php');
                    exit;
                }
            }
    }
    //поиск категории
    $sql="	SELECT s.title FROM Product_main_section as p_m_s 
	        JOIN Section as s ON s.id_section=p_m_s.id_main_section 
	        WHERE p_m_s.id_product=$id_product";
    if($result=$conn->query($sql))
    {
        if($result->num_rows>0)
        {
            $row = $result ->fetch_assoc();
            $main_section = $row['title'];
        }
    }

    //поиск инфы по товару - заголовок описание и прочее
     $sql = "SELECT f_p.title, f_p.description_product, f_p.price, 
             f_p.price_without_discont, f_p.price_with_promo FROM Full_product as f_p 
             WHERE f_p.id_product=$id_product";
     if($result = $conn->query($sql))
     {
        if($result->num_rows>0)
          {   
                $row=$result->fetch_assoc();//если в запросе одна строка можно и без цикла
                $title = $row['title'];
                $description_product=$row['description_product'];
                $price=$row['price'];
                $price_without_discont=$row['price_without_discont'];
                $price_with_promo = $row['price_with_promo'];
                        
          }
     }
     //определяем из какой категории мы пришли
     $sql = "SELECT s.title FROM Section as s
             WHERE s.id_section=$id_this_section";
    if($result = $conn->query($sql))
    {
        if($result->num_rows>0)
        {
        $row = $result->fetch_assoc();
        $this_section=$row['title'];
        }
    }

?>

<h1><?php echo $title?></h1>
<ul class="breadcrumb" style="margin: 25px 0;">
            <li><a href="../index.php">Категории</a></li>
            <li><a href="section_page.php?id=1"><?php echo $this_section?></a></li>
            <li><a href=""><?php echo $title ?></a></li>
</ul>

<div class="product">    
            <div class="product_img"> 
                <div class="product_left_img">
                <?php
                    //поиск изображений
                    $sql="  SELECT Img.img, Img.alt FROM Img 
                    JOIN Product_main_img as p_m_i ON Img.id_img=p_m_i.id_img 
                    WHERE p_m_i.id_product=$id_product";
                    if($result = $conn->query($sql))
                    {
                    if($result->num_rows>0)
                    {
                    foreach($result as $row)
                    {
                        $img=$row['img'];
                        $alt=$row['alt'];
                        ?>
                        
                    <img src="<?php echo $img ?>" alt="<?php echo $alt ?>"class="show-img">

                        <?php
                    }
                    }
                    }

                    $sql="  SELECT Img.img, Img.alt FROM Img 
                    JOIN Product_other_img as p_o_i ON Img.id_img=p_o_i.id_img 
                    WHERE p_o_i.id_product=$id_product";
                    if($result = $conn->query($sql))
                    {
                        if($result->num_rows>0)
                        {
                            foreach($result as $row)
                            {
                                $img=$row['img'];
                                $alt=$row['alt'];
                    ?>

                    <img src="<?php echo $img ?>" alt="<?php echo $alt ?>" class="show-img">                    

                    <?php
                            }
                        }
                    }

                    ?>
                    <img class="product_left_img-slider" src="https://cdn-icons-png.flaticon.com/512/32/32195.png">
                </div>
                <div class="product_right_img">
                    <?php
                    //поиск изображений
                    $sql="  SELECT Img.img, Img.alt FROM Img 
                            JOIN Product_main_img as p_m_i ON Img.id_img=p_m_i.id_img 
                            WHERE p_m_i.id_product=$id_product";
                    if($result = $conn->query($sql))
                    {
                        if($result->num_rows>0)
                        {
                            foreach($result as $row)
                            {
                                $img=$row['img'];
                                $alt=$row['alt'];
                                ?>
                                
                    <img src="<?php echo $img ?>" alt="<?php echo $alt ?>" class="increaseImg">

                                <?php
                            }
                        }
                    }

                    ?>
                </div>
            </div>
            <div class="product_description">
                <div class="product-description_categoris">
                    <a href="#">Другие модели Бренда</a>
                    <a href="#">Похожее</a>
                    <a href="#"><?php echo  $main_section?></a>
                </div>
                <div class="product-description_price">
                    <span class="product_old-price"><?php echo $price_without_discont?></span>
                    <span class="product_new-price"><?php echo $price ?></span>
                    <span class="product_promo-price"><?php echo $price_with_promo ?></span><span style="font-size:14px;">&nbsp;- с промокодом</span>
                </div>
                <div class="product-description_info">
                    <div class="product-description-info_elem"><img src="https://cdn-icons-png.flaticon.com/512/33/33281.png"> В наличии в магазине &nbsp;<a> Lamoda</a></div>
                    <div class="product-description-info_elem"><img src="https://cdn-icons-png.flaticon.com/512/605/605964.png"> Бесплатная доставка</div>
                </div>
                <div class="counter">
                    <div class="counter-sign">-</div>
                    <div class="counter-number">0</div>
                    <div class="counter-sign">+</div>
                </div>
                <div class="product-description_buttons">
                    <button class="product_button">Купить</button>
                    <button class="product_button gray_style">В избранное</button>
                </div>
                <div class="product-description_description">
                    <span><?php echo $description_product ?></span>
                </div>
                <div class="product-description_share">
                    <span>Поделиться: </span>
                    <div class="product-description-share_elements">
                        <a href=""><img src="../img/pinterest.png"></a>
                        <a href=""><img src="../img/google.png" alt=""></a>
                        <a href=""><img src="../img/facebook.png" alt=""></a>
                        <a href=""><img src="../img/twitter.png" alt=""></a>
                    </div>
                    <div class="product-description-share_counter">
                        <span>123</span>
                    </div>
                </div>
            </div>
        </div>