<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>������ҳ</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<link href="css/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="css/sendFile.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript" src="javascript/position.js"></script>
		<script language="JavaScript">
		function changepwd()
		{
			var oldpwd=document.getElementById("oldpwd").value.trim();
			if(oldpwd=="")
			{
				alert("�����벻��Ϊ�գ���");
				return false;
			}
			var newpwd1=document.getElementById("newpwd1").value.trim();
			if(newpwd1=="")
			{
				alert("�����벻��Ϊ��");
				return false;
			}
			var pwdpat=/^[0-9a-zA-Z_]{1,10}$/;
        	if(!pwdpat.exec(newpwd1))
        	{
        		alert("����ֻ����10λ���ڵ���ĸ���ֺ��»������");
        		return false;
        	}
        	var newpwd2=document.getElementById("newpwd2").value.trim();
        	if(newpwd1!=newpwd2)
        	{
        		alert("��������������벻ƥ��");
        		return false;
        	}
        	return true;
		}
		</script>
	</head>
	<body id="sendfile" onload="updateTree('li71');">
	<div id="container">
		<div id="tophead">
			<s:action name="top" executeResult="true"/>
		</div>
		<div id="leftcontent">
			<s:action name="leftTree" executeResult="true"/>
		</div>
		<div id="maincontent">
		<s:form onsubmit="return changepwd();" theme="simple" method="post" action="changePwd">
			<table align="center" style="width:550px;border-bottom:#a8cde4 solid 2px;border-left:#a8cde4 solid 2px;border-right:#a8cde4 solid 2px;margin:0 auto 40px auto;">
				<caption style="text-align:center;margin:0 auto;font-size:21px;color:#154ba0;background-color:#a8cde4">�޸�����</caption>
				<tr style="height:30px;">
					<td align="right">�����룺</td>
					<td><s:password id="oldpwd" name="oldpwd"/></td>
					<td>����������ԭʼ���룬��ȷ���������</td>
				</tr>
				<tr style="height:30px;">
					<td align="right">�����룺</td>
					<td><s:password id="newpwd1" name="newpwd1"/></td>
					<td>��������10λ���ڵ���ĸ���ֻ��»������</td>
				</tr>
				<tr style="height:30px;">
					<td align="right">ȷ�������룺</td>
					<td><s:password id="newpwd2" name="newpwd2"/></td>
					<td>������������д��������һ��</td>
				</tr>
				<tr>
					<td></td>
					<td><s:submit value="ȷ��"/>&nbsp&nbsp&nbsp&nbsp<s:reset value="ȡ��"/></td>
					<td></td>
				</tr>
			</table>
		</s:form>
		</div>
		<script language="JavaScript">
		var result="<s:property value="result"/>";
		if(result!=""){
			alert(result);
		}
		</script>
	</div>
	</body>
</html>
