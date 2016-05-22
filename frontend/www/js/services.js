var app = angular.module('App.services', [])

app.factory('customerService', function ($http, AuthService) {
	var baseUrl = 'http://localhost/webservice/server/customer/';
	return {
		getIdcustomer: function () {
			return $http.get(baseUrl + 'select_id_customer.php?customer_username=' + AuthService.username());
		},
		createcustomer: function (customer) {
			return $http.post(baseUrl + 'insert_customer.php', customer, {
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8;'
				}
			});
		},
		updatecustomer: function (data) {
			return $http.post(baseUrl + 'update_customer.php', data, {
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8;'
				}
			});
		}
	};
})

app.factory('kategoriService', function ($http) {
	var baseUrl = 'http://localhost/webservice/server/kategori/';
	return {
		getAll: function () {
			return $http.get(baseUrl + 'select_kategori.php');
		},
	};
})

app.factory('produkService', function ($http) {
	var baseUrl = 'http://localhost/webservice/server/produk/';
	return {
		getAllhotlist: function () {
			return $http.get(baseUrl + 'select_hotlist.php');
		},
		getIdkategori: function (kategoriId) {
			return $http.get(baseUrl + 'select_id_kategori.php?kategori_id=' + kategoriId);
		},
		getIdproduk: function (produkId) {
			return $http.get(baseUrl + 'select_id_produk.php?produk_id=' + produkId);
		},
	};
})

app.service('AuthService', function ($http) {
	var LOCAL_TOKEN_KEY = 'yourTokenKey';
	var username = '';
	var isAuthenticated = false;
	var authToken;

	function loadUserCredentials() {
		var token = window.localStorage.getItem(LOCAL_TOKEN_KEY);
		if (token) {
			useCredentials(token);
		}
	}

	function storeUserCredentials(token) {
		window.localStorage.setItem(LOCAL_TOKEN_KEY, token);
		useCredentials(token);
	}

	function useCredentials(token) {
		username = token.split('.')[0];
		isAuthenticated = true;
	}

	function destroyUserCredentials() {
		authToken = undefined;
		username = '';
		isAuthenticated = false;
		$http.defaults.headers.common['X-Auth-Token'] = undefined;
		window.localStorage.removeItem(LOCAL_TOKEN_KEY);
	}

	var logout = function () {
		destroyUserCredentials();
	};

	loadUserCredentials();

	return {
		login: function (login) {
			return storeUserCredentials(login.username + '.yourServerToken'), $http.get("http://localhost/webservice/server/login/login.php?user=" + login.username + "&pass=" + login.password + "");
		},
		logout: logout,
		isAuthenticated: function () {
			return isAuthenticated;
		},
		username: function () {
			return username;
		}
	};
})

app.factory('AuthInterceptor', function ($rootScope, $q, AUTH_EVENTS) {
	return {
		responseError: function (response) {
			$rootScope.$broadcast({
				401: AUTH_EVENTS.notAuthenticated,
				403: AUTH_EVENTS.notAuthorized
			}[response.status], response);
			return $q.reject(response);
		}
	};
})

app.config(function ($httpProvider) {
	$httpProvider.interceptors.push('AuthInterceptor');
});