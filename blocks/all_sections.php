<?php   require "modules/bd.php" ?>

<div class="conteiner">
<?php
    $sql =     "SELECT s.*, count(p_s_union.id_product) as number FROM Section as s 
                JOIN (
                    (SELECT p_s.* FROM Product_section as p_s ) 
                    UNION 
                    (SELECT p_m_s.* FROM Product_main_section as p_m_s) 
                ) as p_s_union on p_s_union.id_section=s.id_section 
                JOIN Full_product as f_p on f_p.id_product=p_s_union.id_product 
                WHERE f_p.is_active=1 
                GROUP BY p_s_union.id_section 
                ORDER BY number desc";

    if($result = $conn->query($sql)){
        if($result->num_rows > 0){
            foreach($result as $row){
                $id_section = $row["id_section"];
                $title = $row["title"];
                $description_section = $row["description_section"];
                $number=$row["number"];
                ?>
                <a href="pages/section_page.php?id=<?php echo $id_section?>">
                <div class="first-card">
                    <time datetime="2017-11-6" class="first-card_time"><?php echo $number?></time>
                    <p class="first-card_text"> <?php echo $title ?></p>
                    <p style='color:dimgray;'><?php echo $description_section?></p>
                </div>
                </a>
                <?php
            }
        }
        else{
            echo "<div>Все плохо</div>";
        }
    }

?>
</div>