<?php session_start(); ?>
<?php
  if($_SESSION['user'])
  {
    unset($_SESSION['user']);
  }
  ?>
  <script type="text/javascript">
    window.location = "index.php";
  </script>