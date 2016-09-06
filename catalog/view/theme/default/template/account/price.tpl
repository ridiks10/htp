<?php 
   $self->document->setTitle('Dashboard');
   echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left');
   
   ?>
<div id="content-wrapper">
   <!-- 5. $PRICING_PAGE ==============================================================================
      Pricing page
      -->
   <!-- Javascript -->

   <!-- / Javascript -->
   <div class="page-pricing-header">
      
      <div class="bg-overlay" style="background: #8f7c5f;"></div>
      <div class="page-pricing-header-content">
         <h1 class="page-title"><strong>INVESTMENT PLANS</strong></h1>
        <div class="clearfix"></div>
      </div>
   </div>
  
      
   
    <div class="row">
      <div class="col-sm-12">
        <div class="panel">
          <div class="panel-heading">
            
        
               <div class="options pull-right">
                  <div class="btn-toolbar">
                     <a href="<?php echo $self -> url -> link('account/price/create', '', 'SSL'); ?>" class="btn btn-default"><i class="fa fa-fw fa-plus"></i>Create New Investment</a>
                  </div>
               </div><span class="panel-title">Package</span>
               <div class="clearfix"></div>
          </div>
            <?php if ($pds) { ?>
          <div class="panel-body" id="no-more-tables">
            <table class="table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Code</th>
                  <th>Date</th>
                  <th>Filled</th>
                  <th>Profit</th>
                  <th>Status</th>
                  <th>Time remain</th>
                  <?php $tmp = 1; foreach ($pds as $key => $value): ?>
                  <?php if(intval($value['status']) === 0) { ?>
                  <th>Action</th>
                  <?php } ?>
                <?php endforeach; ?>
                </tr>
              </thead>
              <tbody>
                <?php $tmp = 1; foreach ($pds as $key => $value): ?>
                <tr>
                  <td data-title="#"><?php echo $tmp; ?></td>
                  <td data-title="Code"><?php echo $value['pd_number'] ?></td>
                  <td data-title="Date"><?php echo date("m/d/Y H:i:A", strtotime($value['date_added'])); ?></td>
                  <td data-title="Filled"><?php echo $value['filled']/100000000?> BTC</td>
                  <td data-title="Amount"><?php echo $value['max_profit']/100000000 ?> BTC</td>
                  <td data-title="Status"><?php switch ($value['status']) {
                            case 0:
                                echo '<span class="label label-default">Waitting</span>';
                                break;
                            case 1:
                                echo '<span class="label label-info">Active</span>';
                                break;
                            case 2:
                                echo '<span class="label label-success">Finish</span>';
                                break;
                            case 3:
                                echo '<span class="label label-danger">Report</span>';
                                break;
                            } ?></td>
                  <td data-title="Time remain" style="color:red" class="text-danger countdown" data-countdown="<?php
                                  if(intval($value['status']) === 0 ){
                                    echo $value['date_finish_forAdmin'];
                                  }
                                  if(intval($value['status']) === 1 ){
                                    echo $value['date_finish'];
                                  }
                                  if(intval($value['status']) === 2 ){
                                    echo $value['date_finish_r_wallet'];
                                  }
                              ?>">
                            </td>
                             <?php if(intval($value['status']) === 0) { ?>
                      <td data-title="Action">
                       
                          <a class="label <?php switch ($value['status']) {
                        case 0:
                            echo 'label-default';
                            break;
                        case 1:
                            echo 'label-info';
                            break;
                        case 2:
                            echo 'label-success';
                            break;
                        case 3:
                            echo 'label-danger';
                            break;
                        } ?>" href="<?php echo intval($value['status']) == 0 ? $self -> url -> link('account/price/payconfirm', 'token='.$value["pd_number"].'', 'SSL') : 'javascript:;' ?>">Send BTC</a>
                       
                        </td>
                         <?php } 
                        ?> 
                       
                        
                      
                </tr>
                <?php $tmp++; endforeach; ?>
              </tbody>
            </table>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    
  
</div>
<!-- / #content-wrapper -->
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create Investment successfull !!!');
   }
   
</script>
<?php echo $self->load->controller('common/footer') ?>