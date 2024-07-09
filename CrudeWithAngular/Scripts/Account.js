var app = angular.module("myApp", []);
app.controller("myCntrl", function ($scope, $http) {
    $scope.btnValue = "Login";
    $scope.userLogin = function () {
        $scope.btnValue = "Please wait...";
        //debugger
        //$scope.login = {};
        //$scope.login.userEmail = $scope.txtEmail;
        //$scope.login.userPassword = $scope.txtPassword;
    }
});