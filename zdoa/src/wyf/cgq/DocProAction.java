package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
import java.math.*;
public class DocProAction{
	private SearchDB searchDB;//����searchDB������
	private List firstList;//���ڴ��һ�������б�
	private List secondList;//���ڴ�Ŷ��������б�
	private String topic;//���ڴ����������
	private int type;//���ڴ���������
	private int state;//���ڴ������״̬
	private String docnum;//���ڴ������ı��
	public void setSearchDB(SearchDB searchDB){//searchDB��setter����
		this.searchDB=searchDB;
	}
	public void setDocnum(String docnum){
		this.docnum=docnum;
	}//docnum��setter����
	public String getTopic(){
		return this.topic;
	}//topic��getter����
	public List getFirstList(){
		return this.firstList;
	}//topic��getter����
	public List getSecondList(){
		return this.secondList;
	}//topic��getter����
	public int getType(){
		return this.type;
	}//topic��getter����
	public int getState(){
		return this.state;
	}//topic��getter����
	public String execute(){
		String sql1="select doc_title,doc_type,doc_state from oa_doc where "+
				"doc_num='"+this.docnum+"'";//���������sql���
		List list=this.searchDB.getArrayList(sql1);//��������б�
		Object[] o=(Object[])list.get(0);//��õ�һ������
		this.topic=(String)o[0];//ȡ������
		this.type=((BigDecimal)o[1]).intValue();//ȡ������
		this.state=((BigDecimal)o[2]).intValue();//ȡ��״̬
		firstList=new ArrayList();//����һ��ArrayList�����һ�������������
		String sql2="select oa_dept.dept_name,oa_docdept.dept_state from "+
				"oa_dept,oa_docdept where oa_docdept.doc_num='"+this.docnum+"' "+
				"and oa_dept.dept_number=oa_docdept.dept_num and oa_docdept.doc_type=1";
		list=this.searchDB.getArrayList(sql2);//��֯SqL����ѯһ����������
		int size=list.size();//��ò��Ÿ���
		for(int i=0;i<size;i++){//����List
			Object[] o1=(Object[])list.get(i);//ȡ��һ������
			DocDept dd=new DocDept((String)o1[0],((BigDecimal)o1[1]).intValue());
			firstList.add(dd);//��֯�ɶ��󲢷���firstList��
		}
		if(this.type==2){//����Ƕ�������
			this.secondList=new ArrayList();//����һ��ArrayList����Ŷ��������������
			sql2="select oa_dept.dept_name,oa_docdept.dept_state from "+
				"oa_dept,oa_docdept where oa_docdept.doc_num='"+this.docnum+"' "+
				"and oa_dept.dept_number=oa_docdept.dept_num and oa_docdept.doc_type=2";
			list=this.searchDB.getArrayList(sql2);//��֯SqL����ѯ������������
			size=list.size();//��ò��Ÿ���
			for(int i=0;i<size;i++){//����List
				Object[] o2=(Object[])list.get(i);//ȡ��һ������
				DocDept dd=new DocDept((String)o2[0],((BigDecimal)o2[1]).intValue());
				secondList.add(dd);//��֯�ɶ��󲢷���secondList��
			}
		}
		return "success";//�����߼���ͼ��
	}
}