(function() {

  'use strict';

  function FeedbackResource($resource) {
    return $resource('/feedbacks');
  };

  angular
    .module('app')
    .factory('FeedbackResource', FeedbackResource);

}());