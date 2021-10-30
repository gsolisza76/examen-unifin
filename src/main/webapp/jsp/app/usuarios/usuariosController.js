(function () { 'use strict';
 define(['angular', 'usuarios' ], function (angular, usuariosService ) {

	 var SampleApp = angular.module('SampleApp');    
	 	SampleApp.controller('abstractUsuariosController',['$scope', '$http', '$uibModal', '$log', 'usuariosService', 
	 		function($scope, $http, $uibModal, $log, usuariosService){
    	    	
    		$scope.showUsuariosForm = function (item) {
         	$scope.datausuarios = item;
         	
            var modalInstance = $uibModal.open({
                 animation: false,
                 ariaLabelledBy: 'modal-title',
                 ariaDescribedBy: 'modal-body',
                 templateUrl: 'usuarioModal.html',
                 controller: 'ModalInstanceCtrl',                 
                 size: 'lg',
                 windowClass: 'app-modal-window',
                 scope: $scope,
                 resolve: {
                     nform: function () { 
                    	 	return $scope.nform;                                               
                     }
                 }
             });

            modalInstance.result.then(function (selectedItem) {
                $scope.selected = selectedItem;                
                $scope.search('');                
            }, function () {
                $log.info('Modal dismissed at: ' + new Date());
            });
         };
         
    }]);
   
    
    SampleApp.controller('usuariosController',
        ['$scope', '$http', '$controller','$uibModal','$log', '$q', '$document','$window', '$sce','$route','usuariosService', 
        	function ($scope, $http, $controller,$uibModal, $log, $q, $document, $window, $sce,$route, usuariosService) {
        	
        	$scope.tabselector = '';
        	$scope.id = {value:"", regexp:"", required:true};
        	$scope.key = {value:"", regexp:"", required:true};
          	$scope.description = {value:"", regexp:"", required:true};
          	$scope.titleModal =  {value:""};
        	       	
        	$controller('abstractUsuariosController', { $scope: $scope });
            
        	$scope.currentPage = 0;
    		$scope.pageSize = 10;
    		$scope.pages = [];
        	           
            /*Parametros de usuario*/
            $scope.usuario = {
            		usuario_id : { value:"", required:true, regexp:"" },
            		nombre : { value:"", required:true, regexp:"" },
            		apellido_paterno : { value:"", required:true, regexp:"" },
            		apellido_materno : { value:"", required:false, regexp:"" },
            		correo_elect : { value:"", required:true, regexp:"" },
            		contrasena : { value:"", required:true, regexp:"" },
            		pagado : { value:"", required:false, regexp:"" },
            		usuario_referencia : { value:"", required:false, regexp:"" },
            	};
            
            /*Llamada botón Buscar*/
            $scope.ocultar = true;
            $scope.usuarios = { items:[] };            
            $scope.search = function(){  	
            	usuariosService.getUsuarios().then(function(data){
	            	$scope.usuarios.items = data;
	            });
            };
            
            $scope.configPages = function() {
                $scope.pages.length = 0;
                var ini = $scope.currentPage - 4;
                var fin = $scope.currentPage + 5;
                if (ini < 1) {
                  ini = 1;
                  if (Math.ceil($scope.usuarios.length / $scope.pageSize) > 10)
                    fin = 10;
                  else
                    fin = Math.ceil($scope.usuarios.length / $scope.pageSize);
                } else {
                  if (ini >= Math.ceil($scope.usuarios.length / $scope.pageSize) - 10) {
                    ini = Math.ceil($scope.usuarios.length / $scope.pageSize) - 10;
                    fin = Math.ceil($scope.usuarios.length / $scope.pageSize);
                  }
                }
                if (ini < 1) ini = 1;
                for (var i = ini; i <= fin; i++) {
                  $scope.pages.push({
                    no: i
                  });
                  console.log("+++ Paginación: "+$scope.pages.no);
                }
                
                if ($scope.currentPage >= $scope.pages.length)
                  $scope.currentPage = $scope.pages.length - 1;
            };

            $scope.setPage = function(index) {
                $scope.currentPage = index - 1;
            };

            /*Llamada botón agregar nuevo registro*/
            $scope.callUsuarioNew = function(){
            	$scope.titleModal.value="Registro Usuarios";
            	$scope.usuario.usuario_id.value="";
            	$scope.usuario.nombre.value="";
            	$scope.usuario.apellido_paterno.value="";
            	$scope.usuario.apellido_materno.value="";
            	$scope.usuario.correo_elect.value="";
            	$scope.usuario.contrasena.value="";
            	$scope.usuario.usuario_referencia.value="";

            	var usuarioNuevo = $scope.usuario;         	
            };
			
            $scope.reload = function(){
            	$route.reload();
            };
            
            
        }])
        .filter('startFromGrid', function() {
    			  return function(input, start) {
    			    start = +start;
    			    return input.slice(start);
    			  }
    			});
    
    
 // Please note that $uibModalInstance represents a modal window (instance) dependency.
    // It is not the same as the $uibModal service used above.

    SampleApp.controller('ModalInstanceCtrl',['$scope', '$uibModalInstance', 'nform', 'usuariosService', 'uibDateParser', function ($scope, $uibModalInstance, nform, usuariosService, uibDateParser) {
    	$scope.form = {}
       	var data = {};
       	
       	$scope.cancel = function () {
        	$uibModalInstance.dismiss('cancel');
        };
        
        $scope.submitUsuariosForm = function () {/*debugger;*/
            if ($scope.form.nform.$valid) {
            	
            	data = {            			
				        usuarioId: $scope.usuario.usuario_id.value,
				        nombre: $scope.usuario.nombre.value,
            			apellidoPaterno: $scope.usuario.apellido_paterno.value,
            			apellidoMaterno: $scope.usuario.apellido_materno.value,
            			correoElect: $scope.usuario.correo_elect.value,
            			contrasensa: $scope.usuario.contrasena.value,
            			usuarioReferencia: $scope.usuario.usuario_referencia.value,            			
            	};
            	 
            	 var req = JSON.stringify(data);
					
					var escapedJSONString = req.replace(/\\n/g, "\\n")
			        .replace(/\\'/g, "\\'")
			        .replace(/\\"/g, '\\"')
			        .replace(/\\&/g, "\\&")
			        .replace(/\\r/g, "\\r")
			        .replace(/\\t/g, "\\t")
			        .replace(/\\b/g, "\\b")
			        .replace(/\\f/g, "\\f");
					usuariosService.setUsuario(escapedJSONString).then(function(data){ 
            		
            	})
            	.finally(function(){
                       $uibModalInstance.close('closed');
            	});
             
            }
        };
		

    SampleApp.component('modalComponent', {
    	   templateUrl: 'myModalContent.html',
    	   bindings: {
    	     resolve: '<',
    	     close: '&',
    	     dismiss: '&'
    	   },
    	   controller: function () {
    	     var $ctrl = this;

    	     $ctrl.$onInit = function () {
    	       $ctrl.items = $ctrl.resolve.items;
    	       $ctrl.selected = {
    	         item: $ctrl.items[0]
    	       };
    	     };

    	     $ctrl.ok = function () {
    	       $ctrl.close({$value: $ctrl.selected.item});
    	     };

    	     $ctrl.cancel = function () {
    	       $ctrl.dismiss({$value: 'cancel'});
    	     };
    	   }
    	 });

    return SampleApp;
    
});
 
;})();
