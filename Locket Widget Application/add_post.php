<?php
// AddPost Procedure calling script
require_once('db.php');  // เชื่อมต่อกับฐานข้อมูล Oracle

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        // ดึงข้อมูลจากฟอร์ม
        $user_id_send = $_POST['user_id_send'];
        $user_id_recived_list = explode(',', $_POST['user_id_recived']);  // แปลงเป็น array
        $photopath = $_POST['photopath'];
        $caption = $_POST['caption'];
        $upload_date = $_POST['upload_date'];

        // แปลงข้อมูลผู้รับเป็น Oracle Collection
        $user_id_recived_array = implode("','", array_map('trim', $user_id_recived_list));
        $user_id_recived_collection = "SYS.ODCIVARCHAR2LIST('{$user_id_recived_array}')";

        // เตรียมคำสั่ง SQL สำหรับเรียกใช้ stored procedure
        $sql = "BEGIN AddPost(:user_id_send, {$user_id_recived_collection}, :photopath, :caption, TO_DATE(:upload_date, 'YYYY-MM-DD')); END;";

        // เตรียมคำสั่งเพื่อ bind ค่า
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':user_id_send', $user_id_send);
        $stmt->bindParam(':photopath', $photopath);
        $stmt->bindParam(':caption', $caption);
        $stmt->bindParam(':upload_date', $upload_date);

        // เรียกใช้ stored procedure
        $stmt->execute();

        echo "Post added successfully!";
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>
