<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content-wrapper">

   <!-- / .page-header -->
   <div class="row">
      <div class="col-md-12" style="min-width:1000px;overflow: auto;">
         <div class="panel">
            <div class="panel-heading">
               <h3 class="panel-title"><?php echo $lang['heading_title'] ?></h3>
            </div>
            <div class="panel_body">
            <?php if (intval($self->get_status_ml()) === -1 || intval($self->get_customer_in_ml()) === 2 ) { ?>
               <div class="notif">
                 <div class="alert alert-danger">
                   <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                   <strong>Warning!</strong> Please activate 1 btc to enter the system tree ...
                 </div>
                 <a href="<?php echo $self->url->link('account/price/create', '', 'SSL'); ?>" class="btn btn-primary">Deposit Now </a>
               </div>
            <?php  } else{ ?>
            </div>
            <div class="panel-body">
             
               <div class="tab-content">
                  <!-- <div class="panel-heading">
                     <h3 class="panel-title">Downline Tree</h3>
                     </div> -->
                  <div id="tab-binary" class="tab-pane active">
                     <fieldset>
                        <div class="personal_contain" style="padding:0px;" >
                           <div class="tootbar-top">
                              <ul class="list-unstyled">
                                 <li>
                                   <a class="btn-tree" href="javascript:void(0)" onclick='click_node(
                          <?php echo intval($idCustomer); ?>)'> <span class="btn btn-default" style="font-weight:700"><?php echo $lang['top'] ?></span> </a>
                        
                          <a class="btn-tree" href="javascript:void(0)" onclick='click_back()'> <span class="btn btn-default" style="font-weight:700">Back</span> </a>
                                 </li>
                              </ul>
                           </div>
                           <div class="clr"></div>
                           <div class="personal-tree" style="text-align: center; height:500px">
                              <img src="
                                 <?php echo $self -> config -> get('config_ing_loading'); ?>" />
                           </div>
                        </div>
                     </fieldset>
                  </div>
                 
               </div>
            </div>
            <?php } ?>
         </div>
      </div>
      <!-- End Row -->
   </div>
</div>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/tooltipster.bundle.min.css" />
<script type="text/javascript" src="catalog/view/javascript/tooltipster.bundle.min.js"></script>
<script type="text/javascript">

