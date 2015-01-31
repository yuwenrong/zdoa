package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
public class FenYeAction extends ActionSupport{
	private SearchDB searchDB;//����SearchDB������
	private InsertDB insertDB;//����InsertDB������
	private int currenPage=1;//������ǰҳ������
	private int pageSpan=5;//����ҳ��ȣ�Ĭ��ÿҳ��ʾ5��
	private int maxPage;//�������ҳ��
	private int totalMessage;//���ڼ�¼�ܵļ�¼����
	
	public void setSearchDB(SearchDB searchDB){//searchDB��setter����
		this.searchDB=searchDB;}
	public SearchDB getSearchDB(){//searchDB��getter����
		return this.searchDB;}
	public void setInsertDB(InsertDB insertDB){//insertDB��setter����
		this.insertDB=insertDB;}
	public InsertDB getInsertDB(){//insertDB��getter����
		return this.insertDB;}
	public void setCurrenPage(int currenPage){//currenPage��setter����
		this.currenPage=currenPage;}
	public int getCurrenPage(){//currenPage��getter����
		return this.currenPage;}
	public void setPageSpan(int pageSpan){//pageSpan��setter����
		this.pageSpan=pageSpan;
		this.getSession().put("pageSpan",pageSpan);//����ֵ����session
		this.currenPage=1;//����ǰҳ��Ϊ��һҳ
	}
	public int getPageSpan(){
		Object obj=this.getSession().get("pageSpan");//��session����ҳ���
		if(obj!=null){this.pageSpan=(Integer)obj;}//obj��Ϊ�գ���λ��ǰҳ���
		return this.pageSpan;//����ҳ���
	}
	public void setMaxPage(int maxPage){this.maxPage=maxPage;}//maxPage��setter����
	public int getMaxPage(){return this.maxPage;}//maxPage��getter����
	public String execute(){return "success";}//��д��execute����
	public Map getSession(){//���session�ķ���
		return ActionContext.getContext().getSession();
	}
}
