<?php $route = $self -> request -> get['route']; ?>
 <?php if ($route === 'account/personal/add_customer'){ echo '';} else{ ?>
 <div id="main-menu" role="navigation">
    <div id="main-menu-inner">
      <div class="menu-content top" id="menu-content-demo">
      </div>
      <ul class="navigation">
        <li class="<?php echo $route === 'account/dashboard' ? "active" : ''  ?>">
          <a href="<?php echo $self -> url -> link('account/dashboard', '', 'SSL'); ?>"><i class="menu-icon fa fa-dashboard"></i><span class="mm-text">Dashboard</span></a>
        </li>
         <li class="mm-dropdown <?php echo $route === 'account/price' || $route === 'account/price/create' || $route === 'account/price/payconfirm' || $route === 'account/price/show_invoice' ? "active open" : ''  ?>">
          <a href="<?php echo $self -> url -> link('account/price', '', 'SSL'); ?>"><i class="menu-icon fa fa-shopping-cart"></i><span class="mm-text">Investment Plans</span></a>
          <ul>
            <li class="<?php echo $route === 'account/price' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/price', '', 'SSL'); ?>"><span class="mm-text">Investment Plans Details</span></a>
            </li>
           
            <li class="<?php echo $route === 'account/price/create' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/price/create', '', 'SSL'); ?>"><span class="mm-text">Create Investment</span></a>
            </li>
          </ul>
        </li>
        <li class="mm-dropdown <?php echo $route === 'account/setting' || $route === 'account/change_password' || $route === 'account/change_security_pin' || $route === 'account/upload_kyc_documents' || $route === 'account/account_linking' ? "active open" : ''  ?>">
          <a href="<?php echo $self -> url -> link('account/personal_details', '', 'SSL'); ?>"><i class="menu-icon fa fa-check-square"></i><span class="mm-text">My Profile</span></a>
          <ul>
            <li class="<?php echo $route === 'account/setting' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/setting', '', 'SSL'); ?>"><span class="mm-text">Personal Details</span></a>
            </li>
           
            <li class="<?php echo $route === 'account/account_linking' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/setting', '', 'SSL'); ?>"><span class="mm-text">Account Linking</span></a>
            </li>
          </ul>
        </li>
        <li class="mm-dropdown <?php echo $route === 'account/transaction_history' || $route === 'account/loading_bank_transfer' || $route === 'account/loading_unionpay' || $route === 'account/withdrawal_request' || $route === 'account/internal_transfer' || $route === 'account/transfer_to_linked' || $route === 'account/exchange_cash_nx_coin' || $route === 'account/exchange_cash_opr' || $route === 'account/exchange_opr_cash' ? "active open" : ''  ?>">
          <a href=""><i class="menu-icon fa fa-users"></i><span class="mm-text">Accounting</span></a>
          <ul>
            <li class="<?php echo $route === 'account/transaction_history' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/transaction_history', '', 'SSL'); ?>"><span class="mm-text">Transaction History</span></a>
            </li>
            
           
          </ul>
        </li>
   
        
       
        <!-- <li class="mm-dropdown <?php echo $route === 'account/my_prepaid_card' ? "active open" : ''  ?>">
          <a href="#"><i class="menu-icon fa fa-desktop"></i><span class="mm-text">Prepaid Card</span></a>
          <ul>
            <li class="<?php echo $route === 'account/my_prepaid_card' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/my_prepaid_card', '', 'SSL'); ?>"><span class="mm-text">My Prepaid Card</span></a>
            </li>
          </ul>
        </li> -->
       <!--  <li class="mm-dropdown <?php echo $route === 'account/member_packages' || $route === 'account/my_event_tickets' || $route === 'account/product_activation' ? "active open" : ''  ?>">
          <a href="#"><i class="menu-icon fa fa-shopping-cart"></i><span class="mm-text">Webshop</span></a>
          <ul>
            <li class="<?php echo $route === 'account/member_packages' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/member_packages', '', 'SSL'); ?>"><span class="mm-text">Member Packages</span></a>
            </li>
            <li class="<?php echo $route === 'account/my_event_tickets' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/my_event_tickets', '', 'SSL'); ?>"><span class="mm-text">My Event Tickets</span></a>
            </li>
            <li class="<?php echo $route === 'account/product_activation' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/product_activation', '', 'SSL'); ?>"><span class="mm-text">Product Activation</span></a>
            </li>
          </ul>
        </li> -->
        
        <li class="mm-dropdown <?php echo $route === 'account/refferal' || $route === 'account/personal' ? "active open" : ''  ?>">
          <a href="#"><i class="menu-icon fa fa-sitemap">
            </i><span class="mm-text">Team Viewers</span></a>
          <ul>
            <li class="<?php echo $route === 'account/refferal' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/refferal', '', 'SSL'); ?>"><span class="mm-text">Refferal</span></a>
            </li>
            <li class="<?php echo $route === 'account/personal' ? "active" : ''  ?>">
              <a tabindex="-1" href="<?php echo $self -> url -> link('account/personal', '', 'SSL'); ?>"><span class="mm-text">Binary Team Viewer</span></a>
            </li>
          </ul>
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
        <li>
          <a href="<?php echo $self -> url -> link('account/logout', '', 'SSL'); ?>"><i class="menu-icon fa fa-power-off"></i><span class="mm-text">Logout</span></a>
        </li>
        
      </ul> 
    </div> 
  </div>
  <?php } ?>