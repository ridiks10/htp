<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Thống kê</h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">Thống kê</h3>
    
    </div>
      <div class="clearfix" style="margin-top: 20px;"></div>
      <div class="text-center">
      <?php if (isset($_SESSION['export'])) if ($_SESSION['export'] == "export"){ ?>
        <div class="alert alert-success">
          <strong>Success!</strong> Xuất file excel thành công.
        </div>
      <?php } ?>
      <?php if (isset($_SESSION['hoahong'])) { ?>
        <div class="alert alert-success">
          <strong>Success!</strong> Tính lãi thành công.
        </div>
      <?php } ?>
      <?php if (isset($_SESSION['export'])) if ($_SESSION['export'] == "nodata"){ ?>
        <div class="alert alert-danger">
          <strong>Danger!</strong> Không có dữ liệu xuất trong ngày hôm nay.
        </div>
      <?php } ?>
    <table>
      <thead>
        <tr>
          <th>Tính lãi</th>
          <th>Xuất excel</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <?php
              if (count($show_button_hoahong) > 0) {
            ?>
              <a class="click_" href="index.php?route=report/exportCustomerid/getPD90Before&token=<?php echo $_GET['token'];?>">
              <button type="button" class="btn btn-success">Tính lãi</button>
              </a>
            <?php } else { ?>
              
              <h1 class="countdown" data-countdown="<?php echo $get_time_button_hoahong['date_finish'];?>"></h1>
            <?php } ?>
          </td>
          <td>
            <?php
              if (count($show_button_export) > 0) {
            ?>
            <a class="click" href="index.php?route=report/exportCustomerid/export_pd_new&token=<?php echo $_GET['token'];?>"><button type="button" class="btn btn-info">Xuất Excel</button></a>
          <?php } else { ?>
            <h1 class="countdown" data-countdown="<?php echo $get_time_button_export['date_finish'];?>"></h1>
          <?php } ?>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="clearfix" style="margin-top: 30px;"></div>
    <table>
      <thead>
        <tr>
          <th>Lãi trực tiếp</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <?php
              if (count($show_button_laitructiep) > 0) {
            ?>
              <a class="click" href="index.php?route=report/exportCustomerid/export_c_wallet&token=<?php echo $_GET['token'];?>">
              <button type="button" class="btn btn-warning">Tính lãi trực tiếp</button>
              </a>
            <?php } else { ?>
              
              <h1 class="countdown" data-countdown="<?php echo $get_time_button_laitructiep['date_finish'];?>"></h1>
            <?php } ?>
          </td>
          <td>
            
          </td>
        </tr>
      </tbody>
    </table>
      
        
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$('.click').click(function() {
  jQuery(this).hide();
  setTimeout(function(){
    location.reload();
  },1000)
    
});
</script>
<?php echo $footer; ?>
<style type="text/css" media="screen">
  ul#suggesstion-box li:hover {
    cursor: pointer;
    background-color: #E27225;
    color: #fff;
  }
  table{
    width: 100%;
  }
  table td, table th{
    width: 50%; 
    text-align: center;
  }
  table th{
    font-size: 25px;
    height: 50px;
  }
  table td h1{
    color: red;
  }
</style>

