<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>�ύ����</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<link href="css/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="css/sendFile.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript" src="javascript/position.js"></script>
		<script language="JavaScript">
			function changeDoc()
			{
				var type=document.getElementById("type").value;
				if(type==1)
				{
					document.getElementById("second").style.visibility="hidden";
				}
				else
				{
					document.getElementById("second").style.visibility="visible";
				}
			}
			function checkdoc()
			{
				var type=document.getElementById("type").value;
				var first=false;
				var second=false;
				if(type==2)
				{
					for(var i = 1;i < 7;i++)
					{
						f=document.getElementById("firstList-"+i).checked;
						s=document.getElementById("secondList-"+i).checked;
						if(f==true)
						{
							first=true;
						}
						if(s==true)
						{
							second=true;
						}
						if(f==s && f==true)
						{
							alert("һ����������������в��������ظ��Ĳ���");
							return false;
						}
					}
					if(first==false)
					{
						alert("һ���������Ų���Ϊ��");
						return false;
					}
					if(second==false)
					{
						alert("�����������Ų���Ϊ��");
						return false;
					}
					var topic=document.getElementById("topic").value;
					if(topic=="")
					{
						alert("�������ⲻ��Ϊ��");
						return false;
					}
					var content=document.getElementById("content").value;
					if(content=="")
					{
						alert("�������ⲻ��Ϊ��");
						return false;
					}
					return true;
				}
				else
				{
					for(var i = 1;i < 7;i++)
					{
						f=document.getElementById("firstList-"+i).checked;
						if(f==true)
						{
							var topic=document.getElementById("topic").value;
							if(topic=="")
							{
								alert("�������ⲻ��Ϊ��");
								return false;
							}
							var content=document.getElementById("content").value;
							if(content=="")
							{
								alert("�������ݲ���Ϊ��");
								return false;
							}
							return true;
						}
					}
				}
				alert("�������Ų���Ϊ��");
				return false;
				
			}
				
		</script>
	</head>
	<body onload="updateTree('li41');changeDoc()">
	<div id="container">
		<div id="tophead">
			<s:action name="top" executeResult="true"/>
		</div>
		<div id="leftcontent">
			<s:action name="leftTree" executeResult="true"/>
		</div>
		<div id="maincontent">
		<s:form action="sendDoc2" onsubmit="return checkdoc();" theme="simple" method="post">
			<table>
				<tr>
					<td>�������ͣ�</td>
					<td><s:select name="type" id="type" list="#{'1':'һ������','2':'��������'}" listKey="key" listValue="value" onchange="changeDoc();"/></td>
				</tr>
				<tr>
					<td>һ���������ţ�</td>
					<td>
						<s:checkboxlist id="firstList" name="firstList" list="deptList" listKey="deptNumber" listValue="deptName"/>
					</td>
				</tr>
				<tr id="second">
					<td>�����������ţ�</td>
					<td>
						<s:checkboxlist id="secondList" name="secondList" list="deptList" listKey="deptNumber" listValue="deptName"/>
					</td>
				</tr>
				<tr>
					<td>�������⣺</td>
					<td><s:textfield name="topic" id="topic" cssStyle="width:500px"/></td>
				</tr>
				<tr>
					<td>�������ݣ�</td>
					<td><s:textarea name="content" id="content" cssStyle="width:600px;height:300px;"/></td>
				</tr>
				<tr>
					<td></td>
					<td><s:submit value="��  ��" cssStyle="width:70px"/>&nbsp&nbsp&nbsp&nbsp&nbsp<s:reset value="ȡ  ��" cssStyle="width:70px"/></td>
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
