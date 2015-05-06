<html ng-app="countryApp">
<head>
  <meta charset="utf-8">
  <title>Angular.js Example</title>
  <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.1/angular.min.js"></script>
</head>
<body ng-controller="countryCntrl">
    Search:<input ng-model="query" type="text"/>  
   <br/>
   <table>
       <tr>
          <th><a href="" ng-click="sortField='name';reverse=!reverse">Country</a></th>
          <th><a href="" ng-click="sortField='population';reverse=!reverse">Population</a></th>
          <th>Flag</th>
       </tr>   
       <tr ng-repeat="country in countries | filter:query | orderBy:sortField:reverse">
         <td>{{country.name}}</td>
         <td>{{country.population}}</td>
         <td><img ng-src="{{country.flagURL}}" width="50"></img></td>
       </tr> 
   </table>
   
   <script>
   var myAPP = angular.module("countryApp",[]);
             myAPP.controller("countryCntrl",function($scope,$http)
             {
	               $http.get("countries.json").success(function(data)
	            		   {$scope.countries = data;}
               );
				 $scope.sortField='population';
 				 $scope.reverse=true;
             }); 
       </script>   
 </body>            
   
</html>
