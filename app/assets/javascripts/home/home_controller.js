(function(){

  'use strict';

  function HomeController($scope, $state, Auth) {
    var vm = this;
    vm.signedIn = Auth.isAuthenticated;
    vm.logout = Auth.logout;

    getCurrentUser()

    function getCurrentUser() {
      return Auth.currentUser().then(setCurrentUser);
    };

    function setCurrentUser(user) {
      return $scope.user = user;
    };

    $scope.$on('devise:login', function(e, user) {
      return $scope.user = user;
    });

    $scope.$on('devise:logout', function(e, user) {
      $state.go('home');
      return $scope.user = {};
    });
  }

  angular
    .module('app')
    .controller('HomeController', HomeController);

}());