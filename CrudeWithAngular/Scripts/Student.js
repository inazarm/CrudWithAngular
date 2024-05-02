var app = angular.module("myApp", [])
app.controller("myCntrl", function ($scope, $http) {
    $scope.GetAllStudent = function () {
        $http({
            method: "get",
            url: "https://localhost:44389/Student/GetAllStudent",
        }).then(function (response) {
            debugger;
            $scope.Student = response.data;
            console.log($scope.student);
        }, function () {
            debugger;
            alert("Error");
        })
    };
    $scope.InsertStudent = function () {
        debugger
        var type = document.getElementById("insertStd").getAttribute("value");
        if (type == "Submit") {
            debugger;
            $scope.student = {};
            $scope.student.Name = $scope.SName;
            $scope.student.Age = $scope.SAge;
            $scope.student.Department = $scope.SDpt;
            $http({
                method: "post",
                url: "https://localhost:44389/Student/InsertStudentRecord",
                datatype: "json",
                data: $scope.student
            }).then(function (response) {
                alert(response.data);
                $scope.GetAllStudent();
                $scope.SName = "";
                $scope.SAge = "";
                $scope.SDpt = "";
            })
        }
        else {
            $scope.student = {};
            $scope.student.Id = sessionStorage.getItem("SID");
            $scope.student.Name = $scope.SName;
            $scope.student.Age = $scope.SAge;
            $scope.student.Department = $scope.SDpt;
            $http({
                method: "post",
                url: "https://localhost:44389/Student/UpdateStudentRecord",
                datatype: "json",
                data: JSON.stringify($scope.student)
            }).then(function (response) {
                alert(response.data);
                $scope.GetAllStudent();
                $scope.SName = "";
                $scope.SAge = "";
                $scope.SDpt = "";
                document.getElementById("insertStd").setAttribute("value", "submit");
            })
        }
    };

    $scope.UpdateStudent = function (Std) {

        sessionStorage.setItem("SID", Std.ID)
        $scope.SName = $scope.Name;
        $scope.SAge = $scope.Age;
        $scope.SDpt = $scope.Department;
        document.getElementById("insertStd").setAttribute("value", "Update");
    };

    $scope.DeleteStudent = function (Std) {
        $http({
            method: "post",
            url: "https://localhost:44389/Student/DeleteStudentRecord",
            datatype: "json",
            data: JSON.stringify(Std)
        }).then(function (response) {
            alert("Delete Successfully");
            $scope.GetAllStudent();
        })
    };
})