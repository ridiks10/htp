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
            <h1 id='inner_page_title'>Câu trả lời cho các câu hỏi</h1>
             
                <p>Công ty CÔNG TY TNHH SX TM VẬN TẢI BIỂN HƯNG THỊNH PHÁT hoạt động trong lĩnh vực đóng tàu vận tải biển quốc tế
                    . Bằng việc làm việc với chúng tôi bạn luôn có thể chắc chắn về sự thành công của các khoản đầu tư của mình.</p>
             
        </div>
    </div>
 


<div>
     
    <noscript><div class="alert alert-danger">
    <span class="font_awesome"> </span> Investment <a href='#' target=_blank >Investment</a> 
</div></noscript>
</div>


<div id='faq_content'>
    <div class='wrapper'>

        <script>
            $(document).ready(function () {
                var faq_size = $('.faq_block').size();
                var col_elem = Math.ceil(faq_size / 2);
                var i = 0;
                $('.faq_block').each(function () {
                    if (i < col_elem) {
                        $(this).addClass('col_one');
                    }
                    else {
                        $(this).addClass('col_two');
                    }
                    i++;
                });
                $('.col_one').wrapAll("<div class='col'/>");
                $('.col_two').wrapAll("<div class='col'/>");
                $('.faq_title_text').click(function () {
                    if ($(this).hasClass('faq_isactive')) {
                        $(this).removeClass('faq_isactive');
                        $(this).parents('.faq_block').find('.faq_plus').text('+');
                        $(this).parents('.faq_block').find('.faq_text').slideUp();

                    }
                    else {
                        $(this).addClass('faq_isactive');
                        $(this).parents('.faq_block').find('.faq_plus').text('-');
                        $(this).parents('.faq_block').find('.faq_text').slideDown();
                    }
                });
            });
        </script>
        <div id='faq' class='justify'>
            <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Làm thế nào tôi có thể chắc chắn về việc đầu tư vào dự án của công ty? 
                </div>
                <div class='faq_text'>Chúng tôi có trên 10 năm kinh nghiệm đầu tư. Trong suốt thời gian này, chúng tôi đã tích lũy được một lượng kiến thức ở phạm vi lớn cho phép chúng tôi tăng số vốn cho các đối tác của mình. 
                </div>
            </div>
            <!-- <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Làm thế nào công ty có thể chứng minh rằng công ty đã ở trong lĩnh vực này trong 10 năm? 
                </div>
                <div class='faq_text'>Hãy nhìn vào thông tin đăng ký tên miền của chúng tôi. Chúng tôi đã đăng đăng ký tên miền này ngay từ khi bắt đầu thử sức mình. 
                </div>
            </div> -->
           <!--  <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Tại sao không có nhiều thông tin về công ty trên Internet trong những năm này? 
                </div>
                <div class='faq_text'>Ban đầu chúng tôi chỉ hoạt động để thu hút các khoản vay ngân hàng. Nhưng hiện nay chúng tôi bắt đầu "thèm khát" các khoản đầu tư. Do các ngân hàng không thể phát hành vốn cần thiết để chúng tôi có thể quản lý thành công nên chúng tôi đã quyết định làm việc với các đối tác và cá nhân..  . 
                </div>
            </div> -->
             
       <!--      <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Các thay đổi khác mà công ty đang có kế hoạch cho trang web của mình là gì? 
                </div>
                <div class='faq_text'>Bạn có thể theo dõi các kế hoạch phát triển trong phần "Tin tức" 
                </div>
            </div>
            <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Hãy cho tôi biết thêm về công ty 
                </div>
                <div class='faq_text'>Trong thời gian hoạt động của mình, chúng tôi đã tích lũy được rất nhiều kinh nghiệm trong lĩnh vực đầu tư bất động sản. Chúng tôi chuyên về bất động sản vùng nghĩ dưỡng trên toàn thế giới vì phân khúc này ít phát sinh vấn đề trong nền kinh thế thế giới. Trong phần "Các dự án của chúng tôi", bạn có thể làm quen với các dự án mà chúng tôi đã và đang tham gia. Hầu hết, đây là việc xây dựng các tổ hợp dân cư và bất động sản thương mại 
                </div>
            </div> -->
           <!--  <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Công ty kiếm thu nhập này bằng cách nào? 
                </div>
                <div class='faq_text'>Có nhiều cách. Một trong các phòng ban của công ty chúng tôi, ví dụ, làm việc về việc xây dựng đóng tàu vận tải biển. Trong quá trình xây dựng, nhà phát triển cung cấp giá thấp nhất để xây nhà và chung cư, và một hoặc hai năm sau khi xây dựng, những đối tượng này trở nên có giá trị hơn và được bán ra nhanh chóng ở mức giá cao hơn rất nhiều so với mức giá mà chúng được xây dựng? 
                </div>
            </div>
            <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Công ty có quan tâm đến các khoản ký quỹ nhỏ không? 
                </div>
                <div class='faq_text'>Tất nhiên là có, với các khoản ký quỹ nhỏ, chúng tôi mua các đối tượng không đắt đỏ và sau đó cho thuê ngay lập tức trong dài hạn hoặc chúng tôi bán lại chúng ở mức giá cao hơn. Bạn có thể đầu tư dù chỉ 10$ 
                </div>
            </div>
            <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Làm thế nào tôi có thể bổ sung thêm số dư trong tài khoản cá nhân của mình? 
                </div>
                <div class='faq_text'>Hiện tại, chúng tôi chấp nhận Perfect Money, AdvCash, Payeer, Bitcoin. Danh sách này tiện lợi cho 95% các nhà đầu tư. Nhưng nếu bạn có vấn đề - hãy viết thư cho chúng tôi và chúng tôi sẽ tìm ra giải pháp phù hợp để bạn bổ sung thêm vào tài khoản của mình. 
                </div>
            </div>
            <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Các khoản thu nhập của tôi được ghi có bằng cách nào? 
                </div>
                <div class='faq_text'>Tỷ lệ phần trăm được ghi có mọi chu kỳ, Tiền được rút ngay tức thì theo yêu cầu thủ công. Trong trường hợp có bất kỳ vấn đề kỹ thuật nào, có thể có sự chậm trễ lên đến 12 giờ. Trong tương lai gần, chúng tôi có kế hoạch thực hiện rút tiền tự động các khoản thu nhập của bạn mà bạn không cần can thiệp 
                </div>
            </div>
            <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Tôi có thể không rút tiền và tạo khoản ký quỹ mới với số tiền đó không? 
                </div>
                <div class='faq_text'>Tất nhiên là có 
                </div>
            </div> -->
            <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Tôi có thể thực hiện bao nhiêu khoản ký quỹ? 
                </div>
                <div class='faq_text'>Bao nhiêu tùy thích. Không có giới hạn 
                </div>
            </div>
            <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Tôi có thể kiếm tiền bằng cách thu hút các nhà đầu tư mới không? 
                </div>
                <div class='faq_text'>Có. Chúng tôi có một chương trình liên kết mà bạn có thể kiếm 10% trong khoản ký quỹ của nhà đầu tư mà bạn đã thu hút được. 
                </div>
            </div>
            <div class='faq_block'>
                <div class='faq_title_text'>
                    <div class='faq_plus'>+</div>
                    Tôi có thể liên hệ công ty bằng cách nào nếu tôi có câu hỏi bổ sung? 
                </div>
                <div class='faq_text'>Mọi phương pháp liên hệ đều có trong phần "Liên hệ" 
                </div>
            </div>
        </div>
    </div>
</div>

<script language="JavaScript">
    $(document).ready(function () {
        $('#faq_content h2').css({'transform': 'scale(1)'});
        $('#faq_content h2 + p').css({'transform': 'translate3d(0px,0px,0px)'});
    });
</script> 


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