(function() { this.JST || (this.JST = {}); this.JST["header"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<nav class="navbar navbar-default">\n  <div id="header-container" class="container">\n    <div class="container-fluid">\n      <!-- Brand and toggle get grouped for better mobile display -->\n      <div class="navbar-header">\n        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">\n          <span class="sr-only">Toggle navigation</span>\n          <span class="icon-bar"></span>\n          <span class="icon-bar"></span>\n          <span class="icon-bar"></span>\n        </button>\n        <a class="navbar-brand" href="javascript:void(0)">Traverse</a>\n      </div>\n\n        <form class="navbar-form navbar-left" role="search">\n          <div class="form-group">\n            <input type="text" class="form-control" placeholder="Search">\n          </div>\n          <button type="submit" class="btn btn-default">Submit</button>\n        </form>\n        <ul class="nav navbar-nav navbar-right">\n          <li><a class="profile-button" href="javascript:void(0)">', Traverse.name,'</a></li>\n          <li><a class="sign-out-button" href="javascript:void(0)">Sign Out!</a></li>\n        </ul>\n      </div><!-- /.navbar-collapse -->\n    </div><!-- /.container-fluid -->\n  </div>\n</nav>\n\n<form class="sign-out-form" action="/session" method="post">\n  <input type="hidden" name="_method" value="delete">\n  <input type="hidden" name="authenticity_token" value="',  $('meta[name=csrf-token]').attr('content') ,'">\n</form>\n');}return __p.join('');};
}).call(this);
