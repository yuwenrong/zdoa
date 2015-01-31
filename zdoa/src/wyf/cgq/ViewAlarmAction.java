package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
import java.math.*;
public class ViewAlarmAction extends FenYeAction{
	private String deptNumber="00000";//���ڴ洢���ű�ŵ�����
	private List deptList;//���ڴ�Ų����б�
	private String hqldept="from Dept";//���������б��hql���
	public List getDeptList(){//��ò����б�ķ���
		List list=this.getSearchDB().getInstanceList(hqldept);//��ò����б�
		list.add(0,new Dept("00000","�鿴ȫ��"));//����ȫ�����ŵ�ѡ��
		return list;//���ز����б�
	}
	public void setDeptNumber(String deptNumber){//deptNumber��setter����0
		this.deptNumber=deptNumber;
	}
	public List getAlarmList(){//��ñ����б�ķ���
		int begin=(this.getCurrenPage()-1)*this.getPageSpan();//��ʼ�ļ�¼��
		int end=this.getCurrenPage()*this.getPageSpan();//�����ļ�¼��
		String deptsql="";//��Ų���������sql���
		if(!this.deptNumber.equals("00000")){//������ű�Ų��Ǳ�ʾȫ��
			deptsql=" and oa_alarm.alarm_dept='"+this.deptNumber+"' "; //��Ӳ���������sql
		}
		String sql="select numbers,state,title,deptname,time,fromuser from("+
					"select rownum rn,numbers,state,title,deptname,time,fromuser from("+
					"select oa_alarm.alarm_number numbers,oa_alarm.alarm_title title,"+
					"oa_alarm.alarm_time time,oa_user.user_realname fromuser,"+
					"oa_alarm.alarm_state state,oa_dept.dept_name deptname from "+
					"oa_alarm,oa_user,oa_dept where oa_alarm.alarm_fromuser="+
					"oa_user.user_number and oa_alarm.alarm_dept=oa_dept.dept_number "+
					deptsql+"order by oa_alarm.alarm_time desc)) where rn>"+begin+" and rn<="+end;
		List list=this.getSearchDB().getArrayList(sql);//��ñ�����¼�б�
		int size=list.size();//��ü�¼������
		List alarmlist=new ArrayList();//����һ��List
		for(int i=0;i<size;i++){//������õ�list
			Object[] o=(Object[])list.get(i);//�������һ����¼
			Alarm alarm=new Alarm((String)o[0],((BigDecimal)o[1]).intValue(),(String)o[2],(String)o[3],
			(Date)o[4],(String)o[5]);//��֯һ��Alarm����
			alarmlist.add(alarm);//����ǰ�洴����list��
		}
		return alarmlist;//���ر�����¼�б�
	}
	public String execute(){
		this.updateInfo();//����updateInfo�������������ҳ
		return "success";
	}
	public void updateInfo(){
		String deptSql="";//��Ų���������sql���
		if(!this.deptNumber.equals("00000")){//������ű�Ų��Ǳ�ʾȫ��
			deptSql="where oa_alarm.alarm_dept='"+this.deptNumber+"' "; 
		}
		String sql="select count(*) from oa_alarm "+deptSql;//��֯sql���
		List list=this.getSearchDB().getArrayList(sql);//��������б�
		int total=((BigDecimal)list.get(0)).intValue();//ȡ�ü�¼������
		this.setMaxPage(total%this.getPageSpan()==0?total/this.getPageSpan():(total/this.getPageSpan()+1));
	}
}