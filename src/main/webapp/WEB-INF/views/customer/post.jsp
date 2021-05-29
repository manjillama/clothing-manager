<%@ include file="../includes/header.jsp" %>
<div class="content-wrapper">
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
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<c:choose>
					<c:when test="${request == 'edit' }">
						<h4>Update Customer </h4>
					</c:when>
					<c:otherwise>
						<h4>Add Customer</h4>
					</c:otherwise>
				</c:choose>
				<br/>		
				<form:form method="POST" action="/customers/post" commandName="customer" enctype="multipart/form-data">
					<c:if test="${request == 'edit'}">
						<form:input type="hidden" path="id"/>
					</c:if>
					<div class="form-group">
						<label for="fullname">Fullname* <form:errors path="fullname" class="text-danger"/></label>
						<form:input class="form-control" id="fullname" type="text" path="fullname"  placeholder="Fullname" required="required"/>
					</div>
					<div class="form-group">
						<label>Source* <form:errors path="source" class="text-danger"/></label>
						<form:select path="source" class="form-control">
			                <form:option value="Personal">Personal</form:option>
			                <form:option value="Facebook">Facebook</form:option>
			                <form:option value="Instagram">Instagram</form:option>
			            </form:select>
					</div>
					<div class="form-group">
						<label for="contactNo">Contact No* <form:errors path="contactNumber" class="text-danger"/></label>
						<form:input class="form-control" id="contactNo" type="number" path="contactNumber" autocomplete="off" placeholder="i.e. 9808877457" required="required"/>
					</div>
					<div class="form-group">
						<label for="address">Address* <form:errors path="address" class="text-danger"/></label>
						<form:input class="form-control" id="address" type="text" path="address"  placeholder="Address" required="required"/>
					</div>
					
					<div class="form-group">
					    <label>Gender*</label><br/>
					    <label class="radio-inline">
					    	<form:radiobutton path="gender" value="Male" checked="checked"/>Male
					    </label>
					    <label class="radio-inline">
					    	<form:radiobutton path="gender" value="Female"/>Female	
					    </label>
					    <label class="radio-inline">
					    	<form:radiobutton path="gender" value="Other"/>Other	
					    </label>
					    <p><form:errors path="gender" cssStyle="color:red"/></p>
				  	</div>
					
					<c:choose>
						<c:when test="${request == 'edit' }">
							<div class="form-group">
								<label for="credits">Credits</label>
								<form:input class="form-control" id="credits" type="number" path="credits" required="required"/>
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
							<label for="cReferral">Referral Customer's Id <span class="text-muted">(0 for no referral)</span></label>
							<form:input class="form-control" id="cReferral" type="number" path="referrerId"  placeholder="Referrer customer id" required="required"/>
						</div>
						</c:otherwise>
					</c:choose>
					
					<div class="form-group">
						<c:choose>
							<c:when test="${request == 'edit' }">
								<button type="submit" class="btn btn-primary">Update</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-primary">Add</button>
							</c:otherwise>
						</c:choose>
						<a href="/customers" class="btn btn-default">Back</a>
					</div>
				</form:form>
			</div><!-- End job list -->
		</div>
	</div>
</div>
<!-- Content Wrapper -->
<%@ include file="../includes/footer.jsp" %>
