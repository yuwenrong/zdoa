package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
public class MainManageAction extends ActionSupport{
	private SearchDB searchDB;//����SearchDB������
	private int zongjingli=0;//���ڱ�ʾ�ܾ����ҽ����������
	private int shichang=0;//���ڱ�ʾ�г��������������
	private int jishu=0;//���ڱ�ʾ�����������������
	private int gongguan=0;//���ڱ�ʾ���ز������������
	private int caiwu=0;//���ڱ�ʾ���񲿽����������
	private int houqin=0;//���ڱ�ʾ���ڲ������������
	public void setSearchDB(SearchDB searchDB)
	{this.searchDB=searchDB;}//����ע��searchDB�ķ���
	public int getZongjingli(){return this.zongjingli;}//zongjingli��getter����
	public int getShichang(){return this.shichang;}//shichang��getter����
	public int getJishu(){return this.jishu;}//jishu��getter����
	public int getGongguan(){return this.gongguan;}//gongguan��getter����
	public int getCaiwu(){return this.caiwu;}//caiwu��getter����
	public int getHouqin(){return this.houqin;}//houqin��getter����
	public int getTotal(){//total��getter����
		return this.zongjingli+this.shichang+this.jishu+this.gongguan+this.caiwu+this.houqin;
	}
	public int getRight(){//right��getter����
		return (Integer)ActionContext.getContext().getSession().get("right");
	}
	public String execute(){
		String sql="select alarm_dept,count(*) from oa_alarm where alarm_state=0 group by alarm_dept";
		List list=this.searchDB.getArrayList(sql);//����getArrayList����������б�
		int size=list.size();//����б��С
		for(int i=0;i<size;i++){//�����б�
			Object[] o=(Object[])list.get(i);//����б��е�һ������
			String deptnumber=(String)o[0];//��ò��ŵı��
			if(deptnumber.equals("10000")){//�����1000˵�����ܾ�����
				zongjingli=((java.math.BigDecimal)o[1]).intValue();
			}
			else if(deptnumber.equals("10001")){//�����10001˵�����г���
				shichang=((java.math.BigDecimal)o[1]).intValue();
			}
			else if(deptnumber.equals("10002")){//�����10002˵���Ǽ�����
				jishu=((java.math.BigDecimal)o[1]).intValue();
			}
			else if(deptnumber.equals("10003")){//�����10003˵���ǹ��ز�
				gongguan=((java.math.BigDecimal)o[1]).intValue();
			}
			else if(deptnumber.equals("10004")){//�����10004˵���ǲ���
				caiwu=((java.math.BigDecimal)o[1]).intValue();
			}
			else if(deptnumber.equals("10005")){//�����10005˵���Ǻ��ڲ�
				houqin=((java.math.BigDecimal)o[1]).intValue();
			}
		}
		return "success";
	}
}