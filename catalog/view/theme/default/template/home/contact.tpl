<!Doctype html>
<html xmlns="http://www.w3.org/1999/html">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <title>ĐẦU TƯ TÀU BIỂN</title>

    <script src="catalog/view/theme/default/fre/javascript/jquery-2.2.3.min.js"></script>
    <script src="catalog/view/theme/default/fre/javascript/modal/jquery.arcticmodal-0.3.min.js"></script>
    <script src="catalog/view/theme/default/fre/javascript/scripts.js"></script>
    <script src="catalog/view/theme/default/fre/javascript/func.js"></script>

    <link rel="stylesheet" href="catalog/view/theme/default/fre/stylesheet/styles.css" type="text/css">
    <link rel="stylesheet" href="catalog/view/theme/default/fre/stylesheet/modal/jquery.arcticmodal-0.3.css">
    <link rel="stylesheet" href="catalog/view/theme/default/fre/stylesheet/modal/themes/simple.css">
    <link type="image/x-icon" rel="shortcut icon" href="catalog/view/theme/default/fre/images/favicon.ico"/>


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, intial-scale=1">
    
<meta name="keywords" content="investment" />
<meta name="description" content="investment" /> 

    <base >

     
</head>
<body>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-80541744-3', 'auto');
  ga('send', 'pageview');

</script> 


 

    <header>
        <div id='top_bar'>
            <div class='wrapper justify'>
                <!-- <div id='language'>Ngôn ngữ trang web - Tiếng Việt 
                    <span class='font_awesome'></span>
                    <ul id='language_popup'>
                         
                            <li>
                                <a class='current_language' ><img src='catalog/view/theme/default/fre/images/vi.jpg'>Tiếng Việt 
                                </a></li>
                         
                            <li>
                                <a href="#"><img src='catalog/view/theme/default/fre/images/en.jpg'>English 
                                </a></li>
                         
                    </ul>
                </div> -->
                <!-- <div id='top_bar_action_wrap'>
                     
                         
                        <div id='top_bar_action_text'>Trang Tin Tức đã được dich sang tiếng Việtnam 
                            <a href='news/6.html'>Đọc...</a></div>
                     
                </div> -->
                <div id='socials'>
                    <a class='font_awesome' title="Skype chat" href="#" target="_blank"> </a>
                    <a class='font_awesome' title="Twitter" href="#" target="_blank"></a>
                    <a class='font_awesome' title="Vkontakte" href="#" target="_blank"></a>
                    <a class='font_awesome' title="Facebook" href='#' target="_blank"></a>
                    <a class='font_awesome' title="Telegram" href='#' target="_blank"> </a>
                </div>
                <div id='authorization'>
                     
                      <div class="account_link">
                             <a href='<?php echo $self -> url -> link('account/login', '', 'SSL'); ?>'>Đăng nhập</a></div>
                       
                     
                </div>
            </div>
        </div>
        <div id='nav_wrap'>
            <div class='wrapper justify'>
               <a id='logo' href='<?php echo $self -> url -> link('home/page', '', 'SSL'); ?>'>
                <!-- <img src='catalog/view/theme/default/fre/images/logo.png'> -->
               HUNGTHINHPHATCORP.COM
            </a>
                <div id='phone_menu' class='font_awesome'></div>
                <script>
                    $(document).ready(function () {
                        $('#phone_menu').click(function () {
                            $('header nav').slideToggle();
                        });
                    });
                </script>
                <nav>
                    <ul id="navbar_list">
                        <li>
                            <a class="<?php echo $route === 'home/page/news' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/news', '', 'SSL'); ?>">Tin tức</a>
                        </li>
                         
                        <li >
                            <a class="<?php echo $route === 'home/page/project' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/project', '', 'SSL'); ?>">Các dự án của chúng tôi</a>
                        </li>
                         <li >
                            <a class="<?php echo $route === 'home/page/faq' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/faq', '', 'SSL'); ?>">Hỏi và đáp</a>
                        </li>
                         <li>
                            <a class="<?php echo $route === 'home/page/about' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/about', '', 'SSL'); ?>">Giới thiệu về công ty</a>
                        </li>
                         
                         <li>
                            <a class="<?php echo $route === 'home/page/parther' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/parther', '', 'SSL'); ?>">Chương trình liên kết</a>
                        </li>
                        <li>
                            <a class="<?php echo $route === 'home/page/contact' ? "active_page " : ''  ?>" href="<?php echo $self -> url -> link('home/page/contact', '', 'SSL'); ?>">Liên hệ</a>
                        </li>
                    
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <script language="JavaScript">
        var active_href = '';
        if (active_href == '') active_href = window.location.pathname;
        $("#navbar_list a[href='" + active_href + "']").addClass("active_page");
    </script>

 
    <div style="display: none;">
        <div class="box-modal" id="auth_modal">
            <div class="box-modal_close arcticmodal-close font_awesome"> </div>
             
