package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
import org.apache.struts2.*;
import java.math.*;
public class ChangeAttAction{
	private InsertDB insertDB;//����insertDB������
	private String startHour;//���ڴ�ſ�ʼСʱ������
	private String startMin;//���ڴ�ſ�ʼ���ӵ�����
	private String endHour;//���ڴ�Ž���Сʱ������
	private String endMin;//���ڴ�Ž������ӵ�����
	public void setInsertDB(InsertDB insertDB){//insertDB��setter����
		this.insertDB=insertDB;
	}
	public void setStartHour(String startHour){//��ʼСʱ��setter����
		this.startHour=startHour;
	}
	public void setStartMin(String startMin){//��ʼ���ӵ�setter����
		this.startMin=startMin;
	}
	public void setEndHour(String endHour){//����Сʱ��setter����
		this.endHour=endHour;
	}
	public void setEndMin(String endMin){//�������ӵ�setter����
		this.endMin=endMin;
	}
	public String execute(){//��д��execute����
		String sql="update oa_attendtime set att_starthour="+this.startHour+
					",att_startmin="+this.startMin+",att_endhour="+this.endHour+
					",att_endmin="+this.endMin;//��֯���ļ�¼��sql���
		int i=insertDB.update(sql);//����update�������¼�¼
		return "success";//�����߼���ͼ
	}
}
