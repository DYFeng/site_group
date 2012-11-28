$(function() {
  $(".tab_content").hide();

  $("ul.tabs li a").click(function(e) {
    $(this).closest("li").addClass("active").siblings().removeClass("active");
    $(this.hash).fadeIn().siblings().hide();
    e.preventDefault();
  }).eq(1).click(); //click the second
});