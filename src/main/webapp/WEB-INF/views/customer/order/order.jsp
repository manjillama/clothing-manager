<%@ include file="../../includes/header.jsp" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="content-wrapper">
	
	<div class="container-fluid">
		<!-- Custom Error Handling -->
		<c:if test="${errorMsg != null}">
			<div class="alert alert-danger alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<i class="fa fa-times" aria-hidden="true"></i> ${errorMsg}
			</div>
		</c:if>
		
		<c:if test="${param.success!=null}">
			<div class="alert alert-success alert-dismissible fade in" role="alert">
				<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
				</button>
				<i class="fa fa-check" aria-hidden="true"></i> Action Successful!</b>
			</div>
		</c:if>	
		
		
		<a href="/view/customer/${order.customer.id}" style="margin-top:15px;display:block"><i class="fa fa-chevron-left" aria-hidden="true"></i> Back To Customer</a>
		
		<div class="row" style="margin-top: 15px;">
			 <div class="col-sm-3 col-sm-6 col-xs-12">
		          <div class="info-box">
		            <span class="info-box-icon bg-success"><i class="fa fa-usd" aria-hidden="true" style="line-height: 90px;"></i></span>
		            <div class="info-box-content">
		              <span class="info-box-text">Order Total</span>
		              <h3 style="margin:0;margin-top:5px"><small>Rs.</small> ${order.grandTotal}</h3>
		            </div>
		            <!-- /.info-box-content -->
		          </div>
		          <!-- /.info-box -->
	        </div>
			 <div class="col-sm-3 col-sm-6 col-xs-12">
	          <a href="/order/item/add?order_id=${order.id}" class="info-box">
	            <span class="info-box-icon bg-orange"><i class="fa fa-plus" aria-hidden="true" style="line-height: 90px;"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text"><strong>Add Item</strong></span>
	            </div>
	            <!-- /.info-box-content -->
	          </a>
	          <!-- /.info-box -->
	        </div>
	        
			 <div class="col-sm-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-olive"><i class="fa fa-shopping-bag" aria-hidden="true" style="line-height: 90px;"></i></span>
				<c:set var="totalItems" value="${0}"/>
				<c:forEach var="item" items="${order.customerOrderItems}">
				    <c:set var="totalItems" value="${totalItems + item.quantity}" />
				</c:forEach>
	            <div class="info-box-content">
	              <span class="info-box-text">Total Items</span>
	              <span class="info-box-number">${totalItems}</span>
	            </div>
	            <!-- /.info-box-content -->
	          </div>
	          <!-- /.info-box -->
	        </div>
	        
	        <div class="col-sm-3 col-sm-6 col-xs-12">
	          <a href="/receipt/${order.id}" class="info-box">
	            <span class="info-box-icon bg-aqua"><i class="fa fa-print" aria-hidden="true" style="line-height: 90px;"></i></span>
	
	            <div class="info-box-content">
	              <span class="info-box-text">Receipt</span>
	            </div>
	            <!-- /.info-box-content -->
	          </a>
	          <!-- /.info-box -->
	        </div>
	        
	        
	        
		</div><!-- row -->    
	
		<div class="row">
			<div class="col-md-12">
				<div style="background: #FFF; padding:15px;border-radius: 10px;}">
					<h4>Information</h4>
					<ul class="list-unstyled" style="line-height: 26px;">
						<li><strong>Order Id: ${order.id}</strong></li>
						<li><i class="fa fa-user-circle" aria-hidden="true"></i> ${order.customer.fullname}</li>
						<li><i class="fa fa-phone-square" aria-hidden="true"></i> ${order.customer.contactNumber}</li>
						<li>Ordered Date: <fmt:formatDate type = "date" value = "${order.orderedDate}" /></li>
						<li><strong><i class="fa fa-truck" aria-hidden="true"></i> Delivery Price : <span style="color:#E91E63">Rs. ${order.deliveryPrice}</span></strong></li>
					</ul>
				</div>
			</div>
			
			<div class="col-md-12">
				<h4>Items</h4>
				<div class="table-responsive">
					<table class="table table-hover">
						<tr class="success">
							<th>Product</th>
							<th>Size</th>
							<th>Type</th>
							<th>Product Gender</th>
							<th>Price</th>
							<th>Discount</th>
							<th>Quantity</th>
							<th>Total</th>
							<th>Remarks</th>
							<th>Delete</th>
						</tr>
						<c:forEach items="${order.customerOrderItems}" var="item">
							<tr>
								<td>${item.product} | ${item.gender}</td>
								<td>${item.size}</td>
								<td>${item.type }</td>
								<td>${item.gender}</td>
								<td>${item.sellingPrice}</td>
								<td>${item.discount}</td>
								<td>${item.quantity}</td>
								<td><strong>Rs. ${item.totalSellingPrice-item.discount}</strong></td>
								<td>${item.remarks}</td>
								<td><a href="/order/item/delete/${order.id}/${item.id}" onclick="return confirm('Are you sure to delete?')" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
					
				<c:if test="${fn:length(order.customerOrderItems) < 1}">
				   <p class="text-center">No Item Added Yet :(</p>
				</c:if>			
				
			</div><!-- End of column -->
		</div>
	</div>
</div>
<!-- Content Wrapper -->
<%@ include file="../../includes/footer.jsp" %>
