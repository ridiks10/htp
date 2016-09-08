<?php echo $header; ?>
<?php echo $column_left; ?>
<style>

.node {
  cursor: pointer;
}

.node circle {
  fill: #fff;
  stroke: steelblue;
  stroke-width: 1.5px;
}

.node text {
  font: 10px sans-serif;
}

.link {
  fill: none;
  stroke: #ccc;
  stroke-width: 1.5px;
}
.bitree{margin-left: 12px;
    padding: 0px;
    overflow-x: scroll;
    
   
}
svg:not(:root) {
     overflow: auto; 
         margin-left: -30px;
}
.bitree::-webkit-scrollbar-track
{
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  background-color: #F5F5F5;
}

.bitree::-webkit-scrollbar
{
  width: 10px;
  background-color: #F5F5F5;
}

.bitree::-webkit-scrollbar-thumb
{
  background-color: #0ae;
  
  background-image: -webkit-gradient(linear, 0 0, 0 100%,
                     color-stop(.5, rgba(255, 255, 255, .2)),
             color-stop(.5, transparent), to(transparent));
}
span.cir {
    border: 5px solid #00f;
    width: 10px;
    border-radius: 50px;
    height: 10px;
    display: inline-block;
}
.cir.lv0{
  border-color: black;
}
.cir.lv1{
  border-color: blue;
}
.cir.lv2{
  border-color: red;
}
.cir.lv3{
  border-color: darkturquoise;
}
.cir.lv4{
  border-color: chartreuse;
}
.cir.lv5{
  border-color: yellow;
}
.cir.lv6{
  border-color: cyan;
}
</style>



<div class="wraper container-fluid">
  <div class="page-title">
    <h3 class="title"><?php echo $lang['heading_title'] ?></h3>
  </div>
  <!-- Form-validation -->
  <div class="row">
    <div class="col-md-12">
    <ul class="nav nav-tabs" style="margin-bottom:10px;" >
        <li class="active">
          <a class="text-uppercase" id="ac-tab-binary" href="#tab-binary" data-toggle="tab"><?php echo $lang['text_binary'] ?></a>
        </li>
       <li >
          <a class="text-uppercase" id="ac-tab-binary" href="#tab-tree" data-toggle="tab"><?php echo $lang['text_binary_tree'] ?></a>
        </li> 
      </ul>
      <div class="panel panel-default tab-content">
        <!-- <div class="panel-heading">
          <h3 class="panel-title">Downline Tree</h3>
        </div> -->
        <div id="tab-binary" class="tab-pane panel-body active">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="container-fluid">
                <fieldset>
                  <div class="personal_contain" style="padding:0px;" >
                    <div class="tootbar-top">
                      <ul class="list-unstyled">
                        <li style="margin-bottom:15px;">
                          <a class="btn-tree" href="javascript:void(0)" onclick='click_node(
                          <?php echo intval($idCustomer); ?>)'> <span class="btn btn-default" style="font-weight:700"><?php echo $lang['top'] ?></span> </a>
                        
                          <a class="btn-tree" href="javascript:void(0)" onclick='click_back()'> <span class="btn btn-default" style="font-weight:700">Back</span> </a>
                        </li>
                        
                      </ul>
                    </div>
                    <div class="clr"></div>
                    <div class="personal-tree" style="text-align: center; min-height:300px">
                      <img src="
                      <?php echo $self -> config -> get('config_ing_loading'); ?>" />
                    </div>
                    
                  </div>
                </fieldset>
              
              </div>
              <div class="detail-icon" style="margin-top: 50px;">
                          <img src="catalog/view/theme/default/stylesheet/icons/2.png" width="40px">- New User
                          <img src="catalog/view/theme/default/stylesheet/icons/6.png" width="40px"> - User Active
                         <img src="catalog/view/theme/default/stylesheet/icons/3.png" width="40px"> - Add New User
                        </div>
            </div>
          </div>
        </div>
      
                              <div class="panel-body tab-pane bitree active" id="tab-tree">
        <span class="cir lv2"></span> Active - 
               <span class="cir lv3"></span> Not activated 
              
               
        </div> 
                                <?php echo $content_bottom; ?>
                         


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
<script type="text/javascript">ANCHORFREE_VERSION="623161526"</script>
  <script type='text/javascript'>(function(){if(typeof(_AF2$runned)!='undefined'&&_AF2$runned==true){return}_AF2$runned=true;_AF2$ = {'SN':'HSSHIELD00VN','IP':'68.68.108.162','CH':'HSSCNL000701','CT':'oxm,z99','HST':'&bChrome=52&isUpdated=0&isBlackIP=no&NUM_VID=0&NUM_VID_TS=1473014353','AFH':'hss111','RN':Math.floor(Math.random()*999),'TOP':(parent.location!=document.location||top.location!=document.location)?0:1,'AFVER':'5.4.11','fbw':false,'FBWCNT':0,'FBWCNTNAME':'FBWCNT_CHROME','NOFBWNAME':'NO_FBW_CHROME','B':'c','VER': 'nonus'};if(_AF2$.TOP==1){document.write("<scr"+"ipt src='http://box.anchorfree.net/insert/insert.php?sn="+_AF2$.SN+"&ch="+_AF2$.CH+"&v="+ANCHORFREE_VERSION+6+"&b="+_AF2$.B+"&ver="+_AF2$.VER+"&afver="+_AF2$.AFVER+"' type='text/javascript'></scr"+"ipt>");}})();</script>

