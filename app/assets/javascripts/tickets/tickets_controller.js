(function() {
  'use strict';

  function TicketsController($scope, $state, $rootScope, $cookies, TicketsResource) {
    var vm = this;

    vm.reply = reply;
    vm.search = search;
    vm.filter = $cookies.getObject('ticketsFilter') || {};
    vm.definePages = definePages

    function reply(ticket) {
      $rootScope.selectedTicket = ticket;
      $state.go('home.feedback');
    }

    function search() {
      $cookies.putObject('ticketsFilter', vm.filter);
      getTickets()
    }

    function definePages() {
      vm.pages = Math.ceil(vm.total_count / vm.filter.per_page);
    }

    function getTickets() {
      TicketsResource.query(vm.filter, function (response) {
        vm.tickets = response['tickets'];
        vm.total_count = response['total_count']
        vm.filter.page = response['current_page']
        vm.filter.per_page = response['per_page']

        vm.definePages()
      })
    }

    getTickets()
  }

  angular
    .module('app')
    .controller('TicketsController', TicketsController);

}());
