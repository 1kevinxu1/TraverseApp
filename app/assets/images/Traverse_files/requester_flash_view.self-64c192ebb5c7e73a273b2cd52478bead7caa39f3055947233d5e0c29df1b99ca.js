(function() { this.JST || (this.JST = {}); this.JST["trips/requester_flash_view"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('PENDING REQUESTS <br>\n  ');  if (user) { ; __p.push('\n    ',  user.get("name") ,'\n    ',  user.get("age") ,'\n    <img src="', user.get("image_url"),'" height="150px" width="150px">\n    <div id="accept" class="btn btn-success">Accept</div>\n    <div id="decline" class="btn btn-danger">Decline</div>\n  ');  } else { ; __p.push('\n    <div class="placeholder-2">NO PENDING REQUESTS</div>\n  ');  } ; __p.push('\n');}return __p.join('');};
}).call(this);
