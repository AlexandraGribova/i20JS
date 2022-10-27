<?php

    $sql = "SELECT * FROM SECTION";
    "SELECT Section.*, count(Product_section.id_product) FROM Section
    JOIN Product_section ON Section.id_section=Product_section.id_section
    JOIN Full_product on Full_product.id_product=Product_section.id_product
    WHERE Full_product.is_active=true GROUP BY Product_section.id_section" 
    if($result = $conn->query($sql)){
        if($result->num_rows > 0){
            foreach($result as $row){
                $title = $row["title"];
                $description_section = $row["description_section"];
                echo "<div>
                        <h3>Секция:</h3>
                        <p>Заголовок: $title</p>
                        <p>Описание: $description_section</p>
                    </div>";
            }
        }
        else{
            echo "<div>Все плохо</div>";
        }
    }

?>