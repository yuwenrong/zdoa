package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
import java.math.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class KaoQinAction{
	private InsertDB insertDB;//����InsertDB������
	private SearchDB searchDB;//����SearchDB������
	private int type;//��������
	public void setInsertDB(InsertDB insertDB){//insertDB��setter����
		this.insertDB=insertDB;
	}
	public void setSearchDB(SearchDB searchDB){//searchDB��setter����
		this.searchDB=searchDB;
	}
	public void setType(int type){//type��setter����
		this.type=type;
	}
	public String execute(){//��д��execute����
		String user=((String)ActionContext.getContext().getSession().get("user")).trim();//����û����
		String sql="select att_starthour,att_startmin,att_endhour,att_endmin "+
				"from oa_attendtime";//���Ų�ѯ����ʱ���sql
		List list=this.searchDB.getArrayList(sql);//ִ�в�ѯ
		Object[] o=(Object[])list.get(0);//��õ�һ������
		Date date=new Date();//����һ��ʱ�����
		int hour=date.getHours();//������ڵ�Сʱ
		int min=date.getMinutes();//������ڵķ���
		int sec=date.getSeconds();//������ڵ���
		int year=date.getYear()+1900;//������ڵ���
		int month=date.getMonth()+1;//������ڵ��·�
		String strmonth=month>9?(month+""):(0+""+month);//��֯�·��ַ���
		int day=date.getDate();//�����
		String strday=day>9?(day+""):(0+""+day);//��֯���ַ���
		if(type==0){//�����0����ʾ�����翼��
			int atthour=((java.math.BigDecimal)o[0]).intValue();//��ù涨�Ŀ���Сʱ
			int attmin=((java.math.BigDecimal)o[1]).intValue();//��ù涨�Ŀ��ڷ���
			if(atthour>hour||(atthour==hour&&attmin>=min)){//����ǰ�ʱ����
				String sql1="update oa_attinfo set att_startstate=2,att_starttime='"+
						hour+":"+min+":"+sec+"',att_startip='"+this.getIp()+"' where "+
						"att_user='"+user+"' and to_char(att_time,'YYYY-MM-DD')='"+
						year+"-"+strmonth+"-"+strday+"'";//��֯sql���
				this.insertDB.update(sql1);//ִ�и��µ�sql���
			}
			else{//������ڳٵ�
				String sql2="update oa_attinfo set att_startstate=1,att_starttime='"+
						hour+":"+min+":"+sec+"',att_startip='"+this.getIp()+"' where "+
						"att_user='"+user+"' and to_char(att_time,'YYYY-MM-DD')='"+
						year+"-"+strmonth+"-"+strday+"'";//��֯sql���
				this.insertDB.update(sql2);//ִ�и��µ�sql���
			}
		}
		else{//�����1����ʾ�����翼��
			int atthour=((java.math.BigDecimal)o[2]).intValue();//��ù涨�Ŀ���Сʱ
			int attmin=((java.math.BigDecimal)o[3]).intValue();//��ù涨�Ŀ��ڷ���
			if(atthour>hour||(atthour==hour&&attmin>=min)){//����ǰ�ʱ����
				String sql1="update oa_attinfo set att_endstate=1,att_endtime='"+
						hour+":"+min+":"+sec+"',att_endip='"+this.getIp()+"' where "+
						"att_user='"+user+"' and to_char(att_time,'YYYY-MM-DD')='"+
						year+"-"+strmonth+"-"+strday+"'";//��֯sql���
				this.insertDB.update(sql1);//ִ�и��µ�sql���
			}
			else{//������ڳٵ�
				String sql2="update oa_attinfo set att_endstate=2,att_endtime='"+
						hour+":"+min+":"+sec+"',att_endip='"+this.getIp()+"' where "+
						"att_user='"+user+"' and to_char(att_time,'YYYY-MM-DD')='"+
						year+"-"+strmonth+"-"+strday+"'";//��֯sql���
				this.insertDB.update(sql2);//ִ�и��µ�sql���
			}
		}
		return "success";//�����߼���ͼ
	}
	public String getIp() {//��ÿͻ���ip�ķ���
		HttpServletRequest req=ServletActionContext.getRequest();//���HttpServletRequest
		String cip =req.getHeader("x-forwarded-for");//��������ip
		if(cip == null || cip.length() == 0 || "unknown".equalsIgnoreCase(cip)) {
			cip =req.getHeader("Proxy-Client-IP");
		}
		if(cip == null || cip.length() == 0 || "unknown".equalsIgnoreCase(cip)) {
			cip =req.getHeader("WL-Proxy-Client-IP");
		}
		if(cip == null || cip.length() == 0 || "unknown".equalsIgnoreCase(cip)) {
			cip = req.getRemoteAddr();
		}
		return cip;
	}
	
}