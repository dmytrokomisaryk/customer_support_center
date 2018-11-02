(function() {
  'use strict';

  function CreateTicketController($scope, $state, $rootScope, $cookies, TicketsResource, Flash) {
    var vm = this;

    vm.createTicket = createTicket;

    function createTicket (ticket) {
      TicketsResource.save(ticket, function () {
        vm.ticket = {}
        var message = 'Your ticket has been successfully created! Please check your email!';
        Flash.create('success', message, 3000, {container: 'flash-fixed'}, true);
      });
    };
  }

  angular
    .module('app')
    .controller('CreateTicketController', CreateTicketController);

}());