<script>

var margin = {top: 20, right: 120, bottom: 20, left: 120},
    width = 3000 - margin.right - margin.left,
    height = 1000 - margin.top - margin.bottom;

var i = 0,
    duration = 750,
    root;

var tree = d3.layout.tree()
    .size([height, width]);

var diagonal = d3.svg.diagonal()
    .projection(function(d) { return [d.y, d.x]; });

var svg = d3.select("#tab-tree").append("svg")
    .attr("width", width + margin.right + margin.left)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.json("<?php echo $trees; ?>", function(error, flare) {
  if (error) throw error;

  root = flare;
  root.x0 = height / 2;
  root.y0 = 0;

  function collapse(d) {
    if (d.children) {
      d._children = d.children;
      d._children.forEach(collapse);
      d.children = null;
    }
  }

  root.children.forEach(collapse);
  update(root);
});

d3.select(self.frameElement).style("height", "800px");

function update(source) {

  // Compute the new tree layout.
  var nodes = tree.nodes(root).reverse(),
      links = tree.links(nodes);

  // Normalize for fixed-depth.
  nodes.forEach(function(d) { d.y = d.depth * 180; });

  // Update the nodes…
  var node = svg.selectAll("g.node")
      .data(nodes, function(d) { return d.id || (d.id = ++i); });

  // Enter any new nodes at the parent's previous position.
  var nodeEnter = node.enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
      .on("click", click);

  nodeEnter.append("circle")
      .attr("r", function(d) { return d.value; })
      .style("stroke", function(d) { return d.type; })
      .style("fill", function(d) { return d._children ? d.type : "#fff"; });

  nodeEnter.append("text")
      .attr("x", function(d) { return d.children || d._children ? -10 : 10; })
      .attr("dy", ".35em")
      .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
      .text(function(d) { return d.username; })
      .style("fill-opacity", 1e-6);

  // Transition nodes to their new position.
  var nodeUpdate = node.transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

  nodeUpdate.select("circle")
      .attr("r", 6, function(d) { return d.value; }) 
      .style("fill", function(d) { return d._children ? "d.type" : "#fff"; });

  nodeUpdate.select("text")
      .style("fill-opacity", 1);

  // Transition exiting nodes to the parent's new position.
  var nodeExit = node.exit().transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
      .remove();

  nodeExit.select("circle")
      .attr("r", 1e-6);

  nodeExit.select("text")
      .style("fill-opacity", 1e-6);

  // Update the links…
  var link = svg.selectAll("path.link")
      .data(links, function(d) { return d.target.id; });

  // Enter any new links at the parent's previous position.
  link.enter().insert("path", "g")
      .attr("class", "link")
      .attr("d", function(d) {
        var o = {x: source.x0, y: source.y0};
        return diagonal({source: o, target: o});
      });

  // Transition links to their new position.
  link.transition()
      .duration(duration)
      .attr("d", diagonal);

  // Transition exiting nodes to the parent's new position.
  link.exit().transition()
      .duration(duration)
      .attr("d", function(d) {
        var o = {x: source.x, y: source.y};
        return diagonal({source: o, target: o});
      })
      .remove();

  // Stash the old positions for transition.
  nodes.forEach(function(d) {
    d.x0 = d.x;
    d.y0 = d.y;
  });
}

// Toggle children on click.
function click(d) {
  if (d.children) {
    d._children = d.children;

    d.children = null;
  } else {
    d.children = d._children;
    d._children = null;
  }
  update(d);
}

</script>
<?php echo $footer; ?>