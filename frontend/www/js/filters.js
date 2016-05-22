'use strict';

var app = angular.module('App.filters', []);

app.filter('startFrom', function () {
	return function (input, start) {
		if (input) {
			start = +start; //parse to int
			return input.slice(start);
		}
		return [];
	}
});