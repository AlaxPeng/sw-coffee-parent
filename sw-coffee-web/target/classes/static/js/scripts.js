document.addEventListener('DOMContentLoaded', function() {
  var triggers = document.querySelectorAll('.trigger');

  for (var i = 0; i < triggers.length; i++) {
    triggers[i].addEventListener('click', function(event) {
      var target = document.getElementById(this.getAttribute('rel'));
      target.classList.add('active');
      document.body.classList.add('with-overlay-nav');
      return false;
    });
  }
  var snackbars = document.querySelectorAll('.snackbar');

  for (var i = 0; i < snackbars.length; i++) {
    snackbars[i].addEventListener('click', function(event) {
      if ((event.target.classList.contains('close')) || (event.target.parentNode.classList.contains('close'))) {
        this.classList.remove('active');
      }
    });
  }

  var dialogs = document.querySelectorAll('.dialog');

  for (var i = 0; i < dialogs.length; i++) {
    dialogs[i].addEventListener('click', function(event) {
      if ((event.target.classList.contains('close')) || (event.target.parentNode.classList.contains('close'))) {
        this.classList.remove('active');
        document.body.classList.remove('with-overlay');
      }
    });
  }
  var overlays = document.querySelectorAll('.overlay');

  for (var i = 0; i < overlays.length; i++) {
    overlays[i].addEventListener('click', function(event) {
      if ((event.target.classList.contains('close')) || (event.target.parentNode.classList.contains('close'))) {
        this.classList.remove('active');
        document.body.classList.remove('with-overlay');
        document.body.classList.remove('with-overlay-nav');
      }
    });
  }
  document.onkeydown = function(evt) {
    evt = evt || window.event;
    if (evt.keyCode == 27) {
      var overlays = document.querySelectorAll('.overlay');

      for (var i = 0; i < overlays.length; i++) {
        overlays[i].classList.remove('active');
      }

      document.body.classList.remove('with-overlay');

      var dialogs = document.querySelectorAll('.dialog');

      for (var i = 0; i < dialogs.length; i++) {
        dialogs[i].classList.remove('active');
      }
    }
  };

  if ('addEventListener' in document) {
    document.addEventListener('DOMContentLoaded', function() {
      FastClick.attach(document.body);
    }, false);
  }

  /* COLLAPSIBLE */
  var collapsibles = document.querySelectorAll('.collapsible');

  for (var i = 0; i < collapsibles.length; i++) {
    var collapsible = collapsibles[i];

    if (window.location.hash == '#' + collapsible.getAttribute('id')) {
      collapsible.classList.add('expanded');
    } else {
      collapsible.classList.add('collapsed');
    }

    collapsible.addEventListener('click', function(event) {
      event.preventDefault();

      var header = this.querySelector('.header');
      var body = this.querySelector('.body');
      var container = this.querySelector('.body .container');

        if (this.classList.contains('collapsed')) {
          body.style.maxHeight = container.offsetHeight;
        } else {
          body.style.maxHeight = '';
        }
        this.classList.toggle('collapsed');
        this.classList.toggle('expanded');
    });
  }

  /* SCROLL */
  function throttle(func, wait, options) {
    var context, args, result;
    var timeout = null;
    var previous = 0;
    if (!options) options = {};
    var later = function() {
      previous = options.leading === false ? 0 : Date.now();
      timeout = null;
      result = func.apply(context, args);
      if (!timeout) context = args = null;
    };
    return function() {
      var now = Date.now();
      if (!previous && options.leading === false) previous = now;
      var remaining = wait - (now - previous);
      context = this;
      args = arguments;
      if (remaining <= 0 || remaining > wait) {
        if (timeout) {
          clearTimeout(timeout);
          timeout = null;
        }
        previous = now;
        result = func.apply(context, args);
        if (!timeout) context = args = null;
      } else if (!timeout && options.trailing !== false) {
        timeout = setTimeout(later, remaining);
      }
      return result;
    };
  };
  // extension:
  $.fn.scrollEnd = function(callback, timeout) {
    $(this).scroll(function(){
      var $this = $(this);
      if ($this.data('scrollTimeout')) {
        clearTimeout($this.data('scrollTimeout'));
      }
      $this.data('scrollTimeout', setTimeout(callback,timeout));
    });
  };
  window.addArrowToScroll = function addArrowToScroll(el){
    var scroll = $(el)[0];
    if (!scroll) return;
    var allWidth = scroll.scrollWidth;
    var showWidth = scroll.clientWidth;
    var arrowLeft = $(scroll).prev();
    var arrowRight = $(scroll).next();
    showArrow(); // First determine the arrow display
    function moveScroll(dire){
      var scrollLeft = dire === "left" ? scroll.scrollLeft - 300 : scroll.scrollLeft + 300;
      $(scroll).animate({scrollLeft:scrollLeft}, 500,function(){
        showArrow()
      });
    }
    function showArrow(){
      // Decide how to display the arrow
      var scrollLeft = scroll.scrollLeft;
      if(allWidth === showWidth){
        arrowLeft.addClass('hidden');
        arrowRight.addClass('hidden');
      }else if(scrollLeft >0 && scrollLeft + showWidth < allWidth){
        arrowLeft.removeClass('hidden');
        arrowRight.removeClass('hidden');
      }else if(scrollLeft > 0 || scrollLeft + showWidth === allWidth || scrollLeft + showWidth > allWidth){
        arrowLeft.removeClass('hidden');
        arrowRight.addClass('hidden');
      }else if(scrollLeft ===0 || scrollLeft < 0){
        arrowLeft.addClass('hidden');// hide arrow
        arrowRight.removeClass('hidden'); // dispaly srrow
      }
    }
    $(scroll).scrollEnd(function(){
      showArrow()
    }, 500);
    arrowLeft.on('click', throttle(function(){moveScroll("left")}, 1000));
    arrowRight.on('click',throttle(function(){moveScroll("right")}, 1000));
  }
  // Add an event to the scroll of a static file
  addArrowToScroll('.scroll');

  if (window.location.pathname.indexOf('/about/news/') !== -1) {
    var $window = $(window)
    var $wrapper = navigator.userAgent.match(/Android/i) ? $('#app-view-wrapper') : $window
    var $reference = $('.page-about-news .wrapper.section .list, .type-posts .wrapper.section .post > p')
    var $backToTop = 
      $('<button class="backToTop"></button>')
      .click(function() {
        $wrapper.scrollTop(0)
      })

    $wrapper.on('scroll', throttle(function() {
      var scrollTop = $wrapper.scrollTop()
      var right = 5

      if ($reference[0]) {
        right = Math.max($window.width() - $reference.offset().left - $reference.width() - $backToTop.width() - 40, right)
      }

      if (scrollTop > $window.height() * 0.3) {
        $backToTop.css('right', right).css('visibility', 'visible')
      } else {
        $backToTop.css('visibility', 'hidden')
      }
    }, 200))

    $('body').append($backToTop)
  }
});

 window.stopEvtPropagation = function stopEvtPropagation(el, evt) {
   // the default evt is 'click'
   evt = evt || 'click'
   // if a single el object is passed to the fn, convert it into an array
   var els = Array.prototype.slice.call(el)
   els = els.length ? els : [el]
   els.forEach(function(el) {
     el.addEventListener && el.addEventListener(evt, function(event){
       event.stopPropagation()
     })
   })
 }

 stopEvtPropagation(document.querySelectorAll('.body .container p a'))


