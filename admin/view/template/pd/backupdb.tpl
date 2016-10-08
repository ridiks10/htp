<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Backup Databases</h1>

  </div>
</div>  
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title click_show">Backup Databases</h3>
    </div>

    <div class="clearfix" style="margin-top: 10px;"></div>
      
      <div class="clearfix"></div>
      <div class="col-md-2" style="margin-top: 50px;">
        <a href="<?php echo $backup_hungthinhphat; ?>" class="">
        <button type="button" class="btn btn-success">hungthinhphatcorp.com</button>
        </a>
      </div>
      <div class="col-md-2" style="margin-top: 50px;">
        <a href="<?php echo $backup_happymoney; ?>" class="class_bnt_bk">
        <button type="button" class="btn btn-default">happymoney</button>
        </a>
      </div>
      <div class="col-md-2" style="margin-top: 50px;">
        <a href="<?php echo $backup_coinmax; ?>" class="class_bnt_bk">
        <button type="button" class="btn btn-primary">coinmax.net</button>
        </a>
      </div>
      <div class="col-md-2" style="margin-top: 50px;">
        <a href="<?php echo $backup_bitlegend; ?>" class="class_bnt_bk">
        <button type="button" class="btn btn-info">bitlegend.net</button>
        </a>
      </div>
      <div class="col-md-2" style="margin-top: 50px;">
        <a href="<?php echo $backup_inter_wegroup_help; ?>" class="class_bnt_bk">
        <button type="button" class="btn btn-warning">inter.wegroup.help</button>
        </a>
      </div>
      <div class="col-md-2" style="margin-top: 50px;">
        <a href="<?php echo $backup_vn_wegroup_help; ?>" class="class_bnt_bk">
        <button type="button" class="btn btn-success">vn.wegroup.help</button>
        </a>
      </div>
      
  </div>
</div>


<?php echo $footer; ?>
<style type="text/css" media="screen">
  .class_bnt_bk{
    display: none;
  }
</style>
<script type="text/javascript">
  jQuery('.click_show').click(function(){
    jQuery('.class_bnt_bk').show();
  })
  
</script>
<!-- <script type="text/javascript">
  $('.class_bnt_bk').click(function(){
    if ($('#code_otp').val()==""){
      $('#code_otp').css({'border':'1px solid red'});
      $('#code_otp').focus();
      return false;
    }
    $.ajax({
      type : 'POST',
      url  : '<?php //echo $backup_hungthinhphat; ?>',
      data : {
        'code' : $('#code_otp').val()
      },
      success :  function(data){                       
          if(data == "die")
          {
              alert("Mã code không đúng.")
          }
      }
    });
    return false;
  });
   
</script> -->