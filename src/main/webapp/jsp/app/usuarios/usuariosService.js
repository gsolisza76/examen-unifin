
(function () { 'use strict';

define(['angular'], function (angular) {

    var SampleApp = angular.module('SampleApp',[]);

    SampleApp.factory('usuariosService', ['$http', '$q', '$rootScope','appConstant', function ($http,$q, $rootScope, appConstant) {
    	
        return {
        	
        	rspath : appConstant.rootpath+'/cupones.rs',
        	
        	getListaUsuarios: function(){
        		var deferred = $q.defer();    		  
           		$http({
           		      method: 'GET',
           		      url: this.rspath + '/getListaUsuarios/',
           		      headers: {'Content-Type': 'application/json'} 
           		   }).then(function (response){
       					deferred.resolve(response.data);
       	    		   },function (error){
       	    			   deferred.reject('error');
       	    		   });    		  
       	           return deferred.promise;
        	},
        	
        	setUsuario: function(data){
        	    var deferred = $q.defer();    		  
        	    $http({
        	        method: 'POST',
        	        url: this.rspath + '/setUsuario ',
        	        data: data, 
        	        headers: {'Content-Type': 'application/json'} 
        	     }).then(function (response){
        	              deferred.resolve(response.data);
        	         },function (error){
        	             deferred.reject('Error ');
        	         });    		  
        	     return deferred.promise;
        	      
        	  },
        
	        GetQuestions: function () {
	            return $http({
	                url: ""
	            });
	        }            

        }
    }]);


    return SampleApp;
});
;})();
