<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Đăng Ký Thành Viên</h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">Đăng Ký Thành Viên</h3>
    
    </div>
    <div class="panel-body">
      <form action="<?php echo $action_dangky; ?>" method="POST" role="form">
        
      
      <div class="col-md-6">
        <div class="form-group">
          <label for="">Họ và tên</label>
          <input type="text" class="form-control" name="firstname" id="firstname" placeholder="Họ và tên">
          <span id="firstname-error" class="text-danger" style="display:none;">
              <span id="firstname-error">Please enter Full Name</span>
          </span>
        </div>
        <div class="form-group">
          <label for="">Địa chỉ</label>
          <input type="text" class="form-control" name="address" id="address" placeholder="Địa chỉ">
          <span id="address-error" class="text-dangerr" style="display: none;">
           <span id="address-error">Please enter Address</span>
           </span>
        </div>
        <div class="form-group">
          <label for="">Email</label>
          <input type="text" class="form-control" id="email" name="email" placeholder="Email">
           <span id="email-error" class="text-danger" style="display: none;">
           <span id="Email-error">Please enter Email Address</span>
           </span>
        </div>
        <div class="form-group">
          <label for="">Số điện thoại</label>
          <input type="text" class="form-control" name="telephone" id="phone" placeholder="Số điện thoại">
           <span id="phone-error" class="text-danger" style="display: none;">
           <span>Please enter Phone Number</span>
           </span>
        </div>
        <div class="form-group">
          <label for="">Số CMND</label>
          <input type="text" class="form-control" id="cmnd" name="cmnd" placeholder="Số CMND">
          <span id="cmnd-error" class="text-danger" style="display: none;">
           <span id="CardId-error">The Citizenship card/passport no field is required.</span>
           </span>
        </div>
        <div class="form-group">
          <label for="">Mật khẩu</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu">
           <span id="password-error" class="text-danger" style="display: none;">
           <span>Please enter password for login</span>
           </span>
        </div> 
        <div class="form-group">
          <label for="">Nhập lại mật khẩu</label>
          <input type="password" class="form-control" id="confirmpassword" placeholder="Nhập lại mật khẩu">
          <span id="confirmpassword-error" class="text-danger" style="display: none;">
           <span>Repeat Password For Login not correct</span>
           </span>
        </div>      
        
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="">Tên tài khoản</label>
          <input type="text" class="form-control" name="account_holder" id="Accountholders" placeholder="Tên tài khoản">
          <span id="Accountholders-error" class="text-danger">
            <span></span>
          </span>
        </div>
        <div class="form-group">
          <label for="">Số tài khoản</label>
          <input type="text" class="form-control" id="Accountnumber" name="account_number" placeholder="Số tài khoản">
          <span id="Accountnumber-error" class="field-validation-error">
              <span></span>
          </span>
        </div>
        <div class="form-group">
          <label for="">Ngân hàng</label>
          <input type="text" class="form-control" id="Bankname" name="bank_name" placeholder="Ngân hàng">
          <span id="Bankname-error" class="field-validation-error">
              <span></span>
          </span>
        </div>
        <div class="form-group">
          <label for="">Chi nhánh</label>
          <input type="text" class="form-control" id="Branchbank" name="branch_bank" placeholder="Chi nhánh">
          <span id="Branchbank-error" class="field-validation-error">
              <span></span>
          </span>
        </div>
        <div class="form-group">
          <label for="">Người bảo trợ</label>
          <input type="text" class="form-control" id="p_node" name="p_node" placeholder="Người bảo trợ">
           <span id="p_node-error" class="field-validation-error">
              <span></span>
          </span>
        </div>
        <div class="form-group">
          <label for="">Nhánh</label>
          <input type="text" class="form-control" id="p_binary" name="p_binary" placeholder="Nhánh">
          <span id="p_binary-error" class="field-validation-error">
              <span></span>
          </span>
        </div>
        <div class="form-group">
          <label for="">Vị trí</label>
          <select name="postion" id="postion" class="form-control" required="required">
            <option value="">Chọn vị trí</option>
            <option value="left">Trái</option>
            <option value="right">Phải</option>
          </select>
        </div>
        <div class="form-group">
          <label for="">Gói đầu tư</label>
          <select name="investment" id="investment" class="form-control" required="required">
            <option value="">Chọn gói đầu tư</option>
            <option value="5000000">5,000,000 VNĐ</option>
            <option value="20000000">20,000,000 VNĐ</option>
            <option value="50000000">50,000,000 VNĐ</option>
            <option value="100000000">100,000,000 VNĐ</option>
            <option value="500000000">500,000,000 VNĐ</option>
            <option value="1000000000">1,000,000,000 VNĐ</option>
          </select>
        </div>
      </div>
      <div class="col-md-6 col-md-offset-5">
         <div class="form-group">
            <button type="submit" class="btn btn-primary">Đăng Ký</button>
          </div>
      </div>
      </form>
      
    </div>
  </div>
</div>

<?php echo $footer; ?>