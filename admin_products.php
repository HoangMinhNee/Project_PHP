<?php

include 'config.php';

session_start();

$admin_id = $_SESSION['admin_id'];
if(!isset($admin_id)){
    header('location:login.php');
};

if(isset($_POST['add_product'])){

    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $price = $_POST['price'];
    $image = $_FILES['image']['name'];
    $image_size = $_FILES['image']['size'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = 'uploaded_img/'.$image;
 
    $select_product_name = mysqli_query($conn, "SELECT name FROM `products` WHERE name = '$name'") or die('query failed');
 
    if(mysqli_num_rows($select_product_name) > 0){
       $message[] = 'Sản phẩm đã được thêm trước đó';
    }else{
       $add_product_query = mysqli_query($conn, "INSERT INTO `products`(name, price, image) VALUES('$name', '$price', '$image')") or die('query failed');
 
       if($add_product_query){
          if($image_size > 2000000){
             $message[] = 'Dung lượng hình ảnh quá lớn';
          }else{
             move_uploaded_file($image_tmp_name, $image_folder);
             $message[] = 'Thêm sản phẩm thành công!';
          }
       }else{
          $message[] = 'Thêm sản phẩm không thành công!';
       }
    }
 }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>

    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- admin css file -->
    <link rel="stylesheet" href="/css/admin_style.css">
</head>
<body>
    
<?php
include 'admin_header.php';
?>
<?php
if(isset($message)){
    foreach($message as $message){
        echo '<div class="message">
              <span>'.$message.'</span>
              <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
             </div>';
    }
}

?>
<!-- product CRUD section starts -->

<section class="add-products"> 

    <h1 class="title">Shop products</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <h3>Add products</h3>
        <input type="text" name="name" class="box" placeholder="Nhập tên sản phẩm" require>
        <input type="number" min="0" name="price" class="box" placeholder="Nhập giá sản phẩm" required>
        <input type="file" name="image" accept="image/jpg, image/jpeg, image/png" class="box" require>
        <input type="submit" value="Thêm sản phẩm" name="add_product" class="btn">

    </form>
</section>

<!-- product CRUD section ends -->







<!-- admin js file -->
<script src="/js/admin_script.js"></script>

</body>
</html>