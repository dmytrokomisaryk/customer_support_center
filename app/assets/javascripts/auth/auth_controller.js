(function(){

  'use strict';

  function AuthController($scope, $state, Auth, Flash) {

      var vm = this;

      vm.login = login;

      function login() {
          Auth.login(vm.user, function (r) { console.log(r)})
            .then(function () {
              $state.go('home.tickets').then(function () {
                var message = 'You have successfully logged!'
                Flash.create('success', message, 3000, {container: 'flash-fixed'}, true);
              });
            }, function (error) {
              Flash.create('danger', error.data['error'], 3000, {container: 'flash-fixed'}, true);
            });
      };

      function goToJobs() {
          $state.go('home.tickets');
      };
  };

  angular
    .module('app')
    .controller('AuthController', AuthController);
}());