<form method="POST" action="#" formcacher >
    <div style="margin-top:15px">
        <div class='form_input'>
            <input name="user_login" type="text" placeholder="Đăng nhập *">
        </div>
        <div class='form_input'>
            <input name="user_pass" type="password" placeholder="Mật khẩu *">
        </div>
        <button class="form_button" type="submit">Đăng nhập</button>
        <button class="form_button" type="button" style="background-color: orange;float:right" onclick="#';">Tôi quên mật khẩu của mình</button>
    </div>
</form> 
        </div>
    </div>
 


 





 
    <div id='contacts_header'>
        <div class='wrapper'>
            <h1 id='inner_page_title'>Phản hồi</h1>
             
                <p>Công ty CÔNG TY TNHH SX TM VẬN TẢI BIỂN HƯNG THỊNH PHÁT hoạt động trong lĩnh vực đóng tàu vận tải biển quốc tế. Bằng việc làm việc với chúng tôi bạn luôn có thể chắc chắn về sự thành công của các khoản đầu tư của mình.</p>
             
        </div>
    </div>
 



 

<div id='inner_page_content'>
    <div class='wrapper'>
        <div id='contacts' class='justify'>
            <div class='contact_block'>
                <div class='contact_left_side'>
                    <img alt='' src='catalog/view/theme/default/fre/images/address.png'>
                </div>
                <div class='contact_right_side'>
                    <span><b>Địa chỉ</b></span>
                    <span>Số 8 Mỹ Phú 2C, Khu Mỹ Phú 2, P. Tân Phú, Q.7, TP.HCM</span>
                    <span>Vietnamese</span>
                </div>
            </div>
            <div class='contact_block' style="width: 248px">
                <div class='contact_left_side'>
                    <img alt='' src='catalog/view/theme/default/fre/images/email.png'>
                </div>
                <div class='contact_right_side' style="margin-left: 15px">
                    <span><b>Email</b></span>
                    <span>hungthinhphat290816@gmail.com</span>
                </div>
            </div>
            <div class='contact_block'>
                <div class='contact_left_side'>
                    <img alt='' src='catalog/view/theme/default/fre/images/phone.png'>
                </div>
                <div class='contact_right_side'>
                    <span><b>Điện thoại</b></span>
                    <span>+84 903 068 199</span>
                   
                </div>
            </div>
            <div class='contact_block'>
                <div class='contact_left_side'>
                    <img alt='' src='catalog/view/theme/default/fre/images/time.png'>
                </div>
                <div class='contact_right_side'>
                    <span><b>Dịch vụ Hỗ trợ</b></span>
                    <span>Thứ 2 - Thứ 6</span>
                </div>
            </div>
        </div>
        <h2>Bạn có thể gửi tin nhắn cho chúng tôi</h2>
        <form method="POST" formcacher >
            <div id="contact_input_block" class='justify'>
                <input name='user_login' type="text" placeholder='Tên bạn' required value="">
                <input name='user_email' type="text" placeholder='Email của bạn' required>
                <button id='contacts_send_info' type="submit">Gửi tin nhắn</button>
            </div>
            <textarea name='text' required ></textarea>
         
            <div style="clear:both"></div>
        </form>
    </div>
