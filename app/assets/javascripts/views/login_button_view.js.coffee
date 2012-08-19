# // function show_Login_Button() {
# //  $(document).ready(function() {  
# //    // alert(request_access_token_link);
# //    $('#login_button_ddm').append('<a class=\'btn\' href=\'' + request_access_token_link +'\'>Login</a>');
# //    $('#yt_api_player_wrapper').css("margin-top", "20px");
# //  });
# // }

# not logged in views
$(document).ready ->
  class Login_Button_View extends Backbone.View

    initialize: ->
      @render()

    render: ->
      @$el.html JST['login_btn']()

   login_button_view = new Login_Button_View(el: $("#login-or-settings-btn"));