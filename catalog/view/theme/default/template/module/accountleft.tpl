<?php $route = $self -> request -> get['route']; ?>
 <?php if ($route === 'account/personal/add_customer'){ echo '';} else{ ?>
 <div id="main-menu" role="navigation">
    <div id="main-menu-inner">
      <div class="menu-content top" id="menu-content-demo">
      </div>
      <ul class="navigation">
        <li class="<?php echo $route === 'account/dashboard' ? "active" : ''  ?>">
          <a href="<?php echo $self -> url -> link('account/dashboard', '', 'SSL'); ?>"><i class="menu-icon fa fa-dashboard"></i><span class="mm-text"><?php echo $lang['dashboard']; ?></span></a>
        </li>
        <!--  <li class="mm-dropdown <?php echo $route === 'account/price' || $route === 'account/price/create' || $route === 'account/price/payconfirm' || $route === 'account/price/show_invoice' ? "active open" : ''  ?>">
          <a href="<?php echo $self -> url -> link('account/price', '', 'SSL'); ?>"><i class="menu-icon fa fa-shopping-cart"></i><span class="mm-text"><?php echo $lang['provideDonation']; ?></span></a>
          <ul> -->
          
           
            <li class="<?php echo $route === 'account/price/create' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/price/create', '', 'SSL'); ?>"><i class="menu-icon fa fa-shopping-cart"></i><span class="mm-text"><?php echo $lang['provideDonation']; ?></span></a>
            </li>
              <li class="<?php echo $route === 'account/price' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/price', '', 'SSL'); ?>"><i class="menu-icon fa fa-shopping-cart"></i><span class="mm-text"><?php echo $lang['detail_investment']; ?></span></a>
            </li>
       <!--    </ul>
        </li> -->
        <!--  <li class="<?php echo $route === 'account/gd' ? "active" : ''  ?>">
          <a href="<?php echo $self -> url -> link('account/gd', '', 'SSL'); ?>"><i class="menu-icon fa fa-check-square"></i><span class="mm-text"><?php echo $lang['getDonation'] ?></span></a>
         
        </li> -->
        
       
   
        
       
        
        
        
            <li class="<?php echo $route === 'account/refferal' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/refferal', '', 'SSL'); ?>"><i class="menu-icon fa fa-users"></i><span class="mm-text"><?php echo $lang['Refferal(S)'] ?></span></a>
            </li>
            <li class="<?php echo $route === 'account/personal' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/personal', '', 'SSL'); ?>"><i class="menu-icon fa fa-sitemap"></i><span class="mm-text"><?php echo $lang['downlineTree'] ?></span></a>
            </li>
          <li class="<?php echo $route === 'account/personalx' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/personalx', '', 'SSL'); ?>"><i class="menu-icon fa fa-sitemap"></i><span class="mm-text"><?php echo $lang['downlineTreey'] ?></span></a>
            </li>
          
       <!--  <li class="mm-dropdown <?php echo $route === 'account/my_support_tickets' || $route === 'account/my_support_tickets/submit_a_ticket' ? "active open" : ''  ?>">
          <a href="#"><i class="menu-icon fa fa-users"></i><span class="mm-text">Support Desk</span></a>
          <ul>
            <li class="<?php echo $route === 'account/my_support_tickets' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/my_support_tickets', '', 'SSL'); ?>"><span class="mm-text"> My Support Tickets</span></a>
            </li>
            <li class="<?php echo $route === 'account/my_support_tickets/submit_a_ticket' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/my_support_tickets/submit_a_ticket', '', 'SSL'); ?>"><span class="mm-text">Submit a Ticket</span></a>
            </li>
          </ul>
        </li> -->
         <li class=" <?php echo $route === 'account/transaction_history' ? "active open" : ''  ?>">
          <a href="<?php echo $self -> url -> link('account/transaction_history', '', 'SSL'); ?>"><i class="menu-icon fa fa-users"></i><span class="mm-text"><?php echo $lang['Transaction'] ?></span></a>
   
        </li>
        <li class="<?php echo $route === 'account/setting' || $route === 'account/change_password' || $route === 'account/change_security_pin' || $route === 'account/upload_kyc_documents' || $route === 'account/account_linking' ? "active open" : ''  ?>">
          <a href="<?php echo $self -> url -> link('account/setting', '', 'SSL'); ?>"><i class="menu-icon fa fa-check-square"></i><span class="mm-text"><?php echo $lang['proFile'] ?></span></a>
         
        </li>
        <li>
          <a href="<?php echo $self -> url -> link('account/logout', '', 'SSL'); ?>"><i class="menu-icon fa fa-power-off"></i><span class="mm-text"><?php echo $lang['logout'] ?></span></a>
        </li>
        
      </ul> 
    </div> 
  </div>
  <?php } ?>