$(function(){
  $(document).on('turbolinks:load', function() { 
    var $setElm = $('.viewer'),
    fadeSpeed = 1000,
    switchDelay = 3500;

    $setElm.each(function(){
        var targetObj = $(this);
        var findUl = targetObj.find('ul');
        var findLi = targetObj.find('li');
        var findLiFirst = targetObj.find('li:first');

        findLi.css({display:'block',opacity:'0',zIndex:'99'});
        findLiFirst.css({zIndex:'100'}).stop().animate({opacity:'1'},fadeSpeed);

        setInterval(function(){
            findUl.find('li:first-child').animate({opacity:'0'},fadeSpeed).next('li').css({zIndex:'100'}).animate({opacity:'1'},fadeSpeed).end().appendTo(findUl).css({zIndex:'99'});
        },switchDelay);
    });
  });
});