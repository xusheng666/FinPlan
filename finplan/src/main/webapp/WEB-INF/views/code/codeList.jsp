<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>Maintain Codes</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class="row">
		<div class="span4 offset7">
			<form class="form-search" action="#">
				<label>Code：</label> <input type="text" name="search_LIKE_code" class="input-medium" value="${param.search_LIKE_code}"> 
				<br>
				<label>Category：</label> <input type="text" name="search_LIKE_codeCategory" class="input-medium" value="${param.search_LIKE_codeCategory}">
				<button type="submit" class="btn" id="search_btn">Search</button>
		    </form>
	    </div>
	    <tags:sort/>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>Code</th><th>Code Category</th><th>Description</th><th>Action</th></tr></thead>
		<tbody>
		<c:forEach items="${codes.content}" var="code">
			<tr>
				<td><a href="${ctx}/code/update/${code.id}">${code.code}</a></td>
				<td>${code.codeCategory}</a></td>
				<td>${code.codeDesc}</a></td>
				<td><a href="${ctx}/code/delete/${code.id}">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<tags:pagination page="${codes}" paginationSize="5"/>

	<div><a class="btn" href="${ctx}/code/create">创建任务</a></div>
</body>
</html>
