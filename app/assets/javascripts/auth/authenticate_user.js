(function() {

  'use strict';

  function AuthenticateUser($state, Auth) {

    return {
      perform: function (state) {
        Auth.currentUser()
          .then(function (response) {
            switch(state) {
              case 'home':
              case 'home.login':
              case 'home.tickets':
                $state.go('home.tickets');
                break;
              default:
                $state.go(state);
            }
          }, function (error) {
            switch(state) {
              case 'home':
              case 'home.ticket':
                $state.go(state);
                break;
              default:
                $state.go('home.login');
            }
          })
      }
    };

  };

  angular
    .module('app')
    .factory('AuthenticateUser', AuthenticateUser);

}());