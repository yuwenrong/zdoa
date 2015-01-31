package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
import java.math.*;
public class AlarmDetailAction{
	private SearchDB searchDB;//����SearchDB������
	private InsertDB insertDB;//����InsertDB������
	private String alarmNumber;//���ڴ�ű�����ŵ�����
	private Alarm alarm;//����һ��Alarm���������
	private int currenPage;//���CurrenPage
	
	public void setSearchDB(SearchDB searchDB){//searchDB��setter����
		this.searchDB=searchDB;
	}
	public void setInsertDB(InsertDB insertDB){//insertDB��setter����
		this.insertDB=insertDB;
	}
	public void setAlarmNumber(String alarmNumber){//������ŵ�setter����
		this.alarmNumber=alarmNumber.trim();
	}
	public Alarm getAlarm(){//���Alarm����ķ���
		return this.alarm;
	}
	public void setCurrenPage(int currenPage){//currenPage��setter����
		this.currenPage=currenPage;
	}
	public int getCurrenPage(){//currenPage��getter����
		return this.currenPage;
	}
	public String execute(){//��д��execute����
		String sql1="update oa_alarm set alarm_state=1 where alarm_number='"+this.alarmNumber+"'";
		this.insertDB.update(sql1);
		String sql2="select oa_alarm.alarm_title,oa_alarm.alarm_time,"+
					"oa_user.user_realname,oa_dept.dept_name,"+
					"oa_alarm.alarm_detail from "+
					"oa_alarm,oa_user,oa_dept where oa_alarm.alarm_fromuser="+
					"oa_user.user_number and oa_alarm.alarm_dept=oa_dept.dept_number "+
					"and oa_alarm.alarm_number='"+this.alarmNumber+"'";
		List list=this.searchDB.getArrayList(sql2);//����searchDB�ķ�����������б�
		Object[] o=(Object[])list.get(0);//��õ�һ������
		alarm=new Alarm((String)o[0],(Date)o[1],(String)o[2],
						(String)o[3],(String)o[4]);//��֯Alarm����
		return "success";//�����߼���ͼ
	}
}