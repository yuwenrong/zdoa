package wyf.cgq;
import org.hibernate.*;
import java.util.*;
import java.math.*;
public class SearchDB
{
	private SessionFactory sf;
	public void setSf(SessionFactory sf){
		this.sf=sf;
	}
	public String getRealNameByUsernumber(String usernumber){
		String sql="select user_realname from oa_user where user_number='"+usernumber+"'";
		Session session=sf.openSession();
		SQLQuery query=session.createSQLQuery(sql);
		List list=query.list();
		session.close();
		
		if(!list.isEmpty()){
			String realname=(String)list.get(0);
			return realname;
		}
		else{
			return "";
		}
	}
	public List getInstanceList(String hql){
		Session session=sf.openSession();//����һ���Ự
		Query query=session.createQuery(hql);//����Query
		List instancelist=query.list();//��������б�
		session.close();//�ر�Session
		return instancelist;//���������б�
	}
	public List getArrayList(String sql){
		Session session=sf.openSession();
		SQLQuery q=session.createSQLQuery(sql);
		List list=q.list();
		session.close();
		return list;
	}
	public int getDocMax(){
		Session session=sf.openSession();
		String sql="select max(doc_num) from oa_doc";
		SQLQuery q=session.createSQLQuery(sql);
		List list=q.list();
		if(list.get(0)==null){
			return 1001;
		}
		else{
			Object o=(Object)list.get(0);
			return ((BigDecimal)o).intValue()+1;
		}
	}
}