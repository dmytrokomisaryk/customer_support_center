(function(){

  'use strict';

  function range() {
    return function(n) {
      var res = [];
      for (var i = 0; i < n; i++) {
        res.push(i);
      }
      return res;
    };
  }

  angular
    .module('app')
    .filter('range', range);

}());