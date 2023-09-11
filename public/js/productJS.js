$(document).ready(function () {
  //change header navber sun and moon
  $(".slider").on("click ", function () {
    if ($(this).hasClass("sun")) {
      $(".sun").css({
        display: "none",
      });
      $(".moon").css({
        display: "block",
      });
    } else {
      $(".sun").css({
        display: "block",
      });
      $(".moon").css({
        display: "none",
      });
    }
  });

  // 回到頂部
  $('#BackTop').click(function () {
    $('html,body').animate({ scrollTop: 0 }, 333);
  });
  $(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
      $('#BackTop').fadeIn(222);
    } else {
      $('#BackTop').stop().fadeOut(222);
    }
  }).scroll();

  // 按下+-符號時，數量會跟著變動
  var currentNumber = 1;
  $('#num').val(currentNumber);

  $('#plus').click(function () {
    currentNumber += 1;
    $('#num').val(currentNumber);
  });

  $('#minus').click(function () {
    if (currentNumber > 1) {
      currentNumber -= 1;
      $('#num').val(currentNumber);
    }
  });

  var user_id = $('#userId').data('userId');
  // 加入購物車
  $('#cart').click(function () {
    var prod_id = $(this).data('prod_id');
    var spec_id = $(this).data('spec_id');

    $.ajax({
      url: '/addcart',
      type: 'POST',
      data: {
        user_id: user_id,
        prod_id: prod_id,
        spec_id: spec_id
      },
      success: function (response) {
        console.log('已成功加入購物車');
      },
      error: function (error) {
        console.error('加入購物車失敗', error);
      }
    });
  });

  // 加入收藏
  $('#collect').click(function () {
    var prod_id = $(this).data('prod_id');
    var spec_id = $(this).data('spec_id');
    var update_time = $(this).data('update_time');

    $.ajax({
      url: '/addcollect',
      type: 'POST',
      data: {
        user_id: user_id,
        prod_id: prod_id,
        spec_id: spec_id,
        update_time: update_time
      },
      success: function (response) {
        console.log('已成功加入收藏');
      },
      error: function (error) {
        console.error('加入收藏失敗', error);
      }
    });
  });

});

