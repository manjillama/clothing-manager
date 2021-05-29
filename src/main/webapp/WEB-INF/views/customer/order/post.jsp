<%@ include file="../../includes/header.jsp" %>
<div class="content-wrapper">
	<!-- Custom Error Handling -->
	<c:if test="${errorMsg != null}">
		<div class="alert alert-danger alert-dismissible fade in" role="alert">
			<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
				<span aria-hidden="true">�</span>
			</button>
			<i class="fa fa-times" aria-hidden="true"></i> ${errorMsg}
		</div>
	</c:if>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<c:choose>
					<c:when test="${request == 'edit' }">
						<h4>Update Order </h4>
					</c:when>
					<c:otherwise>
						<h4>Add Order</h4>
					</c:otherwise>
				</c:choose>
				<br/>		
				<form:form method="POST" action="/order/post?order_id=${param['order_id']}" commandName="order" enctype="multipart/form-data">
					<c:if test="${request == 'edit'}">
						<form:input type="hidden" path="id"/>
					</c:if>					
					<div class="form-group">
						<label for="pName">Product Name* <form:errors path="product" class="text-danger"/></label>
						<form:input class="form-control" id="pName" type="text" path="product"  placeholder="Product Name" required="required"/>
					</div>
					
					<div class="form-group">
						<label for="pSize">Product Size* <span class="text-muted">(Enter "Free Size" if no size)</span><form:errors path="size" class="text-danger"/></label>
						<form:input class="form-control" id="pSize" type="text" path="size"  placeholder="i.e. Free Size" required="required"/>
					</div>
					
					<div class="form-group">
						<label for="pBuyingPrice">Buying Price Per Item* <form:errors path="buyingPrice" class="text-danger"/></label>
						<form:input class="form-control" id="pBuyingPrice" type="number" path="buyingPrice"  placeholder="Buying Price" required="required"/>
					</div>
					
					<div class="form-group">
						<label for="pSellingPrice">Selling Price Per Item* <span class="text-muted">(Without discount)</span><form:errors path="sellingPrice" class="text-danger"/></label>
						<form:input class="form-control" id="pSellingPrice" type="number" path="sellingPrice"  placeholder="Selling Price" required="required"/>
					</div>
					
					<div class="form-group">
						<label for="pQuantity">Quantity*<form:errors path="quantity" class="text-danger"/></label>
						<form:input class="form-control" id="pQuantity" type="number" path="quantity"  placeholder="Quantity" required="required"/>
					</div>
					
					<div class="form-group">
						<label for="pDiscount">Total Discount Amount <span class="text-muted">(In exact amount, not in percentage)</span> <form:errors path="discount" class="text-danger"/></label>
						<form:input class="form-control" id="pDiscount" type="number" path="discount" placeholder="Discount" required="required"/>
					</div>
					
					<div class="form-group">
					    <label>Gender*</label><br/>
					    <label class="radio-inline">
					    	<form:radiobutton path="gender" value="Men" checked="checked"/>Men
					    </label>
					    <label class="radio-inline">
					    	<form:radiobutton path="gender" value="Women"/>Women	
					    </label>
					    <label class="radio-inline">
					    	<form:radiobutton path="gender" value="Unisex"/>Unisex	
					    </label>
					    <p><form:errors path="gender" cssStyle="color:red"/></p>
				  	</div>
					
					<div class="form-group">
						<label>Product Type* <form:errors path="type" class="text-danger"/></label>
						<form:select id="pTypes" path="type" class="form-control">
			                
			            </form:select>
					</div>
					
					<div class="form-group">
						<label for="pRemarks">Remarks<form:errors path="remarks" class="text-danger"/></label>
						<form:textarea class="form-control" id="pRemarks" type="text" path="remarks" placeholder="Remarks"/>
					</div>
										
					<div class="form-group">
						<c:choose>
							<c:when test="${request == 'edit' }">
								<button type="submit" class="btn btn-primary">Update</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-primary">Add</button>
							</c:otherwise>
						</c:choose>
						<a href="/order/view/${param['order_id']}" class="btn btn-default">Back</a>
					</div>
				</form:form>
			</div><!-- End job list -->
		</div>
	</div>
</div>
<script>
	$.getJSON('/public/product-type.json', function(data){
		$.each(data.types, function(key, value){
		  $('#pTypes').append("<option value="+value+">"+value+"</option>");
	  	});	  
	});
</script>
<!-- Content Wrapper -->
<%@ include file="../../includes/footer.jsp" %>
