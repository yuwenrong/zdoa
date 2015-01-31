String.prototype.trim = function()
{
  return this.replace(/(^\s*)|(\s*$)/g, "");
}
function getElementPos(elementId) 
{      
	var ua = navigator.userAgent.toLowerCase();     
	var isOpera = (ua.indexOf('opera') != -1);     
	var isIE = (ua.indexOf('msie') != -1 && !isOpera); 
	// not opera spoof      
	var el = document.getElementById(elementId);      
	if(el.parentNode == null || el.style.display == 'none')     
 	{	 	         
 	         return false;     
 	}     
 	var parent = null;     
	var pos = [];     
	var box;
 	if(el.getBoundingClientRect)    
	{ //IE     
        box = el.getBoundingClientRect(); 
        var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop); 
        var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft); 
        return {x:box.left+ scrollLeft, y:box.top + scrollTop,w:box.right-box.left,h:box.bottom-box.top};    
        
	}     
	else if(document.getBoxObjectFor)         
	{ // FireFox
        box = document.getBoxObjectFor(el);                                  
        var borderLeft = (el.style.borderLeftWidth)?parseInt(el.style.borderLeftWidth):0;
        var borderTop = (el.style.borderTopWidth)?parseInt(el.style.borderTopWidth):0;
        pos = [box.x - borderLeft, box.y - borderTop,box.width,box.height];     
	}     
	else     
	{ 
   		// safari & opera
    	pos = [el.offsetLeft,el.offsetTop,el.offsetWidth,el.offsetHeight];
    	parent = el.offsetParent;
    	if (parent != el) 
    	{             
        	while (parent) 
        	{                 
           		pos[0] += parent.offsetLeft;
           		pos[1] += parent.offsetTop;
           		parent = parent.offsetParent;             
        	}         
		}         
		if (ua.indexOf('opera')!=-1||( ua.indexOf('safari')!=-1 && el.style.position == 'absolute' ))
		{                 
			pos[0] -= document.body.offsetLeft;                 
			pos[1] -= document.body.offsetTop;         
		}  
		return {x:pos[0]+2,y:pos[1]+2,w:pos[2],h:pos[3]};      
	}              
	if (el.parentNode) 
	{ 
		parent = el.parentNode; 
	}
	else { parent = null; } 
	while (parent && parent.tagName != 'BODY' && parent.tagName != 'HTML')
	{ // account for any scrolled ancestors         
		pos[0] -= parent.scrollLeft;         
		pos[1] -= parent.scrollTop;		       
		if (parent.parentNode) 
		{ 
			parent = parent.parentNode; 
		}          
		else 
		{ 
			parent = null; 
		}     
	}
	return {x:pos[0],y:pos[1],w:pos[2],h:pos[3]}; 
}
function showErrMsg(msg,id)//msgΪ������Ϣ�ı�===idΪ��������ؼ�id
{
   //��ȡ��������ؼ���λ�á��ߴ�
   tfpos=getElementPos(id);
   xby=tfpos.y+tfpos.h-1;
   xbx=tfpos.x+tfpos.w/2;
   
   //��ʾ������Ϣ���
   var messagetable=document.getElementById("myerr");
   messagetable.style.left=xbx-70;
   messagetable.style.top=xby+18;
   var messagearea=document.getElementById("myerrs");
   messagearea.innerHTML=msg; 
   messagetable.style.visibility="visible"; 
   
   //��ʾ����ϵļ��ͼƬ
   var myup=document.getElementById("myup");
   myup.style.left=xbx-40;
   myup.style.top=xby-2;  
   myup.style.visibility="visible";
   
   //��ȡ������Ϣ���λ�á��ߴ�
   bgpos=getElementPos("myerr");
   
   //��ʾ�ڵ�span
   var errzd=document.getElementById("errzd");
   errzd.style.left=xbx-70;
   errzd.style.top=xby+18;
   errzd.style.width=bgpos.w;
   errzd.style.height=bgpos.h;
   errzd.style.visibility="visible";
   
   //�����ڵ�����
   zdcount=5;
   span=bgpos.h/zdcount;
   setTimeout("xyzd("+span+","+(xby+18)+")",0);
}

//�������ڵ���
function xyzd(span,top)
{  
	 document.getElementById("errzd")         
   if(zdcount==0)
   {
      document.getElementById("errzd").style.visibility="hidden";
   }
   else
   {
     document.getElementById("errzd").style.height=span*zdcount; 
     document.getElementById("errzd").style.top=top+span*(5-zdcount); 
     zdcount--;           
     setTimeout("xyzd("+span+","+top+")",50);
   }           
}
        
//���ش�����Ϣ����		   
function hideErr()
{
    document.getElementById("myerr").style.visibility="hidden"; 
    document.getElementById("myup").style.visibility="hidden";
    document.getElementById("errzd").style.visibility="hidden";
}


function updateTree(id)
{
	document.getElementById(id).style.display="block";
}
function changePic(pic)
{
	var com=document.getElementById(pic);
	var height=175.0;
	var width=200.0;
	var pheight=com.height;
	var pwidth=com.width;
	if(pheight/height>pwidth/width)
	{
		if(pheight>height)
		{
			com.height=pheight/(pheight/height);
			com.width=pwidth/(pheight/height);
		}
	}
	else
	{
		if(pwidth>width)
		{
			com.height=pheight/(pwidth/width);
			com.width=pwidth/(pwidth/width);
		}
	}

}

function realtime()
{
	var com=document.getElementById("time");
	var top=document.getElementById("now");
	var date=new Date();
	var year=date.getYear()+1900;
	var month=date.getMonth()+1;
	var day=date.getDate();
	var hour=date.getHours();
	var min=date.getMinutes();
	var second=date.getSeconds();
	var d=date.getDay();
	var xq="";
	if(d==1){xq='һ'}
	else if(d==2){xq='��'}
	else if(d==3){xq='��'}
	else if(d==4){xq='��'}
	else if(d==5){xq='��'}
	else if(d==6){xq='��'}
	else if(d==0){xq='��'}
	if(com!=null)
	{
		com.innerHTML=year+"��"+month+"��"+day+"�� "+hour+":"+min+":"+second+" ����"+xq;
	}
	if(top!=null)
	{
		top.innerHTML=year+"��"+month+"��"+day+"�� "+hour+":"+min+":"+second+" ����"+xq;
	}
	setTimeout('realtime()',1000);
	
}