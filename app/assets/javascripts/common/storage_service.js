(function(){

  'use strict';

  function StorageService($rootScope) {
    return {
      get: function(key) {
        return sessionStorage.getItem(key);
      },
      save: function(key, data) {
        sessionStorage.setItem(key, data);
      }
    };
  }

  StorageService.$inject = ['$rootScope'];

  angular
    .module('app')
    .factory('StorageService', StorageService);

}());
