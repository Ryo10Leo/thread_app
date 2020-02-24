$(document).on('turbolinks:load', function(){

    //page topボタン
  $(function(){
    var topBtn=$('#pageTop');
    // topBtn.hide();

    // $(window).scroll(function(){
    //   if($(this).scrollTop()>80　&& $(window).width() > 559){
    //     topBtn.fadeIn();
    //   }else{
    //     topBtn.fadeOut();
    //   }
    // });

        topBtn.click(function(){
        $('body,html').animate({
        scrollTop: 0},500);
        return false;
        });
    });
});