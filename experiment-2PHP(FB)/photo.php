<?php
session_start();
require 'connection.php';
if(isset($_POST["submit"])){
  mysqli_query($db,"INSERT INTO `description` VALUES('$_SESSION[user]','$_POST[name]',' ');");
  $name = $_POST["name"];
  if($_FILES["image"]["error"] == 4){
    echo
    "<script> alert('Image Does Not Exist'); </script>"
    ;
  }
  else{
    $fileName = $_FILES["image"]["name"];
    $fileSize = $_FILES["image"]["size"];
    $tmpName = $_FILES["image"]["tmp_name"];

    $validImageExtension = ['jpg', 'jpeg', 'png'];
    $imageExtension = explode('.', $fileName);
    $imageExtension = strtolower(end($imageExtension));
    if ( !in_array($imageExtension, $validImageExtension) ){
      echo
      "
      <script>
        alert('Invalid Image Extension');
      </script>
      ";
    }
    else if($fileSize > 1000000){
      echo
      "
      <script>
        alert('Image Size Is Too Large');
      </script>
      ";
    }
    else{
      $newImageName = uniqid();
      $newImageName .= '.' . $imageExtension;

      move_uploaded_file($tmpName, 'posts/' . $newImageName);
      $query = "INSERT INTO fb_upload VALUES('$_SESSION[user]', '$newImageName','',0)";
      mysqli_query($db, $query);
      echo
      "
      <script>
        alert('Successfully Added');
        document.location.href = 'photo.php';
      </script>
      ";
    }
  }
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Upload Image File</title>
    <style media="screen">
      .main
      {
        width:50%;
        height:300px;
        border:2px solid red;
        margin: auto;
        }
        h3
        {
          color:olive;
        }
    </style>
  </head>
  <body>
    <div class="main">
      <form class="" action="" method="post" autocomplete="off" enctype="multipart/form-data">
        <table>
          <tr>
            <h3 style = "text-align:center;">Upload Photo And Description</h3>
          </tr>
          <tr>
            <td>
                  <label for="image">Image : </label>
            </td>
            <td>
                <input type="file" name="image" id = "image" accept=".jpg, .jpeg, .png" value=""> <br> <br>
            </td>
          </tr>
          <tr>
            <td>
                <label for="name">Description : </label>
            </td>
            <td>
              <textarea name="name" rows="8" cols="50" id = "name"></textarea>

            </td>
          </tr>
          <tr>
            <td>
                <h6 style = "text-align:center;"><button type = "submit" name = "submit">Submit</button></h6>
            </td>
          </tr>
        </table>





      </form>
    </div>

    <br>

  </body>
</html>