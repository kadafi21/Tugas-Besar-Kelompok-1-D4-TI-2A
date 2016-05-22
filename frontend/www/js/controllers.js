var app = angular.module('App.controllers', [])

app.controller('AppCtrl', function ($scope, $state, $stateParams, $ionicPopup, $window, AuthService, customerService) {
	$scope.username = AuthService.username();

	$scope.logout = function () {
		AuthService.logout();

		$window.location.reload(true);
		$state.go('login');
	};

	$scope.goBack = function () {
		$window.history.back();
	};

	$scope.showDataId = function () {
		customerService.getIdcustomer().success(function (data) {
			$scope.customer = data;
		});
	};
	$scope.showDataId();
})

app.controller('LoginCtrl', function ($scope, $state, $ionicPopup, $ionicModal, $window, AuthService, customerService) {
	$scope.title = "Masuk";

	$scope.login = function () {
		AuthService.login($scope.login).then(function (data) {
			if (Object.keys(data.data).length === 1) {
				$state.go('app.home', {}, {
					reload: true
				});
				$scope.setCurrentUsername(data.username);
			} else {
				$ionicPopup.alert({
					title: "Login Gagal",
					template: "Username atau Password salah",
					okText: 'Ok',
					okType: 'button-balanced'
				});
			}
		});
	};

	$ionicModal.fromTemplateUrl('signup.html', function (modal) {
		$scope.taskModal = modal;
	}, {
		scope: $scope,
		animation: 'slide-in-up'
	});

	$scope.showAlert = function (msg) {
		$ionicPopup.alert({
			title: msg.title,
			template: msg.message,
			okText: 'Ok',
			okType: 'button-positive'
		});
	};

	$scope.signupModal = function () {
		$scope.taskModal.show();
	};

	$scope.batal = function () {
		$scope.taskModal.hide();
		$scope.showDataId();
	};

	$scope.customer = {};
	$scope.simpan = function () {
		customerService.createcustomer({
			customer_username: $scope.customer.customer_username,
			customer_password: $scope.customer.customer_password,
			customer_nama: $scope.customer.customer_nama,
			customer_alamat: $scope.customer.customer_alamat,
			customer_email: $scope.customer.customer_email,
			customer_notel: $scope.customer.customer_notel,
			customer_asal: $scope.customer.customer_asal
		}).success(function (data) {
			$window.location.reload(true);
			$state.go('app.login');
		});
	}
})

app.controller('HomeCtrl', function ($scope, $state, kategoriService) {
	$scope.title = "Toko Online";

	$scope.showData = function () {
		kategoriService.getAll().success(function (data) {
			$scope.kategori = data;
		}).finally(function () {
			$scope.$broadcast('scroll.refreshComplete');
		});
	};
	$scope.showData();

	$scope.reload = function () {
		$state.go('app.home');
	};
})

app.controller('HotListCtrl', function ($scope, $state, produkService) {
	$scope.title = "Toko Online";

	$scope.showData = function () {
		produkService.getAllhotlist().success(function (data) {
			$scope.produk = data;
			$scope.entryLimit = "5";
		}).finally(function () {
			$scope.$broadcast('scroll.refreshComplete');
		});
	};
	$scope.showData();

	$scope.reload = function () {
		$state.go('app.hotlist');
	};
})

app.controller('ProfileCtrl', function ($scope) {
	$scope.title = "Profile";
})

app.controller('UpdateProfileCtrl', function ($scope, $state, $window, customerService) {
	$scope.title = "Ubah Profile";

	$scope.edit = function (customer_username, customer_nama, customer_alamat, customer_email, customer_notel, customer_asal) {
		$scope.customer_username = customer_username;
		$scope.customer_nama = customer_nama;
		$scope.customer_alamat = customer_alamat;
		$scope.customer_email = customer_email;
		$scope.customer_notel = customer_notel;
		$scope.customer_asal = customer_asal;
		customerService.updatecustomer({
			'customer_username': customer_username,
			'customer_nama': customer_nama,
			'customer_alamat': customer_alamat,
			'customer_email': customer_email,
			'customer_notel': customer_notel,
			'customer_asal': customer_asal,
		}).then(function (resp) {
			console.log('Success', resp);

			$window.location.reload(true);
			$state.go('app.profile');
		}, function (err) {
			console.error('Error', err);
		});
	}
})

app.controller('ProdukCtrl', function ($scope, $stateParams, $timeout, produkService) {
	$scope.title = "Produk";

	$scope.showDataId = function () {
		produkService.getIdkategori($stateParams.kategoriId).success(function (data) {
			$scope.produk = data;
			$scope.limit1 = "1";
			$scope.currentPage = 1; //current page
			$scope.entryLimit = "4"; //max no of items to display in a page
			$scope.filteredItems = $scope.produk.length; //Initially for no filter  
			$scope.totalItems = $scope.produk.length;
			$scope.search = {};
			$scope.search.searchText = '';
		});
	};
	$scope.showDataId();

	$scope.setPage = function (pageNo) {
		$scope.currentPage = pageNo;
	};
	$scope.filter = function () {
		$timeout(function () {
			$scope.filteredItems = $scope.filtered.length;
		}, 10);
	};
	$scope.predicate = 'produk_post';
	$scope.reverse = true;
	$scope.order = function (predicate) {
		$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
		$scope.predicate = predicate;
	};
})