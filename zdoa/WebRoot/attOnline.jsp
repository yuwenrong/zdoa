<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>���߿���</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<link href="css/mainstyle.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript" src="javascript/position.js"></script>
		<script language="JavaScript">
			
			
		</script>
	</head>
	<body onload="updateTree('li91');realtime();">
	<div id="container">
		<div id="tophead">
			<s:action name="top" executeResult="true"/>
		</div>
		<div id="leftcontent">
			<s:action name="leftTree" executeResult="true"/>
		</div>
		<div id="maincontent">
			<table width="100%" style="border:1px solid #154ba0;">
				<tr style="background-color:#eff5fb;color:#154ba0;font-size:18px;font-weight:500">
					<td align="center">���߿���</td>
				</tr>
				<tr style="color:#154ba0;">
					<td align="center"><img src="images/time.gif">&nbsp<span id="time"></span></td>
				</tr>
				 <tr style="color:#154ba0;">
				 	<td>
				 		�ϰ�ʱ���:<s:property value="start"/>&nbsp �� &nbsp <s:property value="end"/>
				 	</td>
				 </tr>
				 <tr>
				 	<td align="center">
				 		<table width="95%" cellpadding="0" cellspacing="0" style="border:1px solid #154ba0;">
				 			<tr style="height:25px;background-color:#eff5fb;font-weight:500;font-size:15px;">
				 				<td style="border-right:1px solid #154ba0;border-bottom:1px solid #154ba0;" align="center">����</td>
				 				<td style="border-right:1px solid #154ba0;border-bottom:1px solid #154ba0;" align="center">����</td>
				 				<td style="border-right:1px solid #154ba0;border-bottom:1px solid #154ba0;" align="center">����IP</td>
				 				<td style="border-bottom:1px solid #154ba0;" align="center">״̬</td>
				 			</tr>
				 			<tr style="height:25px;">
				 				<td style="color:#154ba0;border-right:1px solid #154ba0;border-bottom:1px solid #154ba0;" align="center"><s:property value="attUser"/></td>
				 				<td style="color:#154ba0;border-right:1px solid #154ba0;border-bottom:1px solid #154ba0;" align="center"><s:property value="attDept"/></td>
				 				<td style="color:#154ba0;border-right:1px solid #154ba0;border-bottom:1px solid #154ba0;" align="center"><s:property value="cIp"/></td>
				 				<td align="center" style="border-bottom:1px solid #154ba0;">
				 					<s:if test="attStart==0"><span style="color:#154ba0;">�ϰ���δ����</span></s:if>
				 					<s:else>
				 						<s:if test="attStart==2"><span style="color:#154ba0;">�ϰఴʱ����</span></s:if>
				 						<s:else><span style="color:#f00;">�ϰ࿼�ڳٵ�</span></s:else>
				 					</s:else>
				 					&nbsp|&nbsp
				 					<s:if test="attEnd==0"><span style="color:#154ba0;">�°���δ����</span></s:if>
				 					<s:else>
				 						<s:if test="attEnd==2"><span style="color:#154ba0;">�°ఴʱ����</span></s:if>
				 						<s:else><span style="color:#f00;">�°࿼������</span></s:else>
				 					</s:else>
				 				</td>
				 			</tr>
				 			<tr>
				 				<td colspan="4" style="height:30px;" align="right">
				 				<br>
				 					<s:if test="attStart==0">
				 						<s:form theme="simple" action="kaoQin" method="post">
				 							<s:hidden name="type" value="0"/>
				 							<s:submit value="�ϰ࿼��"/>
				 						</s:form>
				 					</s:if>
				 					<s:else>
				 						<s:if test="attEnd==0">
					 						<s:form theme="simple" action="kaoQin" method="post">
					 							<s:hidden name="type" value="1"/>
					 							<s:submit value="�°࿼��"/>
					 						</s:form>
				 						</s:if>
				 					</s:else>
				 					<br>
				 				</td>
				 			</tr>
				 		</table>
				 	</td>
				 </tr>
			</table>
		</div>
	</div>
	</body>
</html>
