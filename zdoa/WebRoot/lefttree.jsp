<%@ page contentType="text/html; charset=GBK" %>
<%@taglib prefix="s" uri="/struts-tags"%>
		<link href="css/treeStyle.css" type="text/css" rel="stylesheet"/>
		<script language="javaScript">
			function changetree(id)
			{
				for(var i=1;i<10;i++)
				{
					if(id!="li"+i)
					{
						if(document.getElementById("li"+i+1)!=null)
						{
							document.getElementById("li"+i+1).style.display="none";
						}
					}
					else
					{
						var opdiv=document.getElementById(id+1);
						var display_value=opdiv.style.display;
						if(display_value=="none")
						{
							opdiv.style.display="block";
						}
						else
						{
							opdiv.style.display="none";
						}
					}
				}	
			}
		</script>
		
		<div id="lefttree">
		<ul>
			<li id="li1" ><a onclick="changetree('li1');" href="#">�ļ�����</a></li>
			<div id="li11" class="lidiv" style="display:none;">
				<a href="receiveFile.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/001.gif"><br>�����ļ�</a><br>
				<a href="sendFile.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/002.gif"><br>�����ļ�</a><br>	
			</div>
			
			<li id="li2"><a onclick="changetree('li2');" href="#">��ҵ����</a></li>
			<div id="li21" class="lidiv" style="display:none;">
				<a href="viewShare.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/003.gif"><br>�鿴����</a><br>
				<a href="uploadShare.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/004.gif"><br>�ϴ�����</a><br>
				<s:if test="right==3">
				<a href="manageShare.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/005.gif"><br>������</a><br>	
				</s:if>
			</div>
			
			<li id="li3"><a onclick="changetree('li3');" href="#">��Ϣ����</a></li>
			<div id="li31" class="lidiv" style="display:none;">
				<a href="receiveMessage.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/006.gif"><br>������Ϣ</a><br>
				<a href="sendMessage.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/007.gif"><br>������Ϣ</a><br>
			</div>
			
			<li id="li4"><a onclick="changetree('li4');" href="#">��������</a></li>
			<div id="li41" class="lidiv" style="display:none;">
				<s:if test="right==3">
				<a href="viewDoc.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/009.gif"><br>��������</a><br>
				<a href="sendDoc.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/010.gif"><br>��������</a><br>
				<a href="allDoc.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/011.gif"><br>��������</a><br>
				<a href="myDoc.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/012.gif"><br>�ҵ�����</a><br>
				</s:if>
				<s:else>
					<s:if test="right==2">
						<a href="viewDoc.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/009.gif"><br>��������</a><br>
						<a href="sendDoc.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/010.gif"><br>��������</a><br>
						<a href="myDoc.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/012.gif"><br>�ҵ�����</a><br>
					</s:if>
					<s:else>
						<a href="sendDoc.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/010.gif"><br>��������</a><br>
						<a href="myDoc.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/012.gif"><br>�ҵ�����</a><br>
					</s:else>
				</s:else>	
			</div>
			
			<li id="li9"><a onclick="changetree('li9');" href="#">���ڹ���</a></li>
			<div id="li91" class="lidiv" style="display:none;">
				<s:if test="right==3">
				<a href="attTime.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/008.gif"><br>����ʱ��</a><br>
				<a href="viewAtt.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/013.gif"><br>���ڲ�ѯ</a><br>
				</s:if>
				<a href="attOnline.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/012.gif"><br>���߿���</a><br>
			</div>
			
			<s:if test="right==3">
			<li id="li5"><a onclick="changetree('li5');" href="#">������Դ</a></li>
			<div id="li51" class="lidiv" style="display:none;">
				<a href="addUser.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/014.gif"><br>���Ա��</a><br>
				<a href="viewUser.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/015.gif"><br>Ա������</a><br>
			</div>
			</s:if>
			
			<li id="li6"><a onclick="changetree('li6');" href="#">�����ʼ�</a></li>
			<div id="li61" class="lidiv" style="display:none;">
				<a href="sendEmail.jsp"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/016.gif"><br>�����ʼ�</a><br>
			</div>
			
			<li id="li8"><a onclick="changetree('li8');" href="#">��������</a></li>
			<div id="li81" class="lidiv" style="display:none;">
				<a href="sendAlarm1.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/010.gif"><br>��������</a><br>
				<s:if test="right==3">
				<a href="viewAlarm.action"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/011.gif"><br>�鿴����</a><br>
				</s:if>
				
			</div>
			
			<li id="li7"><a onclick="changetree('li7');" href="#">ϵͳ����</a></li>
			<div id="li71" class="lidiv" style="display:none;">
				<a href="changePwd.jsp"><img class="nomal" onmousedown="this.className='Down'" onmouseover="this.className='Up'" onmouseout="this.className='nomal'" src="images/left/017.gif"><br>�޸�����</a><br>
			</div>
			
		</ul>
		</div><br><br>
		<div id="marq" style="width:190px;text-align:center;margin:0 auto;background-color:#fff;">
		
					<MARQUEE onmouseover=this.stop() onmouseout=this.start() 
                  		trueSpeed scrollAmount=1 scrollDelay=40 direction=up 
                 		 height=180>
                 		 <center>
                 		 <s:if test="right==3">
		                <a href="receiveFile.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="sendFile.action">�� �� �� ��</a><br>	
						<a href="viewShare.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="uploadShare.action">�� �� �� ��</a><br>
						<a href="manageShare.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="receiveMessage.action">�� �� �� Ϣ</a><br>
						<a href="sendMessage.action">�� �� �� Ϣ</a>&nbsp&nbsp|&nbsp&nbsp<a href="#">�� �� �� ��</a><br>
						<a href="viewDoc.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="sendDoc.action">�� �� �� ��</a><br>
						<a href="allDoc.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="myDoc.action">�� �� �� ��</a><br>
						<a href="attTime.action">�� �� ʱ ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="attOnline.action">�� �� �� ��</a><br>
						<a href="viewAtt.action">�� �� �� ѯ</a>&nbsp&nbsp|&nbsp&nbsp<a href="addUser.action">�� �� Ա ��</a><br>
						<a href="viewUser.action">Ա �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="sendEmail.jsp">�� �� �� ��</a><br>
						<a href="sendAlarm1.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="viewAlarm.action">�� �� �� ��</a><br>
						<a href="changePwd.jsp">�� �� �� ��</a>
						</s:if>
						<s:else>
						<s:if test="right==2">
						<a href="receiveFile.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="sendFile.action">�� �� �� ��</a><br>	
						<a href="viewShare.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="uploadShare.action">�� �� �� ��</a><br>
						<a href="sendMessage.action">�� �� �� Ϣ</a>&nbsp&nbsp|&nbsp&nbsp<a href="receiveMessage.action">�� �� �� Ϣ</a><br>
						<a href="viewDoc.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="sendDoc.action">�� �� �� ��</a><br>
						<a href="myDoc.action">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="attOnline.action">�� �� �� ��</a><br>
						<a href="sendEmail.jsp">�� �� �� ��</a>&nbsp&nbsp|&nbsp&nbsp<a href="sendAlarm1.action">�� �� �� ��</a><br>
						<a href="changePwd.jsp">�� �� �� ��</a>
						</s:if>
						<s:else>
						<a href="receiveFile.action">�� &nbsp �� &nbsp �� &nbsp ��</a><br><a href="sendFile.action">�� &nbsp �� &nbsp �� &nbsp ��</a><br>	
						<a href="viewShare.action">�� &nbsp  �� &nbsp  �� &nbsp  ��</a><br><a href="uploadShare.action">�� &nbsp �� &nbsp �� &nbsp ��</a><br>
						<a href="sendMessage.action">�� &nbsp �� &nbsp �� &nbsp Ϣ</a><br><a href="receiveMessage.action">�� &nbsp �� &nbsp �� &nbsp Ϣ</a><br>
						<a href="sendDoc.action">�� &nbsp �� &nbsp �� &nbsp ��</a><br>
						<a href="myDoc.action">�� &nbsp �� &nbsp ��  &nbsp ��</a><br><a href="attOnline.action">��  &nbsp �� &nbsp ��&nbsp  ��</a><br>
						<a href="sendEmail.jsp">�� &nbsp �� &nbsp �� &nbsp ��</a><br><a href="sendAlarm1.action">�� &nbsp �� &nbsp �� &nbsp ��</a><br>
						<a href="changePwd.jsp">�� &nbsp �� &nbsp �� &nbsp ��</a>
						</s:else>
						</s:else>
					    </center>
					</MARQUEE>
		</div>
		
		
		

