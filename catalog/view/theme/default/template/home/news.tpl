 <!Doctype html>
<html xmlns="http://www.w3.org/1999/html">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <title>ĐẦU TƯ TÀU BIỂN</title>

    <script src="catalog/view/theme/default/fre/javascript/jquery-2.2.3.min.js"></script>
    <script src="catalog/view/theme/default/fre/javascript/modal/jquery.arcticmodal-0.3.min.js"></script>
    <script src="catalog/view/theme/default/fre/javascript/scripts.js"></script>
    <script src="catalog/view/theme/default/fre/javascript/func.js"></script>
    <link rel="stylesheet" href="catalog/view/theme/default/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="catalog/view/theme/default/css/lightgallery.css" type="text/css">
    <link rel="stylesheet" href="catalog/view/theme/default/fre/stylesheet/styles.css" type="text/css">
    <link rel="stylesheet" href="catalog/view/theme/default/fre/stylesheet/modal/jquery.arcticmodal-0.3.css">
    <link rel="stylesheet" href="catalog/view/theme/default/fre/stylesheet/modal/themes/simple.css">
    <link type="image/x-icon" rel="shortcut icon" href="catalog/view/theme/default/fre/images/favicon.ico"/>
    
    <script src="catalog/view/javascript/lightgallery.js"></script>
    <script src="catalog/view/javascript/jquery.lazyloadxt.js"></script>
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


        <script type="text/javascript">
        $(document).ready(function(){
            $('#lightgallery').lightGallery();
        });
        </script>

 

    <header>
        <div id='top_bar'>
            <div class='wrapper justify'>
                
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
            <h1 id='inner_page_title'>Tin tức trang web</h1>
             
                <p>Công ty CÔNG TY TNHH SX TM VẬN TẢI BIỂN HƯNG THỊNH PHÁT hoạt động trong lĩnh vực đóng tàu vận tải biển quốc tế. Bằng việc làm việc với chúng tôi bạn luôn có thể chắc chắn về sự thành công của các khoản đầu tư của mình.</p>
             
        </div>
    </div>
<div>
     
    <noscript><div class="alert alert-danger">
    <span class="font_awesome"> </span> Investment <a href='#' target=_blank >Investment</a> 
</div></noscript>
</div>

 



<script>
    $(document).ready(function ()
    {
        $('.news_block').css({'transform':'scale(1)'});
    });
</script>

 
 


<div  id='inner_page_map_screen'>
    <div class='wrapper'>
        <span class='company_name'>PROMOTION TRAO VÀNG CHO QUÝ NHÀ ĐẦU TƯ</span>
        <div class='title_divider'></div>
        <h2>&nbsp;</h2>
    </div>
    <div class="clearfix" style="margin-top:40px;"></div>
    <style type="text/css">
        #lightgallery li{
            margin-bottom: 15px;
        }
    </style>
    <div class="wrapper">
        <div class="demo-gallery">
            <ul id="lightgallery" class="list-unstyled row">
                <li class="col-xs-6 col-sm-4 col-md-4" data-responsive="catalog/view/theme/default/images/promotion/DSC_1074.JPG" data-src="catalog/view/theme/default/images/promotion/DSC_1074.JPG" data-sub-html="<h4>Promotion trao vàng</h4><p>Đại hội của đầu tháng 10.</p>">
                    <a href="">
                        <img class="img-responsive" src="catalog/view/theme/default/images/promotion/DSC_1074.JPG">
                    </a>
                </li>
               <li class="col-xs-6 col-sm-4 col-md-4" data-responsive="catalog/view/theme/default/images/promotion/DSC_1075.JPG" data-src="catalog/view/theme/default/images/promotion/DSC_1075.JPG" data-sub-html="<h4>Promotion trao vàng</h4><p>Đại hội của đầu tháng 10.</p>">
                    <a href="">
                        <img class="img-responsive" src="catalog/view/theme/default/images/promotion/DSC_1075.JPG">
                    </a>
                </li>
                <li class="col-xs-6 col-sm-4 col-md-4" data-responsive="catalog/view/theme/default/images/promotion/DSC_1077.JPG" data-src="catalog/view/theme/default/images/promotion/DSC_1077.JPG" data-sub-html="<h4>Promotion trao vàng</h4><p>Đại hội của đầu tháng 10.</p>">
                    <a href="">
                        <img class="img-responsive" src="catalog/view/theme/default/images/promotion/DSC_1077.JPG">
                    </a>
                </li>
                <li class="col-xs-6 col-sm-4 col-md-4" data-responsive="catalog/view/theme/default/images/promotion/DSC_1079.JPG" data-src="catalog/view/theme/default/images/promotion/DSC_1079.JPG" data-sub-html="<h4>Promotion trao vàng</h4><p>Đại hội của đầu tháng 10.</p>">
                    <a href="">
                        <img class="img-responsive" src="catalog/view/theme/default/images/promotion/DSC_1079.JPG">
                    </a>
                </li>
                <li class="col-xs-6 col-sm-4 col-md-4" data-responsive="catalog/view/theme/default/images/promotion/DSC_1083.JPG" data-src="catalog/view/theme/default/images/promotion/DSC_1083.JPG" data-sub-html="<h4>Promotion trao vàng</h4><p>Đại hội của đầu tháng 10.</p>">
                    <a href="">
                        <img class="img-responsive" src="catalog/view/theme/default/images/promotion/DSC_1083.JPG">
                    </a>
                </li>
                <li class="col-xs-6 col-sm-4 col-md-4" data-responsive="catalog/view/theme/default/images/promotion/DSC_1088.JPG" data-src="catalog/view/theme/default/images/promotion/DSC_1088.JPG" data-sub-html="<h4>Promotion trao vàng</h4><p>Đại hội của đầu tháng 10.</p>">
                    <a href="">
                        <img class="img-responsive" src="catalog/view/theme/default/images/promotion/DSC_1088.JPG">
                    </a>
                </li>
               
                <li class="col-xs-6 col-sm-4 col-md-4" data-responsive="catalog/view/theme/default/images/promotion/DSC_1095.JPG" data-src="catalog/view/theme/default/images/promotion/DSC_1095.JPG" data-sub-html="<h4>Promotion trao vàng</h4><p>Đại hội của đầu tháng 10.</p>">
                    <a href="">
                        <img class="img-responsive" src="catalog/view/theme/default/images/promotion/DSC_1095.JPG">
                    </a>
                </li>
                <li class="col-xs-6 col-sm-4 col-md-4" data-responsive="catalog/view/theme/default/images/promotion/DSC_1096.JPG" data-src="catalog/view/theme/default/images/promotion/DSC_1096.JPG" data-sub-html="<h4>Promotion trao vàng</h4><p>Đại hội của đầu tháng 10.</p>">
                    <a href="">
                        <img class="img-responsive" src="catalog/view/theme/default/images/promotion/DSC_1096.JPG">
                    </a>
                </li>
                
                <li class="col-xs-6 col-sm-4 col-md-4" data-responsive="catalog/view/theme/default/images/promotion/DSC_1117.JPG" data-src="catalog/view/theme/default/images/promotion/DSC_1117.JPG" data-sub-html="<h4>Promotion trao vàng</h4><p>Đại hội của đầu tháng 10.</p>">
                    <a href="">
                        <img class="img-responsive" src="catalog/view/theme/default/images/promotion/DSC_1117.JPG">
                    </a>
                </li>
                
            </ul>
        </div>

    </div>

    <script>
    $(window).on('ajaxComplete', function() {
        setTimeout(function() {
            $(window).lazyLoadXT();
        }, 50);
    });
    </script>
     


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
