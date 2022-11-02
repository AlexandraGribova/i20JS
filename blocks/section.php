<?php
require "../modules/bd.php";
//id раздела

    if (isset($_GET['id']))
    {
    $page_id = $_GET['id'];

//обработка get запроса. если переданный id не сущщесвтует - 404

$sql = "SELECT p_s_union.id_section FROM (
    SELECT p_s.* FROM Product_section as p_s
    UNION 
    SELECT p_m_s.* FROM Product_main_section as p_m_s 
    ) as p_s_union 
    JOIN full_product as f_p ON f_p.id_product = p_s_union.id_product
    WHERE f_p.is_active=1 AND  p_s_union.id_section = $page_id  
    GROUP BY id_section";

    $sth = $conn->prepare($sql);
    $sth->execute();
    $array = $sth->fetchAll(PDO::FETCH_ASSOC);
    if(count($array)==0)
        {
            header('Location: http:/i20.local/pages/404_page.php');
            exit;
        }
    }



//Вывод названия и описания раздела
        $sql="SELECT s.title, s.description_section FROM Section as s 
        WHERE  s.id_section=$page_id";
        $sth = $conn->prepare($sql);
        $sth->execute();
        $array_descr_section = $sth->fetchAll(PDO::FETCH_ASSOC);


//описание постраничной навигации

$sql = "SELECT count(p_s_union.id_product) as number FROM Section as s 
                JOIN (
                    (SELECT p_s.* FROM Product_section as p_s ) 
                    UNION 
                    (SELECT p_m_s.* FROM Product_main_section as p_m_s) 
                ) as p_s_union on p_s_union.id_section=s.id_section 
                JOIN Full_product as f_p on f_p.id_product=p_s_union.id_product 
                WHERE f_p.is_active=1 AND  p_s_union.id_section = $page_id
                GROUP BY p_s_union.id_section";
         $sth = $conn->prepare($sql);
         $sth->execute();
         $number = $sth->fetch(PDO::FETCH_COLUMN);        
         $kol=12;
         $page_quantity = ceil($number/$kol);

        if(isset($_GET["page"]))
        {
            $page = $_GET["page"];
            if($page> $page_quantity)
            {
                header('Location: http:/i20.local/pages/404_page.php');
                exit;
            }
        }
        else
            $page = 1;

        $art = ($page * $kol) - $kol; // определяем, с какой записи нам выводить     


        $sql =  "SELECT f_p.id_product, f_p.title, s.title as main_section, Img.img, Img.alt FROM Full_product as f_p 
                JOIN (
                    (SELECT p_s.* FROM Product_section as p_s ) 
                    UNION 
                    (SELECT p_m_s.* FROM Product_main_section as p_m_s) 
                ) as p_s_union on p_s_union.id_product=f_p.id_product 
                JOIN Product_main_section as p_m_s ON p_m_s.id_product=p_s_union.id_product  
                JOIN Section as s ON s.id_section=p_m_s.id_main_section 
                JOIN Product_main_img as p_m_i ON f_p.id_product=p_m_i.id_product 
                JOIN Img ON Img.id_img=p_m_i.id_img 
                WHERE p_s_union.id_section=$page_id AND f_p.is_active=1
                limit $art,$kol";
        
        $sth = $conn->prepare($sql);
        $sth->execute();
        $array_pag = $sth->fetchAll(PDO::FETCH_ASSOC);
            
        ?>



<?php
//вывод заголовка
if(count($array_descr_section) > 0){
               for($i=0; $i<count($array_descr_section); $i++){
                    $title_section = $array_descr_section[$i]["title"];
                    $description_section = $array_descr_section[$i]["description_section"];
?>
                    <div>
                    <h1><?php echo $title_section ?></h1>
                    <p><?php echo $description_section ?></p>  
                    </div>               
<?php
                }
            }
?>
        <ul class="breadcrumb">
            <li><a href="../index.php">Категории</a></li>
            <li><?php echo $title_section ?></li>
        </ul>
        


        <div class="second-card">
        <?php     
            if(count($array_pag) > 0){
               for($i=0; $i<count($array_pag); $i++){
                    $title=$array_pag[$i]["title"];
                    $main_section=$array_pag[$i]["main_section"];
                    $img=$array_pag[$i]["img"];
                    $alt=$array_pag[$i]["alt"];
                    $id_product=$array_pag[$i]["id_product"];
                    ?>
                    <a href="product_page.php?id_product=<?php echo $id_product?>&id_section=<?php echo  $page_id?>">
                    <div class="second-card_1">
                        <div class="second_card_img"><img src="<?php echo $img ?>" alt="<?php echo $alt ?>"></div>
                        <div class="second-card_text"><?php echo $title ?></div>
                    </div>
                    </a>
                    <?php
                }
            }
    ?>    
    </div>
    <div class="pagination">
    <?php
    for($i=1; $i<=$page_quantity; $i++)
    {
        ?>
        <a href="section_page.php?id=<?php echo $page_id ?>&page=<?php echo $i ?>">
       <div class="pagination-elem">
            <?php echo $i?>
       </div>
        </a>
        <?php
    }
    ?>
     </div>

