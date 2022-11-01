<?php
require "../modules/bd.php";

if (isset($_GET['id'])){
    $page_id = $_GET['id'];



$sql = "SELECT p_s_union.id_section FROM (
    (SELECT p_s.* FROM Product_section as p_s 
    JOIN full_product as f_p ON f_p.id_product = p_s.id_product
    WHERE f_p.is_active=1) 
    UNION 
    (SELECT p_m_s.* FROM Product_main_section as p_m_s
    JOIN full_product as f_p ON f_p.id_product = p_m_s.id_product
    WHERE f_p.is_active=1) 
    ) as p_s_union 
    WHERE p_s_union.id_section = $page_id  
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

?>
    <?php
        $sql="SELECT s.title, s.description_section FROM Section as s 
        WHERE  s.id_section=$page_id";
        if($result = $conn->query($sql)){
            if($result->num_rows > 0){
                foreach($result as $row){
                    $title = $row["title"];
                    $description = $row["description_section"];
                    ?>
                    <div>
                    <h1><?php echo $title ?></h1>
                    <p><?php echo $description ?></p>  
                    </div>               
                    <?php
                }
            }
        }
        ?>
        <ul class="breadcrumb">
            <li><a href="../index.php">Категории</a></li>
            <li><?php echo $title ?></li>
        </ul>
        


        <div class="second-card">
        <?php
        

        $sql = "SELECT count(p_s_union.id_product) as number FROM Section as s 
                JOIN (
                    (SELECT p_s.* FROM Product_section as p_s ) 
                    UNION 
                    (SELECT p_m_s.* FROM Product_main_section as p_m_s) 
                ) as p_s_union on p_s_union.id_section=s.id_section 
                JOIN Full_product as f_p on f_p.id_product=p_s_union.id_product 
                WHERE f_p.is_active=1 AND  p_s_union.id_section = $page_id
                GROUP BY p_s_union.id_section";
                
        if($result = $conn->query($sql))//query - выполнение запроса
        {
            if($result->num_rows > 0)
            {
                $row = $result ->fetch_assoc();
                $number = $row['number'];
                
            }
        }     
            

        if(isset($_GET["page"]))
        {
            $page = $_GET["page"];
        }
        else
            $page = 1;

        $kol=12;
        $art = ($page * $kol) - $kol; // определяем, с какой записи нам выводить        

        $page_quantity = ceil($number/$kol);
    

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
        
        if($result = $conn->query($sql)){
            if($result->num_rows > 0){
                foreach($result as $row){
                    $title=$row["title"];
                    $main_section=$row["main_section"];
                    $img=$row["img"];
                    $alt=$row["alt"];
                    $id_product=$row["id_product"];
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

