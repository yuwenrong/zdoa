package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
public class SendAlarm1Action extends ActionSupport{
	private SearchDB searchDB;//����SearchDB������
	private List deptList;//���ڴ�Ų����б�
	private String hqldept="from Dept";//�������ŵ�Hql���
	public void setSearchDB(SearchDB searchDB){//searchDB��setter����
		this.searchDB=searchDB;
	}
	public List getDeptList(){//��ò����б�ķ���
		List list=searchDB.getInstanceList(hqldept);//����searchDB����Ӧ����
		list.add(0,new Dept(null,"ѡ����"));//���һ��������ʾ����Ϣ
		return list;//���ز����б�
	}
	public String execute(){
		return "success";
	}
}