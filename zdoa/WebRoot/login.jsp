<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>��¼ҳ��</title>
		<link href="css/login.css" rel="stylesheet" type="text/css"/>
		<link rel="Shortcut Icon" href="images/chinaz1.ico" type="image/x-icon" />
		<script language="JavaScript" src="javascript/login.js"></script>
		<script language="JavaScript" src="javascript/position.js"></script>
	</head>
	<body>
	<div id="container">
		<div id="topimg">
			<img src="images/login_main.jpg">
		</div>
		
		<div id="loginmain">
		<s:form action="login" theme="simple" method="post" onsubmit="return check();">
			<table align="center">
				<tr>
					<td>�û���:</td>
					<td><s:textfield id="uid" name="uid"/></td>
					
				</tr>
				<tr>
					<td>��&nbsp&nbsp��:</td>
					<td><s:password id="pwd" name="pwd"/></td>
					
				</tr>
				
				<tr>
					<td>��֤��:</td>
					<td valign="middle">
						<s:textfield id="yanzhengma" name="yanzhengma"/>
						<a href="#" onclick="change();"><img id="yanzhengmatu" src="yanzhengma.jsp" style="border:0px;" alt="�����һ��"></a>
						<a href="#" onclick="change();" style="position:absolute;margin-left:60px;margin-top:2px;">��һ��</a>
					</td>
					
				</tr>
				<tr>
					<td colspan="2" align="center">
						<s:submit value="�� ¼" id="submit" cssClass="loginbutton"/>&nbsp&nbsp
						<s:reset value="�� ��" cssClass="resetbutton"/>
					</td>
					
				</tr>
			</table>
			<s:textfield id="result" name="result" cssStyle="display:none"/>
		</s:form>
		</div>
	</div>
	<!-- ����������ʾ��ʾ��Ϣ������ -->
	  <table id="myerr" style="background-color:red;" width="120" border="0" class="jd" bgcolor="black" cellspacing="1" onclick="hideErr();">
		  <tr bgcolor="white" style="border-color:red;"  valign="bottom">
		    	<td id="myerrs" align="left"></td>
		  </tr>
	  </table>
	  <!-- ������Ϣ����ļ�� -->
	  <img class="jd" src="images/up.gif" id="myup" onclick="hideErr();" /> 	  
	  <!-- ������Ϣ�����𽥳��ֵ��ڵ��� -->
	  <span id="errzd" style="z-index:2;visibility:hidden;position:absolute;left:20;top:30;font-size:1px;background-color:white"/>	
		
		<script language="JavaScript">
			errMsg="<s:fielderror template="myfielderror"/>";
	        if(errMsg!="")
	        {//���д�����Ϣ����ô�����Ϣ������ʾ
	           showErrMsg(errMsg,"submit");                   
	        }
			var result=document.getElementById("result").value;
			if(result!="")
			{	
				showErrMsg(result,"yanzhengma");
			}
		</script>	
	</body>
</html>