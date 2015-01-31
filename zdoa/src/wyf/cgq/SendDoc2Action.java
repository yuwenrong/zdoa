package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
public class SendDoc2Action extends SendDocAction{
	private InsertDB insertDB;//����InsertDB������
	private String type;//���ڴ����������
	private List firstList;//һ�������Ĳ����б�
	private List secondList;//�����������ŵ��б�
	private String topic;//����ı���
	private String content;//����ľ�������
	public void setInsertDB(InsertDB insertDB){//insertDB��setter����
		this.insertDB=insertDB;
	}
	public void setType(String type){//��������setter����
		this.type=type.trim();
	}
	public String getType(){//��������getter����
		return this.type;
	}
	public void setFirstList(List firstList){//һ�������Ĳ����б��setter����
		this.firstList=firstList;
	}
	public List getFirstList(){//һ�������Ĳ����б��getter����
		return this.firstList;
	}
	public void setSecondList(List secondList){//�����������ŵ��б��setter����
		this.secondList=secondList;
	}
	public List getSecondList(){//�����������ŵ��б��getter����
		return this.secondList;
	}
	public void setTopic(String topic){//����ı����setter����
		this.topic=topic;
	}
	public String getTopic(){//����ı����getter����
		return this.topic;
	}
	public void setContent(String content){//����ľ������ݵ�setter����
		this.content=content;
	}
	public String getContent(){//����ľ������ݵ�getter����
		return this.content;
	}
	public String execute(){//��д��execute����
		int docnum=this.getSearchDB().getDocMax();//��ñ��
		String from=(String)this.getSession().get("user");//��������˱��
		String sql="insert into oa_doc (doc_num,doc_from,doc_title,doc_content,doc_type,doc_time)"+
		" values('"+docnum+"','"+from+"','"+this.topic+"','"+this.content+"',"+this.type+",sysdate)";
		boolean b=this.insertDB.saveDoc(sql,docnum,this.firstList,this.secondList,this.type);//����
		if(b==true){
			this.setResult("���ͳɹ�");
		}//���ͳɹ�
		else{
			this.setResult("����ʧ��");
		}//����ʧ��
		return "success";
	}
}