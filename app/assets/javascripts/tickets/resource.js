(function() {

  'use strict';

  function TicketsResource($resource) {
    return $resource('/tickets/:reference/:command', {reference: '@reference'}, {
      query: {
        method: 'GET',
        isArray: false
      }
    });
  };

  angular
    .module('app')
    .factory('TicketsResource', TicketsResource);

}());
