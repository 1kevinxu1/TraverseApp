(function() { this.JST || (this.JST = {}); this.JST["user_profiles/show"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('');  if (this.collection.length > 0) { ; __p.push('\n  You have ',  this.collection.length ,' trips in common!\n');  } ; __p.push('  \n\n<div class="containter-fluid profile" id="overlapping-trips">\n</div>\n\n<div id="profile-header" class="container-fluid profile profile-header">\n  <h1>',  user.get("name") ,', ',  user.get("age") ,'</h1>\n  <h3> ');  if (user.get("hometown")) { ; __p.push('\n    ',  user.get("hometown").city ,', ', user.get("hometown").state ,'\n    ');  } else { ; __p.push('\n      No hometown\n    ');  } ; __p.push(' </h3>\n</div>\n\n<div id="profile-content" class="profile">\n  <div id="about-me" class="profile-blurb">\n    <h3>\n      About Me\n    </h3>\n    <p>\n      ',  user.escape("about_blurb") || user.get("fname") + " has nothing to say." ,'\n    </p>\n  </div>\n  <div id="about-me" class="profile-blurb">\n    <h3>One Crazy Story About Me</h3>\n    <p>\n      ',  user.escape("story_blurb") || user.get("fname") + " has nothing to say.",'\n    </p>\n  </div>\n  <div id="about-me" class="profile-blurb">\n    <h3>When I travel, I like to...</h3>\n    <p>\n      ',  user.escape("travel_blurb") || user.get("fname") + " has nothing to say." ,'\n    </p>\n  </div>\n</div>\n');}return __p.join('');};
}).call(this);