</div>

<script>
    $(document).ready(function ()
    {

        $('.contact_block').eq(0).css({'transition-delay':'1.5s','transform':'scale(1)'});
        $('.contact_block').eq(1).css({'transition-delay':'1.75s','transform':'scale(1)'});
        $('.contact_block').eq(2).css({'transition-delay':'2s','transform':'scale(1)'});
        $('.contact_block').eq(3).css({'transition-delay':'2.25s','transform':'scale(1)'});
        $('#faq_content h2 + p, #inner_page_content form').css({'transform':'translate3d(0px,0px,0px)'});
    });
</script> 


<div  id='inner_page_map_screen'>
    <div class='wrapper'>
        <span class='company_name'>CÔNG TY TNHH SX TM VẬN TẢI BIỂN HTP</span>
        <div class='title_divider'></div>
        <h2>Liên hệ</h2>
    </div>


     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYpNL7q1nL29FafMzm9mlmxDLbM8EnPGA"></script>
                    <script language="JavaScript">
                        var map;
                        egglabs = new google.maps.LatLng(10.717768, 106.727672);
                        mapCoordinates = new google.maps.LatLng(10.717768, 106.727672);
                        var marker = new google.maps.Marker({
                            position: egglabs,
                            map: map
                        });
                        function addMarker(feature) {
                            var marker = new google.maps.Marker({
                                position: egglabs,
                                map: map
                            });
                        }
                        function initialize()
                        {
                            var mapOptions = {
                                backgroundColor: "#ffffff",
                                zoom: 18,
                                disableDefaultUI: true,
                                center: mapCoordinates,
                                mapTypeId: google.maps.MapTypeId.ROADMAP,
                                scrollwheel: false
                            };
                            map = new google.maps.Map(document.getElementById('map'),mapOptions);
                            addMarker();
                        }
                        google.maps.event.addDomListener(window, 'load', initialize);
                    </script>
                    <div id='map'>
                    </div> 


    <script type="text/javascript">

        $(document).ready(function ()
        {

            $('#inner_page_title, #inner_page_title + p, #inner_page_content h3, #regal_page_content h3').css({'transform':'scale(1)'});
            $('#regal_page_content form').css({'transform':'translate3d(0px, 0px, 0px)'});

            $(window).scroll(function ()
            {
                var scrolled = $(window).scrollTop();
                var screen_eight_pos = $('#inner_page_map_screen').offset().top;
                if (scrolled >= screen_eight_pos-1000)
                {
                    $('#inner_page_map_screen .company_name, #inner_page_map_screen .title_divider, #inner_page_map_screen h2').css({'transform':'scale(1)'});
                }
            });

        });

        $( document ).ajaxStart(function() {
            callModal("#ajaxLoading",false,{closeOnEsc: false,closeOnOverlayClick: false});
        }).ajaxStop(function(){
            callModal("#ajaxLoading",true);
        });


    </script>

</div>
<footer>
    <div class='wrapper'>
        <div>CÔNG TY TNHH TM SX VẬN TẢI BIỂN HƯNG THỊNH PHÁT</div>
        <div>Số 8 Mỹ Phú 2C, Khu Mỹ Phú 2, P. Tân Phú, Q.7, TP.HCM</div>
        <span>©  2016. All Rights Reserved.</span>
        <!-- <div id='payment'></div> -->
    </div>
</footer>

<div style="display: none;">
    <div class="box-modal" id="ajaxLoading" style="padding: 30px 20px;">
        <h2>Tải xuống</h2>
        <div align='center'>
            <img src="catalog/view/theme/default/fre/images/loading.gif">
        </div>
    </div>
</div>

<!-- Start SiteHeart code -->


</body>

</html>