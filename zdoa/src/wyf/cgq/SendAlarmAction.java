package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import org.cometd.Bayeux;
import org.cometd.Channel;
import java.io.*;

public class SendAlarmAction extends SendAlarm1Action{
	private InsertDB insertDB;//����InsertDB������
	private String title;//���ڴ�ű������������
	private String detail;//���ڴ�ű�����ϸ���ݵ�����
	private String result;//���ڴ�ŷ��ͽ��������
	private String deptNumber;//���ڴ�ű������ŵ�����
	public void setInsertDB(InsertDB insertDB){//insertDB��setter����
		this.insertDB=insertDB;
	}
	public void setTitle(String title){
		this.title=title;
	}//title���Ե�setter����
	public String getTitle(){
		return this.title;
	}//title���Ե�getter����
	public void setDeptNumber(String deptNumber){
		this.deptNumber=deptNumber;
	}//deptNumber���Ե�setter����
	public String getDeptNumber(){
		return this.deptNumber;
	}//deptNumber���Ե�getter����
	public void setDetail(String detail){
		this.detail=detail;
	}//detail���Ե�setter����
	public String getDetail(){
		return this.detail;
	}//detail���Ե�getter����
	public String getResult(){
		return this.result;
	}//result���Ե�getter����
	public String execute(){
		String fromuser=((String)this.getSession().get("user")).trim();//��÷����߱��
		Alarm alarm=new Alarm();//����һ��Alarm����
		alarm.setTitle(this.title);
		alarm.setDetail(this.detail);
		alarm.setTime(new Date());
		alarm.setFromuser(fromuser);
		alarm.setDeptNumber(this.deptNumber);//��������Ӧ������
		this.insertDB.saveAlarm(alarm);//�����󱣴浽���ݿ�
		this.result="���ͳɹ�";//���ô�����
		alarmComet();//����alarmComet���������ͼ�ʱ����
		return "success";
	}
	public Map getSession(){
		return ActionContext.getContext().getSession();
	}//���session�ķ���
	private void alarmComet(){
		Bayeux b=(Bayeux)ActionContext.getContext().getApplication().get(Bayeux.DOJOX_COMETD_BAYEUX);
		Channel c= b.getChannel("/Alarm",true);//����ŵ�
		Map<String,String> message = new HashMap<String,String>();//����һ��map
		message.put("deptNumber",this.deptNumber);//�����ű�Ŵ���map
		c.publish(
			        b.newClient("server_user"),//���͵Ŀͻ�
			        message,//��Ϣ
			        "new_server_message" //��Ϣid
			     );
	}
}