(function() {
  'use strict';

  function CreateFeedbackController($scope, $state, $rootScope, FeedbackResource, Flash, StorageService) {
    var vm = this;

    vm.submit = submit;

    if ($rootScope.selectedTicket) {
      StorageService.save('ticket', JSON.stringify($rootScope.selectedTicket));
      StorageService.save('user', JSON.stringify($scope.user));
    } else {
      $rootScope.selectedTicket = JSON.parse(StorageService.get('ticket'));
      $rootScope.user = JSON.parse(StorageService.get('user'));
    }

    function submit() {
      FeedbackResource.save(vm.feedback, function () {
        $state.go('home.tickets').then(function () {
          var message = 'Your feedback has been successfully created!';
          Flash.create('success', message, 3000, {container: 'flash-fixed'}, true);
        });
      })
    }
  }

  angular
    .module('app')
    .controller('CreateFeedbackController', CreateFeedbackController);

}());