(function($) {

jQuery.fn.show_tree = function(node) {  

    positon = node.iconCls.split(" ");

    var line_class = positon[1]+'line '+'linefloor'+node.fl;
    var level_active = positon[0]+'iconLevel';

    var node_class = positon[1]+'_node '+'nodefloor'+node.fl;
    var html = '<div class=\''+line_class+'\'></div>';
// onclick=\'click_node('+node.id+')\' value=\''+node.id+'\'
    x_p = "<p>username: "+node.username+"<p>";
    // x_p += "<p>Email: "+node.email+"<p>";
    // x_p += "<p>Phone: "+node.telephone+"<p>";
    x_p += "<p>Date: "+node.date_added+"<p>";

    // x_p += "<p>PD Binary Left: "+node.leftPD+" BTC</p>";
    // x_p += "<p>PD Binary Right: "+node.rightPD+" BTC</p>";


   /* html += !node.empty 
        ? '<div class=\''+node_class+' '+level_active+'\'><a data-html="true" data-toggle="tooltip" rel="tooltip" data-placement="top" data-title="<p>'+x_p+'</p>" class="binaryTree" style="display:block"   \'><i class="fa fa-user type-'+node.level+'" onclick=\'click_node('+node.id+')\' value=\''+node.id+'\' aria-hidden="true"></i></a>' 
        : '<div class=\''+node_class+'\'><a data-toggle="tooltip" data-placement="top" style="display:block" onclick=\'click_node_add('+node.p_binary+', "'+positon[1]+'")\' value=\''+node.p_binary+'\' title="Add new user"><i class="fa fa-plus-square type-add"></i></a>';
  */
  console.log(node);
  if (!node.empty && node.status_ml == 1) {
      var html_ = '<div class=\''+node_class+' '+level_active+'\'><a data-html="true" data-toggle="tooltip" rel="tooltip" data-placement="top" data-title="<p>'+x_p+'</p>" class="binaryTree" style="display:block"   \'><i class="fa fa-user type-'+node.level+'" onclick=\'click_node('+node.id+')\' value=\''+node.id+'\' aria-hidden="true"></i></a>';
    } else if(!node.empty && node.status_ml == -1){
      var html_ ='<div class=\''+node_class+'\'><a data-toggle="tooltip" data-placement="top" style="display:block;" onclick=\'click_node_replace('+node.id+', "'+positon[1]+'")\' value=\''+node.p_binary+'\' title="Add new user"><i class="fa fa-plus-square type-replace"></i></a>';
    }
    else{
      var html_ ='<div class=\''+node_class+'\'><a data-toggle="tooltip" data-placement="top" style="display:block" onclick=\'click_node_add('+node.p_binary+', "'+positon[1]+'")\' value=\''+node.p_binary+'\' title="Add new user"><i class="fa fa-plus-square type-add"></i></a>';
    }
    html += html_;
    html += '<div id=\''+node.id+'\' ></div>';

    html += '</div>';

    $(this).append(html);

    node.children && $.each( node.children, function( key, value ) {
       $('#'+node.id).show_tree(value);

        $('[data-toggle="popover"]').popover();
    });



};


jQuery.fn.show_infomation = function(node) {  

  $.getJSON(
      "index.php?route=account/personal/getInfoUser&id="+node,
    function(data){
    $(this).find('dd').html('');      

      if(data.id !=0){

        $.each(data, function (k,v){
        $('#ajax_'+k).html(v);

      });     

      }

    }
  );

};

// xay dung cay voi id truyen vo

jQuery.fn.build_tree = function(id, method) {   

    $('.personal-tree').html('<img src="<?php echo $self -> config -> get('config_ing_loading'); ?>"  />');

    $.ajax({

      url: "index.php?route=account/personal/"+method,

      dataType: 'json',

      data: {id_user : id},

      success: function(json_data){

        var rootnode = json_data[0];
         $('.personal-tree').html('');

         $('.personal-tree').show_tree(rootnode);

         $('.personal_contain').show_infomation(rootnode.id);

         $('#current_top').html("Goto "+rootnode.name + "\'s");

      }

    }); 

};

})(jQuery);
 var click_node_replace =  function (p_binary, positon){
    var link = '<?php echo $self -> url -> link('account/personal/replace_customer', '', 'SSL'); ?>';
    link += '&p_binary=' + p_binary;
    link += '&postion='+ positon;
    link += '&token='+ '<?php echo $customer_code; ?>';
    location.href = link;
    
  };
  var click_node_add =  function (p_binary, positon){
    var link = '<?php echo $self -> url -> link('account/personal/add_customer', '', 'SSL'); ?>';
    link += '&p_binary=' + p_binary;
    link += '&postion='+ positon;
    link += '&token='+ '<?php echo $customer_code; ?>';
    location.href = link;
    
  };
   function click_node(id){
    jQuery(document).build_tree(id,'getJsonBinaryTree_Admin');
    $('.tooltip').hide();
    !_.contains(window.arr_lick, id) && window.arr_lick.push(id);
   }
   window.arr_lick = [];
   function click_back(){
      if(window.arr_lick.length === 0){
        click_node(<?php echo intval($idCustomer); ?>);
      }else{
        window.arr_lick = _.initial(window.arr_lick);
        typeof _.last(window.arr_lick) !== 'undefined' ? click_node(_.last(window.arr_lick)) : click_node(1);
      }
   }

function upto_level(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'getJsonBinaryTreeUplevel');

}

function goto_bottom_left(id){

  jQuery(document).build_tree(id,'goBottomLeft');

}

function goto_bottom_right(id){

  jQuery(document).build_tree(id,'goBottomRight');

}

function goto_bottom_left_oftop(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'goBottomLeft');

}

function goto_bottom_right_oftop(id){

  var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

  jQuery(document).build_tree(top,'goBottomRight');

}

jQuery(document).ready(function($) {
  click_node(<?php echo intval($idCustomer);?>);
});

</script>

<?php echo $footer; ?>