package wyf.cgq;
import java.util.*;
import org.hibernate.*;
import org.springframework.orm.hibernate3.HibernateTemplate;
public class LoginDB{
	private SessionFactory sf;//����Hibernate�ĻỰ����
	public void setSf(SessionFactory sf){
		this.sf=sf;//�Ự������setter����
	}
	public List getUser(String hql){//����û��ķ���
		Session session=sf.openSession();//�򿪻Ự
		Query q=session.createQuery(hql);//��ѯHql
		List list=q.list();//��ò�ѯ�б�
		session.close();//�رջỰ
		return list;//���ز�ѯ�������б�
	}
}