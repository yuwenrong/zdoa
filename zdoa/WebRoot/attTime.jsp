<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>����ʱ��</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<link href="css/mainstyle.css" rel="stylesheet" type="text/css"/>
		<style>
		 .jd{
		         position:absolute;
		         visibility:hidden;
	        }
	     
	     .Blur {
	     	filter: Alpha(opacity=20);
				  -moz-opacity:0.2;
				  opacity:0.2;
		 
	      }	
	     .NoBlur{}
     </style>
		<script language="JavaScript" src="javascript/position.js"></script>
		<script language="JavaScript">
			function showtable()
			{
				var tab=document.getElementById("dcdetail");
				pos=getElementPos("maincontent");
				tab.style.top=pos.y+5;
                tab.style.left=pos.x+5;
				tab.style.visibility="visible";
				document.getElementById("maincontent").className="Blur";
			}
			function closetable()
			{
				var tab=document.getElementById("dcdetail");
				tab.style.visibility="hidden";
				document.getElementById("maincontent").className="NoBlur";
			}
		</script>
	</head>
	<body id="sendfile" onload="updateTree('li91');">
	<div id="container">
		<div id="tophead">
			<s:action name="top" executeResult="true"/>
		</div>
		<div id="leftcontent">
			<s:action name="leftTree" executeResult="true"/>
		</div>
		<div id="maincontent">
			<table style="font-size:14px;width:400px;height:130px;">
				<tr>
					<td rowspan="3" style="width:200px;"><img src="images/png-0571.png"></td>
					<td>�ϰ࿼��ʱ�䣺</td>
					<td><s:property value="startTime"/></td>
				</tr>
				
				<tr>
					<td>�°࿼��ʱ�䣺</td>
					<td><s:property value="endTime"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<s:submit onclick="showtable();" value=" �� �� " theme="simple"/>
					</td>
				</tr>
			</table>
			
		</div>
	</div>
	<table cellpadding="0" cellspacing="0" style="border:6px solid #a8cde4;height:130px;width:400px;font-size:14px;color:#154ba0;background-color:#eff5fb;"  class="jd" id="dcdetail">
		<tr style="height:20px;background-color:#a8cde4">
			<td>�޸Ŀ���ʱ��</td>
			<td valign="top" align="right">
				<img id="closeimg"
                 src="images/close2.gif" 
                 onclick="closetable()"
                 onmouseover="document.all.closeimg.src='images/close_g.gif'"
                 onmouseout="document.all.closeimg.src='images/close2.gif'">
			</td>
		</tr>
		<s:form theme="simple" method="post" action="changeAtt">
		<tr>
		
			<td colspan="2">
				�ϰ࿼��ʱ�䣺<s:select name="startHour" list="hourList"/>&nbspʱ&nbsp<s:select name="startMin" list="minList"/>&nbsp��
			</td>
		</tr>
		<tr>
			<td colspan="2">
				�°࿼��ʱ�䣺<s:select name="endHour" list="hourList"/>&nbspʱ&nbsp<s:select name="endMin" list="minList"/>&nbsp��
			</td>
		</tr>
		<tr>
			<td colspan="2">
				&nbsp&nbsp<s:submit value="ȷ��"/>&nbsp<s:reset onclick="closetable();" value="ȡ��"/>
			</td>
		</tr>
		</s:form>
	</table>
	</body>
</html>
