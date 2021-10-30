<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<script>
document.getElementById("l_search_txt").addEventListener("keyup", function(event) {
    event.preventDefault();
});
</script>
<style type="text/css">
  form.tab-form-demo .tab-pane {
    margin: 20px 20px;
  }
  .rojo {
	color: #ff0000;
  }
</style>
<div ng-controller="usuariosController"  class="modal-demo" >
<script type="text/ng-template" id="periodoModal.html">
<input type="text" id="usuario_id" class="form-control" style="width:200px;" ng-model="datausuario.periodoId.value" ng-show="false" placeholder=""
    ng-required="VIAL..usuario_id.required" >
  <form name="form.nform" ng-submit="submitPeriodoForm()" novalidate>

	<div class="modal-header">
	  <label class="modal-title">{{titleModal.value}}</label>
    </div>
  
  <div class="modal-body" id="modal-body"></div>

         <div class="container">
		  <div class="row"><div class="col-md">&nbsp;</div></div>
			<div class="row">
				<div class="col-md-2">
            	  <span class = "rojo"> * </span><label class="lbl">Nombre:</label>
            	</div>				
				<div class="col-md-4">
					<input type="text" id="nombre" name="nombre" class="form-control" ng-model="datausuario.nombre.value"
    			           ng-required="datausuario.nombre.required">
                 	</select> 
				</div>				
				<div class="col-md-2">
              		<span class = "rojo">*</span><label class="lbl">Apellido Paterno:</label>
            	</div>
            	<div class="col-md-4">
                    <input type="text" id="apellido_paterno" name="apellido_paterno" class="form-control" ng-model="datausuario.apellido_paterno.value"
    			           ng-required="datausuario.apellido_paterno.required">
            	</div>
				<div class="col-md-2">
              		<label class="lbl">Apellido Materno:</label>
            	</div>
				<div class="col-md-4">
                    <input type="text" id="apellido_materno" name="apellido_materno" class="form-control" ng-model="datausuario.apellido_materno.value"
    			           ng-required="datausuario.apellido_materno.required">
            	</div>	
		  	</div>
			<div class="row">
				<div class="col-md-2">
            	  <span class = "rojo"> * </span><label class="lbl">Correo electrónico:</label>
            	</div>				
				<div class="col-md-4">
					<input type="text" id="correo_elect" name="correo_elect" class="form-control" ng-model="datausuario.correo_elect.value"
    			           ng-required="datausuario.correo_elect.required">
				</div>				
				<div class="col-md-2">
              		<span class = "rojo">*</span><label class="lbl">Contraseña</label>
            	</div>
            	<div class="col-md-4">
                    <input type="text" id="contrasena" name="contrasena" class="form-control" ng-model="datausuario.contrasena.value"
    			           ng-required="datausuario.contrasena.required">
            	</div>
				<div class="col-md-2">
              		<label class="lbl">Pagado:</label>
            	</div>
				<div class="col-md-4">
                    <input type="text" id="pagado" name="pagado" class="form-control" ng-model="datausuario.pagado.value"
    			           ng-required="datausuario.pagado.required">
            	</div>	
		  	</div>
			<div class="row">
				<div class="col-md-2">
            	  <label class="lbl">Usuario referencia:</label>
            	</div>				
				<div class="col-md-4">
					<input type="text" id="usuario_referencia" name="usuario_referencia" class="form-control" ng-model="datausuario.usuario_referencia.value"
    			           ng-required="datausuario.usuario_referencia.required">
				</div>
			</div>
          </div>   
         
        <!--Selected: <b>{{ $ctrl.selected.item }}</b>-->
	  <!--</div>-->
	  <div class="row"><div class="col-md">&nbsp;</div></div>	
	  <div class="modal-footer">
	    <div class="container">
		  <div class="row">
			  <div class="col-md-4">
				<span class = "rojo"> * </span><label class="lbl">Campos obligatorios.</label>
			  </div>
		  </div>	
	      <div class="row">				
	          
	        <div class="col-md-1"></div>
	        <div class="col-md-5">
	          <div ng-hide="ocultarView">			  
				<button type="submit" ng-disabled="form.nform.$invalid"
	            class="btn btn-secondary frm-btn btn-block">Aceptar</button>
			  </div>
	        </div>
	        <div class="col-md-5">
	          <button type="button" class="btn btn-secondary frm-btn btn-block" ng-click="cancel()">Cancelar</button>
	        </div>
	        <div class="col-md-1"></div>
	      </div>
	    </div>
	  </div>
	  