$(document).ready(function() {
  if ($('.subcategories').find('.active').offset()) {
    $('.subcategories').animate({scrollLeft: ($('.subcategories').find('.active').offset().left - 16)},0);
  }

  $('.page-front .tmall .title-1 strong').each(function(){
    $(this).html($(this).html().replace('-','&#8209;'))
  });

  $(document).on('click','.svc .frap .button, .MsrContainer .frap .button', function(){
    document.querySelector('html').scrollTo(0,0)
  })

  $('.page-front .slick-next').attr('id', 'home-navigation');

  $('#help-cta-search').on('click',function(){
    document.body.style.overflow = 'hidden';
  })

  $('#help-search-overlay .close').on('click',function(){
    document.body.style.overflow = 'inherit';
  })

  $('#featured-campaign-search').on('click', function() {
    $('#help-search-input').focus();
    $('#menu-search-input').focus();
  })

  if (!!window.MSInputMethodContext && !!document.documentMode) {
    $('body').addClass('ie11')
  }

  $(".item").click(function () {
    location.href = "/menu/details?commodityMessageNo="+$(this).children("input").val();
  })

  $("#menu-search-input").keyup(function () {
    var messageName = $(this).val();
      $.getJSON("/menu/search",{messageName:messageName},function (data) {
        if(data.length != 0) {
          $("#menu-search-empty").html("<div class=\"tag\">商品如下</div>");
          var menuSearchResults = "";
          $.each(data, function (index, event) {
            menuSearchResults += "<li>" +
                "<a class=\"overlay-close thumbnail\" href=\"/menu/details?commodityMessageNo=\""+event.commodityMessageNo+">" +
                "<div class=\"preview circle\" style=\"background-image: url(/static/img" + event.commodityMessageImg + ")\"></div>" +
                "<strong>" + event.commodityMessageName + "</strong>" +
                "</a>" +
                "</li>";
          })
          $("#menu-search-results").html(menuSearchResults);
        }
        else {
          $.getJSON("/menu/recommend",{},function (data) {
            $("#menu-search-empty").html("<div class=\"tag\">没有找您要的商品,大家都在搜</div>");
            var menuSearchResults = "";
            $.each(data,function (index,event) {
              menuSearchResults+="<li>" +
                  "<a class=\"overlay-close thumbnail\" href=\"/menu/details?commodityMessageNo=\""+event.commodityMessageNo+">" +
                  "<div class=\"preview circle\" style=\"background-image: url(/static/img"+event.commodityMessageImg+")\"></div>" +
                  "<strong>"+event.commodityMessageName+"</strong>" +
                  "</a>" +
                  "</li>";
            })
            $("#menu-search-results").html(menuSearchResults);
          })
        }
      })
  })

})