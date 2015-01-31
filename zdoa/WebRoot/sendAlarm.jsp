<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>��������</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<link href="css/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="css/sendFile.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript" src="javascript/position.js"></script>
		<script language="JavaScript">
			String.prototype.trim = function()
			{
			  return this.replace(/(^\s*)|(\s*$)/g, "");
			}
			function checkalarm()
			{
				var title=document.getElementById("title").value.trim();
				if(title=="")
				{
					alert("���ⲻ��Ϊ��");
					return false;
				}
				if(title.length>40)
				{
					alert("����̫�����뾡������");
					return false;
				}
				var deptNumber=document.getElementById("deptlist").value.trim();
				if(deptNumber=="")
				{
					alert("��ѡ����");
					return false;
				}
				var detail=document.getElementById("detail").value;
				if(detail=="")
				{
					alert("���ݲ���Ϊ��");
					return false;
				}
				if(detail.length>1000)
				{
					alert("����̫�����뾡����Ҫ");
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body id="sendfile" onload="updateTree('li81');">
	<div id="container">
		<div id="tophead">
			<s:action name="top" executeResult="true"/>
		</div>
		<div id="leftcontent">
			<s:action name="leftTree" executeResult="true"/>
		</div>
		<div id="maincontent">
		<s:form onsubmit="return checkalarm();" theme="simple" action="sendAlarm" method="post">
			<table>
				<tr>
					<td>��&nbsp&nbsp&nbsp&nbsp�⣺</td>
					<td><s:textfield id="title" name="title" cssStyle="width:500px"/></td>
				</tr>
				<tr>
					<td>�������ţ�</td>
					<td><s:select name="deptNumber" id="deptlist" list="deptList" listKey="deptNumber" listValue="deptName"/> </td>
				</tr>
				<tr>
					<td>��ϸ��Ϣ��</td>
					<td><s:textarea id="detail" name="detail" cssStyle="width:500px;height:300px;"/></td>
				</tr>
				<tr>
					<td></td>
					<td><s:submit value="�ύ"/>&nbsp&nbsp&nbsp&nbsp<s:reset value="ȡ��"/></td>
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