</form>
</script>
<script type="text/ng-template" id="myModalContent.html">
        <div class="modal-header">
            <h3 class="modal-title" id="modal-title">I'm a modal!</h3>
        </div>
        <div class="modal-body" id="modal-body">
            <ul>
                <li ng-repeat="item in $ctrl.items">
                    <a href="#" ng-click="$event.preventDefault(); $ctrl.selected.item = item">{{ item }}</a>
					 <label class="btn btn-primary" ng-model="radioModel" uib-btn-radio="'Left'">Left</label>
        <label class="btn btn-primary" ng-model="radioModel" uib-btn-radio="'Middle'">Middle</label>
        <label class="btn btn-primary" ng-model="radioModel" uib-btn-radio="'Right'">Right</label>
                </li>
            </ul>
            Selected: <b>{{ $ctrl.selected.item }}</b>
        </div>
        <div class="modal-footer">
			<button type="submit" class="btn btn-secondary login-btn btn-block">Ingresar</button>
            <button class="btn btn-primary" type="button" ng-click="$ctrl.ok()">OK</button>
            <button class="btn btn-warning" type="button" ng-click="$ctrl.cancel()">Cancel</button>
        </div>
    </script>
    <script type="text/ng-template" id="stackedModal.html">
        <div class="modal-header">
            <h3 class="modal-title" id="modal-title-{{name}}">The {{name}} modal!</h3>
        </div>
        <div class="modal-body" id="modal-body-{{name}}">
            Having multiple modals open at once is probably bad UX but it's technically possible.
        </div>
    </script>
    <script type="text/ng-template" id="myTooltipTemplate.html">
      <span>Special Tooltip with <strong>markup</strong> and {{ dynamicTooltipText }}</span>
    </script>

    
  <div>
	  <h3>Usuarios</h3>
  </div>    
    
  <div class="row"><div class="col-md">&nbsp;</div></div>
   	<div class="row"><div class="col-md">&nbsp;</div></div>
     &nbsp;  	
   	<div class="row">
   		<div class="col-sm-1"></div>
        <div class="col-md-2">
            <div class="form-group">
            <button type="button" id="l_search_btn" ng-click="gear = true; search(searchValue); ocultar = false;"
                class="btn btn-secondary form-btn btn-block" hidefocus="true">Buscar &nbsp;&nbsp; <i
                    class="fas fa-search"></i></button>
              		&nbsp;&nbsp;    		
   			</div>
   		</div>		        
        <div class="col-md-2">
            <div class="form-group">           
    		<button type="button" class="btn btn-secondary form-btn btn-block" ng-click="callPeriodoNew()">
    			Nuevo &nbsp;&nbsp; <i class="fas fa-plus"></i>
    		</button>
   			</div>
        </div> 
        <div class="col-md-2">
            <div class="form-group"> 
            <button type="button" class="btn btn-secondary form-btn btn-block" ng-click="reload()">    			
    			Limpiar &nbsp;&nbsp; <i class="fas fa-recycle"></i>
    		</button>    		
   			</div>
        </div>         
    </div>     
 	
 	<div ng-hide="ocultar">
 	<div>	
	 	<table ng-init="configPages()" class="table table-hover">
	 		<thead class="thead-gray">
		 	  <tr>
		 	  	<th scope="col">Id</th>
		 	  	<th scope="col">Nombre</th>
		 	  	<th scope="col">Correo</th>
		 	  </tr>	
	 	  	</thead>
	 	  	<tbody>	 	
			  <tr ng-repeat="item in usuarios.items|startFromGrid:currentPage*pageSize|limitTo:pageSize">
			  	<td scope="row">{{item.id}}</td>
			  	<td scope="row">{{item.key}}</td>
				<td scope="row">{{item.description}}</td>
			  </tr>
		  	</tbody>	
		</table>			
	</div>
	<div class="row"><div class="col-md">&nbsp;</div></div>
	<div class="row">
   		<div class="col-sm-1"></div>
        <div class="col-md-2">
            <div class="form-group">
            <button type="button" class="btn btn-secondary form-btn btn-block" ng-disabled="currentPage == 0" ng-click="currentPage = currentPage - 1">Anterior &nbsp;&nbsp;</button>
            </div>
   		</div>		        
        <div class="col-md-2">
            <div class="form-group">           
    		<button type="button" class="btn btn-secondary form-btn btn-block" ng-disabled="currentPage == page.no - 1" ng-click="setPage(page.no)" ng-repeat="page in pages">{{page.no}}</button>
   			          
    		<button type="button" class="btn btn-secondary form-btn btn-block" ng-disabled="currentPage >= escuelas.items.length/pageSize - 1" ng-click="currentPage = currentPage + 1">Siguiente &nbsp;&nbsp;</button>
   			</div>
        </div>       
    </div>   
   </div>	
     
</div> 
