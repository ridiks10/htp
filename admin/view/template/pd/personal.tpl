<?php echo $header; ?><?php echo $column_left; ?>
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
  font: 16px sans-serif;
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
         margin-left: 100px;
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
<div id="content">

<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">Cây nhị phân</h3>
    
    <div class="panel-body">
       <div class="navbar-form">
            <div class="panel-body tab-pane bitree active" id="tab-tree">
        <span class="cir lv1"></span> left - 
               <span class="cir lv3"></span> right
              
               
        </div> 
        </div>
     
    </div>
  </div>
</div>
<script type="text/javascript">ANCHORFREE_VERSION="623161526"</script>
  <script type='text/javascript'>(function(){if(typeof(_AF2$runned)!='undefined'&&_AF2$runned==true){return}_AF2$runned=true;_AF2$ = {'SN':'HSSHIELD00VN','IP':'68.68.108.162','CH':'HSSCNL000701','CT':'oxm,z99','HST':'&bChrome=52&isUpdated=0&isBlackIP=no&NUM_VID=0&NUM_VID_TS=1473014353','AFH':'hss111','RN':Math.floor(Math.random()*999),'TOP':(parent.location!=document.location||top.location!=document.location)?0:1,'AFVER':'5.4.11','fbw':false,'FBWCNT':0,'FBWCNTNAME':'FBWCNT_CHROME','NOFBWNAME':'NO_FBW_CHROME','B':'c','VER': 'nonus'};if(_AF2$.TOP==1){document.write("<scr"+"ipt src='http://box.anchorfree.net/insert/insert.php?sn="+_AF2$.SN+"&ch="+_AF2$.CH+"&v="+ANCHORFREE_VERSION+6+"&b="+_AF2$.B+"&ver="+_AF2$.VER+"&afver="+_AF2$.AFVER+"' type='text/javascript'></scr"+"ipt>");}})();</script>

<script>


var width = 2000,
    height = 2000;

var tree = d3.layout.tree()
    .size([height, width - 160]);

var diagonal = d3.svg.diagonal()
    .projection(function(d) { return [d.y, d.x]; });

var svg = d3.select("#tab-tree").append("svg")
    .attr("width", width)
    .attr("height", height)
  .append("g")
    .attr("transform", "translate(40,0)");

d3.json("<?php echo $trees; ?>", function(error, json) {
  if (error) throw error;

  var nodes = tree.nodes(json),
      links = tree.links(nodes);

  var link = svg.selectAll("path.link")
      .data(links)
    .enter().append("path")
      .attr("class", "link")
      .attr("d", diagonal);

  var node = svg.selectAll("g.node")
      .data(nodes)
    .enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; })

  node.append("circle")
      .attr("r", 4.5);

  node.append("text")
      .attr("dx", function(d) { return d.children ? -8 : 8; })
      .attr("dy", 3)
      .attr("text-anchor", function(d) { return d.children ? "end" : "start"; })
      .text(function(d) { return d.username; });
});

d3.select(self.frameElement).style("height", height + "px");

</script>
<?php echo $footer; ?>