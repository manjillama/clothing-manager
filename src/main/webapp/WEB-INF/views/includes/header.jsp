<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clothing Manager | Dashboard</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js" defer></script>
	
	<link rel="icon" href="/public/images/favicon.ico" type="image/x-icon" />
	<!-- Bootstrap CSS -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- font awesome -->
	<link rel="stylesheet" href="/public/dist/font-awesome.min.css" />
	<!-- Main css -->
	<link rel="stylesheet" href="/public/style.css" />	
	<!-- Admin LTE -->
	<!-- Theme style -->
	<link rel="stylesheet" href="/public/dist/adminlte/AdminLTE.css">		
</head>
<body ng-app="gravtyApp" class="ng-cloak">
<%@ include file="./nav.jsp" %>


