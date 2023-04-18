<?php include "connection.php"; ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <style media="screen">
    body
    {
      background-image: url("");
      background-repeat: no-repeat;
      background-size: cover;
      background-color:#daa;
    }
    
    li a
    {
      color: White;
    }
    nav{
      align-items:center;
      word-spacing: 30px;
      padding: 20px;
    }
    nav li
    {
      display: inline-block;
      line-height: 70px;
    }

    body
    {
      background-color:#add ;
    }
    .main {
      border: 2px solid blue;
      margin: auto;
      width:500px;
      height:40;
      padding: 5px;
      flex:1;
      border-radius: 25px;
  
    }

            .main h1
            {
              text-align: center;
              color: brown;
            }
            td
            {
              padding:5px;
              text-align:left;
              color: purple;
              font-size:30px;
            }
            input[type = text],input[type = email],input[type = password],textarea
            {
              width:100%;
              padding: 10px 10px;
              margin:8px 0;
              border:2px solid red;
            }
            input[type = submit]
            {
              background-color: olive;
              border: none;
              color: white;
              padding: 10px 10px;
              text-decoration: none;
              margin: 4px 2px;
              cursor: pointer;
            }
            button
            {
              background-color: green;
              border: none;
              color: white;
              padding: 5px 5px;
              text-decoration: none;
              margin: 4px 2px;
              cursor: pointer;
            }
            .top
            {
              width:100%;
              height:80px;

            }.top h1
            {
              text-align: center;

            }
            .p
            {
              display: flex;
            }
            .p1
            {
              flex:1;
            }
            
    </style>
    <script type="text/javascript">
      function f1()
      {
        window.location = "reg.php";
      }
      function f2()
      {
        window.location = "index.php";
      }
      
    </script>
  </head>

  <body>
    <h1 style = "text-align:center">Sign Up for Facebook</h1>

          <div class="main">



              <form class="" action="reg.php" method="post">
                <table>


                  <tr>
                    <td>Name:</td>
                    <td>
                      <input type="text" name="name" value="" placeholder="Enter first name: " required ="required">
                    </td>
                  </tr>
                  <tr>
                    <td>Username:</td>
                    <td>
                        <input type="text" name="username" value="" placeholder="Enter User name: " required ="required">
                    </td>
                  </tr>
                  <tr>
                     <td>Enter your mail Id</td>
                    <td>
                      <input type="email" name="email" value="" placeholder="Enter mail Id" required ="required">
                    </td>
                  </tr>
                  <tr>
                    <td>Enter your password</td>
                    <td>
                        <input type="password" name="password" value="" placeholder="Enter password" required ="required">
                    </td>
                  </tr>

                  <tr>
                    <td>
                       <input type="submit" name="submit" value="submit">
                    </td>
                  </tr>
                </table>
              </form>
          
        </div>
        <footer>
        <div >
          <nav>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li><button type="button" name="button" onclick = "f1()">Sign Up</button>
      </li>

        <li><button type="button" name="button" onclick = "f2()">Login</li></button>
    </nav>

    </div>
    </footer>
      <?php
          if(isset($_POST['submit']))
          {

            $q = mysqli_query($db,"SELECT * FROM `registration` where username =  '$_POST[username]';");
            $c = mysqli_fetch_row($q);
            if($c == 0)
            {
              $q = mysqli_query($db,"INSERT into `registration`(name,username,email,password) VALUES('$_POST[name]','$_POST[username]','$_POST[email]','$_POST[password]');");
              if($q)
              {
                ?>
                <script type="text/javascript">
                  alert("Registration Completed");
                </script><?php

              }
              else {
                ?>
                <script type="text/javascript">
                  alert("Registration Failed");
                </script>
                <?php
              }
            }else {
              ?>
              <script type="text/javascript">
                alert("Username is Already taken");
              </script>
              <?php
            }

          }

       ?>
  </body>
</html>