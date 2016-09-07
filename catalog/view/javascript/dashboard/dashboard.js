 $(function() {
    $('[data-countdown]').each(function() {
         var $this = $(this), finalDate = $(this).data('countdown');
            $this.countdown(finalDate, function(event) {
            $this.html(event.strftime('<i class="fa fa-clock-o" aria-hidden="true"></i> %H : %M : %S '));
            
        });
    });
 });
$(document).ready(function() {
    requestGD();
    // requestGDMarch();
    // requestGDFinish();
    // requestPD();
    // requestPDMarch();
    // requestPDFinish();
    function requestGD(){
       
        $.ajax({
             url : $('#scroller').data('link'),
             type : 'GET',
             async : true,
             success : function(result) {
                 result = $.parseJSON(result);
                 $('#scroller').html('');
                $('#scroller').append(_.values(result)[0]);

             }
         });
        }
    function requestGDMarch(){
        $('#news_request_gdMarch').slideUp("slow");
        $.ajax({
             url : $('#news_request_gdMarch').data('link'),
             type : 'GET',
             async : true,
             success : function(result) {
                 result = $.parseJSON(result);
                 $('#news_request_gdMarch').html('');
                $('#news_request_gdMarch').append(_.values(result)[0]);
                $('#news_request_gdMarch').slideDown("slow");
                 setTimeout(function () {
                     requestGDMarch();
                 }, 5000);
             }
         });
        }
    function requestGDFinish(){
        $('#news_request_gdFinish').slideUp("slow");
        $.ajax({
             url : $('#news_request_gdFinish').data('link'),
             type : 'GET',
             async : true,
             success : function(result) {
                 result = $.parseJSON(result);
              $('#news_request_gdFinish').html('');
                $('#news_request_gdFinish').append(_.values(result)[0]);
               $('#news_request_gdFinish').slideDown("slow");
                 setTimeout(function () {
                     requestGDFinish();
                 }, 5000);
             }
         });
        }
    function requestPD(){
        $('#news_request_pd').slideUp("slow");
        $.ajax({
             url : $('#news_request_pd').data('link'),
             type : 'GET',
             async : true,
             success : function(result) {
                 result = $.parseJSON(result);
                 $('#news_request_pd').html('');
                $('#news_request_pd').append(_.values(result)[0]);
                 $('#news_request_pd').slideDown("slow");
                 setTimeout(function () {
                     requestPD();
                 }, 5000);
             }
         });
        }
    function requestPDMarch(){
        $('#news_request_pdMarch').slideUp("slow");
        $.ajax({
             url : $('#news_request_pdMarch').data('link'),
             type : 'GET',
             async : true,
             success : function(result) {
                 result = $.parseJSON(result);
                 $('#news_request_pdMarch').html('');
                $('#news_request_pdMarch').append(_.values(result)[0]);
                $('#news_request_pdMarch').slideDown("slow");
                 setTimeout(function () {
                     requestPDMarch();
                 }, 5000);
             }
         });
        }
    
    function requestPDFinish(){
        $('#news_request_pdFinish').slideUp("slow");
        $.ajax({
             url : $('#news_request_pdFinish').data('link'),
             type : 'GET',
             async : true,
             success : function(result) {
                 result = $.parseJSON(result);
                 $('#news_request_pdFinish').html('');
                $('#news_request_pdFinish').append(_.values(result)[0]);
                $('#news_request_pdFinish').slideDown("slow");
                 setTimeout(function () {
                     requestPDFinish();
                 }, 5000);
             }
         });
        }
    var funDaskboard = {
        ajaxSumTreeMember : function(callback) {
            $.ajax({
                url : $('.downline-tree').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.downline-tree').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxGetPin : function(callback) {
            $.ajax({
                url : $('.pin-balence').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.pin-balence').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxAnalytics : function(element, callback) {
            $.ajax({
                url : element.data('link'),
                type : 'GET',
                data : {
                    'id' : element.data('id'),
                    'level' : element.data('level')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotalPD : function(callback) {
            $.ajax({
                url : $('.pd-count').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.pd-count').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotalGD : function(callback) {
            $.ajax({
                url : $('.gd-count').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.gd-count').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxGetR_Wallet : function(callback) {
            $.ajax({
                url : $('.r-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.r-wallet').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxGetC_Wallet : function(callback) {
            $.ajax({
                url : $('.c-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.c-wallet').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetM_Wallet : function(callback) {
            $.ajax({
                url : $('.m-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.m-wallet').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_Binary_Left : function(callback) {
            $.ajax({
                url : $('.total_left').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_left').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_PD_Left : function(callback) {
            $.ajax({
                url : $('.total_pd_left').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_pd_left').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_Binary_Right : function(callback) {
            $.ajax({
                url : $('.total_right').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_right').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_PD_Right : function(callback) {
            $.ajax({
                url : $('.total_pd_right').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_pd_right').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
    }

    // funDaskboard.ajaxSumTreeMember(function(result) {
    //     _.has(result, 'success') && $('.downline-tree').html(_.values(result)[0]);
    //     _.each($('.downline-tree').data(), function(v, e) {
    //         $('.downline-tree').removeAttr('data-' + e);
    //     });
    //     $('.tile-image-downline-tree + div').css({
    //         'background-image' : 'none'
    //     });
    // });

    funDaskboard.ajaxGetPin(function(result) {
        _.has(result, 'success') && $('.pin-balence').html(_.values(result)[0]);
        _.each($('.pin-balence').data(), function(v, e) {
            $('.pin-balence').removeAttr('data-' + e);
        });

        $('.tile-image-pin-balance + div.tile-footer').css({
            'background-image' : 'none'
        });
    });
    // _.each([0, 1, 2, 3, 4, 5, 6], function(value) {
    //     funDaskboard.ajaxAnalytics($('td.analytics-tree[data-level=' + value + ']'), function(result) {
    //         _.has(result, 'success') && $('td.analytics-tree[data-level=' + value + ']').html(_.values(result)[0] + ' &nbsp;<i class="fa fa-user"></i>');
    //         $('td.analytics-tree[data-level=' + value + ']').css({
    //             'background-image' : 'none'
    //         });
    //     });
    // });

    funDaskboard.ajaxGetTotalPD(function(result) {
        _.has(result, 'success') && $('.pd-count').html(_.values(result)[0]);
        _.each($('.pd-count').data(), function(v, e) {
            $('.pd-count').removeAttr('data-' + e);
        });

        $('.tile-image-ph + div.tile-footer').css({
            'background-image' : 'none'
        });
    });

    funDaskboard.ajaxGetR_Wallet(function(result) {
        _.has(result, 'success') && $('.r-wallet').html(_.values(result)[0] + ' VND');
        _.each($('.r-wallet').data(), function(v, e) {
            $('.r-wallet').removeAttr('data-' + e);
        });

        $('div.tile-image-r-wallet + div.tile-footer').css({
            'background-image' : 'none'
        });
    });

    funDaskboard.ajaxGetC_Wallet(function(result) {
        _.has(result, 'success') && $('.c-wallet').html(_.values(result)[0] + ' VND');
        _.each($('.c-wallet').data(), function(v, e) {
            $('.r-wallet').removeAttr('data-' + e);
        });

        $('.tile-image-c-wallet + div.tile-footer').css({
            'background-image' : 'none'
        });
    });
    funDaskboard.ajaxGetM_Wallet(function(result) {
        _.has(result, 'success') && $('.m-wallet').html(_.values(result)[0] + ' VND');
        
        _.each($('.m-wallet').data(), function(v, e) {
            $('.m-wallet').removeAttr('data-' + e);
        });

        $('.tile-image-m-wallet + div.tile-footer').css({
            'background-image' : 'none'
        });
    });

    funDaskboard.ajaxGetTotalGD(function(result) {
 
        _.has(result, 'success') && $('.gd-count').html(_.values(result)[0]);
        _.each($('.gd-count').data(), function(v, e) {
            $('.gd-count').removeAttr('data-' + e);
        });

        $('.tile-image-gh + div.tile-footer').css({
            'background-image' : 'none'
        });
    });
    funDaskboard.ajaxGetTotal_Binary_Left(function(result) {
        _.has(result, 'success') && $('.total_left').html(_.values(result)[0]);
        _.each($('.total_left').data(), function(v, e) {
            $('.total_left').removeAttr('data-' + e);
        });

        
    });
    funDaskboard.ajaxGetTotal_PD_Left(function(result) {
        _.has(result, 'success') && $('.total_pd_left').html(_.values(result)[0] + ' VND');
        _.each($('.total_pd_left').data(), function(v, e) {
            $('.total_pd_left').removeAttr('data-' + e);
        });

        
    });
    funDaskboard.ajaxGetTotal_Binary_Right(function(result) {
        _.has(result, 'success') && $('.total_right').html(_.values(result)[0]);
        _.each($('.total_right').data(), function(v, e) {
            $('.total_right').removeAttr('data-' + e);
        });

       
    });
    funDaskboard.ajaxGetTotal_PD_Right(function(result) {
        _.has(result, 'success') && $('.total_pd_right').html(_.values(result)[0] + ' VND');
        _.each($('.total_pd_right').data(), function(v, e) {
            $('.total_pd_right').removeAttr('data-' + e);
        });

       
    });

});
 $(function(){
    $('#btn_active').on('click', function(envt) {
         var self = $(this);
        $(this).ajaxSubmit({
            url : $('#btn_active').data('link'),
            type : 'GET',
            beforeSubmit :  function(arr, $form, options) { 
                window.funLazyLoad.start();
            },
            success : function(result){
                result = $.parseJSON(result);
                console.log(result);
                if (_.has(result, 'login') && result.login === -1) {
                    // location.reload(true);
                } else {
                    if (_.has(result, 'ok') && result.ok === -1 && _.has(result, 'link')) {                        
                        $('#create-error').show();
                        $('#create-error').show().html(' <i class="fa fa-fw fa-times"></i>Please pay packages before joining a new package!');
                        window.funLazyLoad.reset();
                         window.location.href= result.link;
                        return true;
                    } else {
                        $('#create').parent().addClass('has-success');
                    }
                    if (_.has(result, 'ok') && result.ok === 1 && _.has(result, 'bitcoin') && _.has(result, 'wallet') && _.has(result, 'link') ) {
                        $('#ok-error').hide();
                        window.location.href= result.link;
                          window.funLazyLoad.reset();           
                    }
                }
                // location.reload(true);
                // window.funLazyLoad.reset();
            }
        });
      return false;
    });
});
 $(document).ready(function() {
    requestPayment();
    function requestPayment(){
        $.ajax({
             url : $('#detail-payment').data('link'),
             type : 'GET',
             data: { invoice_hash: $('#detail-payment').data('id') }, 
             async : false,
             success : function(result) {
                result = $.parseJSON(result);
                $('#detail-payment').html('');
                $('#detail-payment').append(_.values(result)[0]);
                 setTimeout(function () {
                     requestPayment();
                 }, 5000);
             }
         });
    }
 });