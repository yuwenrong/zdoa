<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>�����ʼ�</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<link href="css/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="css/sendFile.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript" src="javascript/position.js"></script>
		<script>
			function checkEmail()
			{
				var toEmail=document.getElementById("toEmail").value.trim();
				if(toEmail=="")
				{
					alert("����д�ռ��˵�ַ");
					return false;
				}
				var emailpat=/^[.-_a-zA-Z0-9]+@[-_a-zA-Z0-9]+\.[.a-zA-Z0-9]+$/;
	        	if(!emailpat.exec(toEmail))
	        	{
	        		alert("�ռ��������ʽ����ȷ������");
	        		return false;
	        	}
	        	var topic=document.getElementById("topic").value.trim();
	        	if(topic=="")
	        	{
	        		alert("�ʼ����ⲻ��Ϊ��");
	        		return false;
	        	}	
	        	var content=document.getElementById("content").value.trim();
	        	if(content=="")
	        	{
	        		alert("�ʼ����ݲ���Ϊ��");
	        		return false;
	        	}
	        	
			}
		</script>
	</head>
	<body id="sendfile" onload="updateTree('li61');">
	<div id="container">
		<div id="tophead">
			<s:action name="top" executeResult="true"/>
		</div>
		<div id="leftcontent">
			<s:action name="leftTree" executeResult="true"/>
		</div>
		<div id="maincontent">
		<s:form theme="simple" action="sendEmail" method="post" onsubmit="return checkEmail();">
			<table>
				<tr style="height:40px;">
					<td>�ռ��˵�ַ��</td>
					<td><s:textfield name="toEmail" id="toEmail" cssStyle="width:300px"/></td>
				</tr>
				<tr style="height:40px;">
					<td>�� �� �� �⣺</td>
					<td><s:textfield name="topic" id="topic" cssStyle="width:500px"/></td>
				</tr>
				<tr>
					<td>�� �� �� �ݣ�</td>
					<td><s:textarea name="content" id="content" cssStyle="width:500px;height:300px;"/></td>
				</tr>
				<tr>
					<td></td>
					<td><s:submit value="����"/>&nbsp&nbsp&nbsp&nbsp<s:reset value="ȡ��"/></td>
				</tr>
			</table>
		</s:form>
		</div>
	</div>
	<script language="JavaScript">
		var result="<s:property value="result"/>";
		if(result!="")
		{
			alert(result);
		}
	</script>
	</body>
</html>
