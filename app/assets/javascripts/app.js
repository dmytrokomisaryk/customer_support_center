(function() {

  'use strict';

  angular
    .module('app', ['templates', 'ui.router', 'Devise', 'ngMessages', 'ngResource', 'ngCookies', 'ngFlash'])
    .config(['$httpProvider', function($httpProvider) {
      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    }]);

}());