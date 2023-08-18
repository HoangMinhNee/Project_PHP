<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];
if(!isset($user_id)){
    header('location:login.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- css file -->
    <link rel="stylesheet" href="/css/style.css">

</head>
<body>
    <?php include 'header.php'; ?>

    <section class="home">

        <div class="content">
            <h3>Đọc sách là con đường ngắn nhất dẫn ta đến thành công</h3>
            <p> Đằng sau sự thành công của một người đàn ông, là hình dáng của một người phụ nữ. Còn đằng sau sự thành công của bất kì ai là ít nhất một cuốn sách, hay cả một giá sách.</p>
            <a href="about.php" class="white-btn">discover more</a>
        </div>

    </section>
    <section class="products">

   <h1 class="title">mới nhất</h1>

   <div class="box-container">

        <?php  
            $select_products = mysqli_query($conn, "SELECT * FROM `products` LIMIT 6") or die('query failed');
            if(mysqli_num_rows($select_products) > 0){
            while($fetch_products = mysqli_fetch_assoc($select_products)){
      ?>
     <form action="" method="post" class="box">
      <img class="image" src="uploaded_img/<?php echo $fetch_products['image']; ?>" alt="">
      <div class="name"><?php echo $fetch_products['name']; ?></div>
      <div class="price"><?php echo $fetch_products['price']; ?> VNĐ</div>
      <input type="number" min="1" name="product_quantity" value="1" class="qty">
      <input type="hidden" name="product_name" value="<?php echo $fetch_products['name']; ?>">
      <input type="hidden" name="product_price" value="<?php echo $fetch_products['price']; ?>">
      <input type="hidden" name="product_image" value="<?php echo $fetch_products['image']; ?>">
      <input type="submit" value="Thêm vào giỏ hàng" name="add_to_cart" class="btn">
     </form>
      <?php
         }
      }else{
         echo '<p class="empty">Chưa có sản phẩm nào được thêm!</p>';
      }
      ?>
   </div>

   <div class="load-more" style="margin-top: 2rem; text-align:center">
      <a href="shop.php" class="option-btn">load more</a>
   </div>

</section>

<section class="about">

   <div class="flex">

      <div class="image">
         <img src="/images/about-img.jpg" alt="">
      </div>

      <div class="content">
         <h3>about us</h3>
         <p>Nếu bạn chỉ đọc những cuốn sách mà tất cả mọi người đều đọc, bạn chỉ có thể nghĩ tới điều tất cả mọi người đều nghĩ tới.</p>
         <a href="about.php" class="btn">read more</a>
      </div>

   </div>

</section>

    <?php include 'footer.php'; ?>
<!-- file js -->
<script src="/js/script.js"></script>
</body>
</html>