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

 
    <div id='partners_header'>
        <div class='wrapper'>
            <h1 id='inner_page_title'>Giới thiệu về chúng tôi</h1>
             
                <p>Công ty CÔNG TY TNHH SX TM VẬN TẢI BIỂN HƯNG THỊNH PHÁT hoạt động trong lĩnh vực đóng tàu vận tải biển quốc tế. Bằng việc làm việc với chúng tôi bạn luôn có thể chắc chắn về sự thành công của các khoản đầu tư của mình.</p>
             
        </div>
    </div>
 



<div>
     
    <noscript><div class="alert alert-danger">
    <span class="font_awesome"> </span> Investment <a href='#' target=_blank >Investment</a> 
</div></noscript>
</div>


<div id='about_screen'>
    <div id='timeline_wrap'>
        <div class='wrapper'>
            <div class="screen_two_image">
            <img alt="" src="catalog/view/theme/default/fre/images/cn.jpg" style="opacity: 1;">
        </div>
            <div id='timeline_slider'>
                <div class='timeline_slide'>
                    <!-- <div class='timeline_left_side' style="margin: 0 auto;display: block;width: 70%">
                        <h2>since <i>2006</i></h2>
                        <span>Chúng tôi đã bắt đầu công việc kinh doanh của chính mình</span>
                        <p>Các nhân viên có ít nhất 5 năm kinh nghiệm làm việc trong tiểu bang của chúng tôi. Tất cả trong số họ là những sinh viên tốt nghiệp từ các trường đại học tốt nhất trên thế giới. Hơn thế nữa,  tất cả những người quản lý của chúng tôi đều có bằng MBA (Thạc Sỹ Quản trị Kinh doanh)uy tín và điều này có nghĩa là tất cả trong số họ đều có kinh nghiệm làm việc dày dặn và được đào tạo nâng cao về kinh doanh.</p>

                        <div>
Công ty của chúng tôi đánh giá cao danh tiếng của chính mình. Do đó, bạn có thể chắc chắn rằng... 

                            <ul>
                                <li>những nhân viên có kinh nghiệm chỉ chọn các đối tượng đáng tin cậy nhất để đầu tư</li>
                                <li>mọi bất động sản đều được đảm bảo</li>
                                <li>Luật sư của công ty đều cân nhắc tất cả các luật pháp địa phương và bảo vệ các quyền của nhà đầu tư</li>
                            </ul>

                        </div>

                        <p>
                            Các chuyên gia của chúng tôi liên tục theo dõi thị trường bất động sản ở các quốc gia trên toàn thế giới. Họ cũng theo dõi các xu hướng du lịch và phân tích thông tin để tìm ra các đối tượng mang lại lợi nhuận nhiều nhất để đầu tư. 
                        </p>
                    </div>
 -->
                </div>

                 
            </div>
            <div id='timeline'>
                <div id='timeline_pagination'>
                </div>
                <div id='time_line'></div>
            </div>
        </div>
    </div>
    <script>
        $(window).resize(function ()
        {
            var clientWidth = $(document).width();
            if (clientWidth <= 1170)
            {
                $('.timeline_slide, .timeline_right_side').css({width:clientWidth-(clientWidth*9/100)});
                var timeline_pagination_count = $('.timeline_pagination').size();
                var timeline_pagination_width = timeline_pagination_count*16;
                var wrapperWidth = clientWidth-clientWidth*10/100;
                $('.timeline_pagination').css({'margin-left':((wrapperWidth-timeline_pagination_width-50)/timeline_pagination_count)/2,'margin-right':((wrapperWidth-timeline_pagination_width)/timeline_pagination_count)/2});
            }
            else
            {
                $('.timeline_slide').css({width:1170});
            }
        });
        $(document).ready(function ()
        {
            var clientWidth = $(document).width();
            if (clientWidth <= 1170)
            {
                $('.timeline_slide, .timeline_right_side').css({width:clientWidth-(clientWidth*9/100)});
            }
            
            var timeline_slide_size = $('.timeline_slide').size();
            for (var i=0; i<timeline_slide_size; i++)
            {
                var year = $('.timeline_slide').eq(i).find('h2 i').text();
                $("<div class='timeline_pagination' title="+year+"/>").appendTo('#timeline_pagination');
            }
            if (clientWidth <= 1170)
            {
                var timeline_pagination_count = $('.timeline_pagination').size();
                var timeline_pagination_width = timeline_pagination_count*16;
                var wrapperWidth = clientWidth-clientWidth*10/100;
                $('.timeline_pagination').css({'margin-left':((wrapperWidth-timeline_pagination_width-40)/timeline_pagination_count)/2,'margin-right':((wrapperWidth-timeline_pagination_width)/timeline_pagination_count)/2});
            }
            $('.timeline_pagination:last').addClass('active_timeline');
            $('html').on('click','.timeline_pagination', function()
            {

                return;

                var index = $(this).index();
                $('.active_timeline').removeClass('active_timeline');
                $(this).addClass('active_timeline');
                var block_width = $('.timeline_slide').outerWidth();
                $('#timeline_slider').animate({'left':-block_width*index}, 1000);
            });
        });
    </script>
    <div class='wrapper'>
        <b>Tên công ty: </b><span>CÔNG TY TNHH SX TM VẬN TẢI BIỂN HTP</span><br>
        <div style="display: inline-block;vertical-align: top"><b>Địa chỉ:</b></div>
        <div style="display: inline-block"><span class="about_spaned">Số 8 Mỹ Phú 2C, Khu Mỹ Phú 2, P. Tân Phú, Q.7, TP.HCM</span></div>
    </div>
</div>
<div id='about_partners'>
    <div class='wrapper justify'>
        <img alt='' src='catalog/view/theme/default/fre/images/mcafee.png'>
        <img alt='' src='catalog/view/theme/default/fre/images/norton.png'>
        <img alt='' src='catalog/view/theme/default/fre/images/avg.png'>
        <img alt='' src='catalog/view/theme/default/fre/images/antiddos.png'>
        <img alt='' src='catalog/view/theme/default/fre/images/site_lock.png'>
        <img alt='' src='catalog/view/theme/default/fre/images/ddos_guard.png'>
    </div>
</div> 


<div  id='inner_page_map_screen'>
    <div class='wrapper'>
        <span class='company_name'>CÔNG TY TNHH SX TM VẬN TẢI BIỂN HTP</span>
        <div class='title_divider'></div>
        <h2>&nbsp;</h2>
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
