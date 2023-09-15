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

  // 切換深色模式
  $("#dark-mode-toggle").on('change', function () {
    if (this.checked) {
      enableDarkMode();
    } else {
      disableDarkMode();
    }
  });

  // 啟用深色模式
  function enableDarkMode() {
    $('body').addClass('dark-mode');
  }

  // 禁用深色模式
  function disableDarkMode() {
    $('body').removeClass('dark-mode');
  }

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

  $('.no-link').click(function (e) {
    e.preventDefault();
  });

  var user_id = $('#userId').data('userId');
  $('#cart').off('click');
  $('#collect').off('click');
  $('#addtocart').off('click');
  $('#addtocollect').off('click');

  // 加入購物車
  $(document).on('click', '#cart', function () {
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
  $(document).on('click', '#collect', function () {
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

  // 相關商品加入購物車
  $(document).on('click', '#addtocart', function () {
    var prod_id = $(this).data('prod_id');
    var spec_id = $(this).data('spec_id');

    $.ajax({
      url: '/addCart',
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

    console.log('addtocart click event bound:', $('#addtocart').length > 0);

  });

  // 相關商品加入收藏
  $(document).on('click', '#addtocollect', function () {
    var prod_id = $(this).data('prod_id');
    var spec_id = $(this).data('spec_id');
    var update_time = $(this).data('update_time');

    $.ajax({
      url: '/addCollect',
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

    console.log('addtocollect click event bound:', $('#addtocollect').length > 0);

  });

  // 直接購買
  $(document).on('click', '#direct-buy', function () {
    var prod_id = $(this).data('prod_id');
    var spec_id = $(this).data('spec_id');

    $.ajax({
      url: '/checkcart',
      type: 'POST',
      data: {
        user_id: user_id,
        prod_id: prod_id,
        spec_id: spec_id
      },

      success: function (response) {
        if (response.exists) {
          // 如果購物車裡有資料就跳轉至購買頁面
          window.location.href = '/shopcart';
        } else {
          addToCart(prod_id, spec_id);
        }
      },

      error: function (error) {
        console.error('檢查購物車失敗', error)
      }
    })
  });

  // 添加到購物車並跳轉至購買頁面
  function addToCart(prod_id, spec_id) {
    $.ajax({
      url: '/addcart',
      type: 'POST',
      data: {
        user_id: user_id,
        prod_id: prod_id,
        spec_id: spec_id
      },
      success: function (response) {
        console.log('成功加入購物車');
        window.location.href = '/shopcart';
      },
      error: function (error) {
        console.error('加入購物車失敗', error);
        console.log(error);
      }
    });
  }

});

