window.GuestLogin = {
	initialize: function(){
		$("#jumbotron-button").on("click", this.guestLogin.bind(this) );
	},

	guestLogin: function(){
    $("#log-in-button").click();
		$username = $('#username');
		$password = $('#password');
		$submitButton = $('#login-submit');

		this.slowtype($username, 'welcome@guest.com', function(){
			this.slowtype($password, 'password', function(){
				$submitButton.click();
			}.bind(this))
		}.bind(this));
	},

	slowtype: function($el, word, callback){

		var typing = setInterval(function(){
			$el.val( $el.val() + word.slice(0,1) );
			word = word.substr(1);

			if (!word){
				clearInterval(typing);
				callback();
			}
		}, 80);
	}

}
