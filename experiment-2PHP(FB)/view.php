<?php include "connection.php";
session_start(); ?>
</head>
 <body>
   <table border = 1 cellspacing = 0 cellpadding = 10>
     <tr>
       <td>*</td>
       <td>Image</td>
      <td>Description</td>
      <td>Likes</td>
      <td>Comments</td>
     </tr>
     <?php
     $i = 1;
     $rows = mysqli_query($db, "SELECT fb_upload.image,description.description, fb_upload.likes,fb_upload.id from `fb_upload` inner join `description` where fb_upload.Username = '$_SESSION[user]' and description.Username = '$_SESSION[user]' and fb_upload.id = description.id ORDER BY fb_upload.id DESC;");
     ?>

     <?php while($row = mysqli_fetch_row($rows))
     { ?>
     <tr>
       <td><?php echo $i++; ?></td>
       <td> <img src="posts/<?php echo $row[0];?>" alt="" height = "200px " width = "200px"></td>
       
        <td><?php echo $row[1]; ?></td>
          <td><?php echo $row[2]; ?></td>
          <td>
            <table>

            <?php
              $r = 1;
              $c = $row[3];
              $q = mysqli_query($db,"SELECT * from `comments` where  postid  = $c;");
              while($row = mysqli_fetch_array($q))
              {
                ?>
                <tr>
                  <td><?php echo $r; ?></td>
                     <td>  <?php echo $row['comment']; echo "  <b> by "; echo $row['username'];echo "</b>"; ?> </td>
                </tr>
                <?php
                $r = $r + 1;
              }
             ?>


             </table>
          </td>
     </tr>
   <?php } ?>
   </table>
   <br>

 </body>
</html>
