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
			String.prototype.trim = function()
			{
			  return this.replace(/(^\s*)|(\s*$)/g, "");
			}
			function getreq(){
				if(window.XMLHttpRequest)
	              	{//IE֮��������
	              		req=new XMLHttpRequest();
	              		return req;
	             	}
	              	else
	              	{
	                	try
	                	{
	                  		req=new ActiveXObject("Msxml2.XMLHTTP");
	                  		return req;
	                	}
	                	catch(e)
	                	{
	                  		try
	                  		{
	                     		req=new ActiveXObject("Microsoft.XMLHTTP");
	                     		return req;
	                  		}
	                  		catch(e)
	                  		{
	                     		alert("���ܴ���XMLHttpRequest���󣡣���");
	                     		return "";
	                  		}
	                	}
	                
	              	}
			}
			function checkUnique()
			{
				var name=document.getElementById("name").value.trim();
				
				if(name!="")
				{
					var uri="userUnique.action?name="+escape(name);
					//��ʼ��XMLHttpRequest����
	              	req=getreq();
	              	if(req=="")
	              	{
	              		return "";
	              	}        
				  	req.open("post",uri,true);
				  	req.onreadystatechange=handleResponse;
	             	req.send(null);    
             	}
			}
			function handleResponse()
	        {
	          if(req.readyState==4)
	          {
	             if(req.status==200)
	             {
	                var msg=req.responseText;
	                if(msg.trim()=="no")
	                {
	                	alert("���û����Ѿ���ռ�ã���������д");
	                }
	             }
	          }
	        }
	        function updateGroup()
	        {
	        	var dept=document.getElementById("dept").value.trim();

	        	document.getElementById("roleL").innerHTML="\<select name=\"role\" id=\"role\" style=\"width:200px;\"\>\<option value=\"\"\>ѡ���ɫ\</option>\</select>"
	 
        		var uri="groupList.action?dept="+escape(dept);
				//��ʼ��XMLHttpRequest����
              	req=getreq();
              	if(req=="")
              	{
              		return "";
              	}        
			  	req.open("post",uri,true);
			  	req.onreadystatechange=handleResponse1;
             	req.send(null);
	        }
	        function handleResponse1()
	        {
	          if(req.readyState==4)
	          {
	             if(req.status==200)
	             {
	                var msg=req.responseText;
	                document.getElementById("groupL").innerHTML=msg;
	             }
	          }
	        }
	        function updateRole()
	        {
	        	var group=document.getElementById("group").value.trim();
        		var uri="roleList.action?group="+escape(group);
				//��ʼ��XMLHttpRequest����
              	req=getreq();
              	if(req=="")
              	{
              		return "";
              	}        
			  	req.open("post",uri,true);
			  	req.onreadystatechange=handleResponse2;
             	req.send(null);
	        }
	        function handleResponse2()
	        {
	          if(req.readyState==4)
	          {
	             if(req.status==200)
	             {
	                var msg=req.responseText;
	                document.getElementById("roleL").innerHTML=msg;
	             }
	          }
	        }
	        function checkAddUser()
	        {
	        	var name=document.getElementById("name").value.trim();
	        	var namepat=/^[0-9a-zA-Z_]{1,10}$/;
	        	if(name=="")
	        	{
	        		alert("�û�������Ϊ��");
	        		return false;
	        	}
	        	if(name.length>10)
	        	{
	        		alert("�û���̫��");
	        		return false;
	        	}
	        	if(!namepat.exec(name))
	        	{
	        		alert("�û���ֻ������ĸ���ֺ��»������");
	        		return false;
	        	}
	        	var pwd1=document.getElementById("pwd1").value.trim();
	        	if(pwd1=="")
	        	{
	        		alert("���벻��Ϊ��");
	        		return false;
	        	}
	        	var pwdpat=/^[0-9a-zA-Z_]{1,10}$/;
	        	if(!pwdpat.exec(pwd1))
	        	{
	        		alert("����ֻ����10λ���ڵ���ĸ���ֺ��»������");
	        		return false;
	        	}
	        	var pwd2=document.getElementById("pwd2").value.trim();
	        	if(pwd1!=pwd2)
	        	{
	        		alert("�����������벻һ��");
	        		return false;
	        	}
	        	var realName=document.getElementById("realName").value.trim();
	        	if(realName=="")
	        	{
	        		alert("��ʵ��������Ϊ��");
	        		return false;
	        	}
	        	if(realName.length>10)
	        	{
	        		alert("��ʵ����������������ȷ��");
	        		return false;
	        	}
	        	var birth=document.getElementById("birth").value.trim();
	        	var birthpat=/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
	        	if(!birthpat.exec(birth))
	        	{
	        		alert("�������ڸ�ʽ����ȷ������ȷ��");
	        		return false;
	        	}
	        	var role=document.getElementById("role").value.trim();
	        	if(role=="")
	        	{
	        		alert("��ѡ��Ա���Ĺ���ְλ");
	        		return false;
	        	}
	        	var email=document.getElementById("email").value.trim();
	        	var emailpat=/^[.-_a-zA-Z0-9]+@[-_a-zA-Z0-9]+\.[.a-zA-Z0-9]+$/;
	        	if(!emailpat.exec(email))
	        	{
	        		alert("�����ʽ����ȷ������");
	        		return false;
	        	}
	        	var tel=document.getElementById("tel").value.trim();
	        	var telpat=/^[0-9]{7,20}$/;
	        	if(!telpat.exec(tel))
	        	{
	        		alert("��ϵ�绰��ʽ����ȷ������");
	        		return false;
	        	}
	        	var salary=document.getElementById("salary").value.trim();
	        	var salarypat=/^[0-9]{1,5}[\.]?[0-9]{0,2}$/;
	        	if(!salarypat.exec(salary))
	        	{
	        		alert("����н����д��������");
	        		return false;
	        	}
	        	if(salary>99999.99||salary<0)
	        	{
	        		alert("����н�ʳ�����Χ");
	        		return false;
	        	}
	        	var jianli=document.getElementById("jianli").value.trim();
	        	if(jianli=="")
	        	{
	        		alert("���˼�������Ϊ��");
	        		return false;
	        	}
	        	if(jianli.length>2000)
	        	{
	        		alert("���˼���̫��");
	        		return false;
	        	}
	        	return true;
	        }
		</script>
	
	</head>
	<body id="sendfile" onload="updateTree('li51');">
	<div id="container">
		<div id="tophead">
			<s:action name="top" executeResult="true"/>
		</div>
		<div id="leftcontent">
			<s:action name="leftTree" executeResult="true"/>
		</div>
		<div id="maincontent">
		<s:form action="addUser2" theme="simple" onsubmit="return checkAddUser();" method="post" enctype="multipart/form-data">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr style="height:40px;">
					<td align="right" style="width:120px;border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�û�����</td>
					<td style="width:230px;border-bottom:#a8cde4 solid 1px;"><s:textfield name="name" id="name" cssStyle="width:200px;" onblur="checkUnique();"/></td>
					<td style="width:400px;border-bottom:#a8cde4 solid 1px;">����ĸ�����ֻ��»�����ɣ��Ҳ��ܳ���10λ������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">���룺</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:password name="pwd1" id="pwd1" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;width:450px;">����ĸ�����ֻ��»�����ɣ��Ҳ��ܳ���10λ������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�ٴ��������룺</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:password name="pwd2" id="pwd2"  cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">����ĸ�����ֻ��»�����ɣ��Ҳ��ܳ���10λ������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">��ʵ������</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield id="realName" name="realName" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��д������ʵ����������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�Ա�</td>
					<td style="border-bottom:#a8cde4 solid 1px;">
						<s:select id="gender" cssStyle="width:50px;" name="gender" list="#{'��':'��','Ů':'Ů'}" listKey="key" listValue="value"/>
				
					</td>
					<td style="border-bottom:#a8cde4 solid 1px;">ѡ���Ա𣬱���</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�������ڣ�</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield id="birth" name="birth" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ʽΪYYYY-MM-DD,��2009-01-17��ʾ2009��1��17��</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�������ţ�</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:select name="dept" id="dept" onchange="updateGroup();" cssStyle="width:200px;" list="deptList" listKey="deptNumber" listValue="deptName"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ѡ��</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�����飺</td>
					<td style="border-bottom:#a8cde4 solid 1px;"  id="groupL"><s:select id="group" name="group" onchange="updateRole();" cssStyle="width:200px;" list="groupList" listKey="groupNumber" listValue="groupName"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ѡ��</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">ְλ��ɫ��</td>
					<td id="roleL" style="border-bottom:#a8cde4 solid 1px;"><s:select name="role" id="role" cssStyle="width:200px;" list="roleList" listKey="roleNumber" listValue="roleName"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ѡ��</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�������䣺</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield name="email" id="email" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ʽ������ȷ</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�绰��</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield id="tel" name="tel"  cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">����д����õ���ϵ���绰</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�������ʣ�</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield name="salary" id="salary" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�ϴ�ͷ��</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:file name="pic" id="pic" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ѡ��</td>
				</tr>
				<tr>
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">���˼�����</td>
					<td colspan="2" style="border-bottom:#a8cde4 solid 1px;"><s:textarea name="jianli" id="jianli" cssStyle="width:610px;height:250px;"/></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><s:submit value="�ύ"/>&nbsp&nbsp&nbsp&nbsp&nbsp<s:reset value="ȡ��"/></td>
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
