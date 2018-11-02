(function(){

  'use strict';

  angular
    .module('app')
    .config(function($stateProvider, $locationProvider, $urlRouterProvider){
      $locationProvider.hashPrefix('')

      $stateProvider
        .state('home', {
          url: '/',
          templateUrl: 'home/index.html',
          controller: 'HomeController as vm',
          onEnter: function(AuthenticateUser) {
            AuthenticateUser.perform('home');
          }
        })
        .state('home.login', {
          url:'login',
          templateUrl: 'auth/index.html',
          controller: 'AuthController as vm',
          onEnter: function(AuthenticateUser) {
            AuthenticateUser.perform('home.login');
          }
        })
        .state('home.tickets', {
          url:'tickets',
          templateUrl: 'tickets/index.html',
          controller: 'TicketsController as vm',
          onEnter: function(AuthenticateUser) {
            AuthenticateUser.perform('home.tickets');
          }
        })
        .state('home.ticket', {
          url:'ticket',
          templateUrl: 'tickets/create.html',
          controller: 'CreateTicketController as vm',
          onEnter: function(AuthenticateUser) {
            AuthenticateUser.perform('home.ticket');
          }
        })
        .state('home.feedback', {
          url:'feedback',
          templateUrl: 'feedbacks/create.html',
          controller: 'CreateFeedbackController as vm',
          onEnter: function(AuthenticateUser) {
            AuthenticateUser.perform('home.feedback');
          }
        })

      $urlRouterProvider.otherwise('/')
    });

}());