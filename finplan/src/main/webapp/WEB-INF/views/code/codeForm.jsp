<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>任务管理</title>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#code_code").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</head>

<body>
	<form id="inputForm" action="${ctx}/code/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${code.id}"/>
		<fieldset>
			<legend><small>管理代码</small></legend>
			<div class="control-group">
				<label for="code_code" class="control-label">Code:</label>
				<div class="controls">
					<textarea id="code_code" name="code" class="input-large">${code.code}</textarea>
				</div>
			</div>	
			<div class="control-group">
				<label for="code_category" class="control-label">Code Category:</label>
				<div class="controls">
					<input type="text" id="code_category" name="codeCategory"  value="${code.codeCategory}" class="input-large required" minlength="3"/>
				</div>
			</div>
			<div class="control-group">
				<label for="description" class="control-label">Code Description:</label>
				<div class="controls">
					<textarea id="description" name="codeDesc" class="input-large">${code.codeDesc}</textarea>
				</div>
			</div>
			<div class="control-group">
				<label for="remarks" class="control-label">Code Remarks:</label>
				<div class="controls">
					<textarea id="remarks" name="codeRemarks" class="input-large">${code.codeRemarks}</textarea>
				</div>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
</body>
</html>
