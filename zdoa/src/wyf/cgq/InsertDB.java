package wyf.cgq;
import org.hibernate.*;
import java.util.*;
public class InsertDB{
	private SessionFactory sf;
	public void setSf(SessionFactory sf){
		this.sf=sf;
	}
	public void saveTransFile(List userlist){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		int size=userlist.size();
		for(int i=0;i<size;i++)
		{
			Transfile tf=(Transfile)userlist.get(i);
			session.save(tf);
		}
		t.commit();
		session.close();
	}
	public void delRecord(String usernumber,List<String> delList){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		String hql="delete Transfile where fileName in(:delList) and toUser=:usernumber";
		Query query=session.createQuery(hql);
		query.setParameter("usernumber",usernumber);
		query.setParameterList("delList",delList);
		int num=query.executeUpdate();
		t.commit();
		session.close();
	}
	public void saveShareFile(ShareFile sf1){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		session.save(sf1);
		t.commit();
		session.close();
	}
	public void delShareFile(String filename){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		String hql="delete ShareFile where name='"+filename+"'";
		Query query=session.createQuery(hql);
		int num=query.executeUpdate();
		t.commit();
		session.close();
	}
	public void saveMsg(SendMsg msg){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		session.save(msg);
		t.commit();
		session.close();
	}
	public void delMsgList(List delList){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		String hql="delete SendMsg where number in(:delList)";
		Query query=session.createQuery(hql);
		query.setParameterList("delList",delList);
		int num=query.executeUpdate();
		t.commit();
		session.close();
	}
	public void saveNewUser(NewUser nu){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		session.save(nu);
		t.commit();
		session.close();
	}
	public void saveAlarm(Alarm alarm){
		Session session=sf.openSession();//����һ���Ự
		Transaction t=session.beginTransaction();//��ʼһ������
		session.save(alarm);//����Alarm����
		t.commit();//�ύ����
		session.close();//�رջỰ
	}
	public void delAlarmList(List delList){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		String hql="delete Alarm where number in(:delList)";
		Query query=session.createQuery(hql);
		query.setParameterList("delList",delList);
		int num=query.executeUpdate();
		t.commit();
		session.close();
	}
	public int update(String sql){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		int i=session.createSQLQuery(sql).executeUpdate();
		t.commit();
		session.close();
		return i;
	}
	public boolean saveDoc(String sql,int docnum,List firstList,List secondList,String type){
		boolean b=false;//��־�Ƿ�ɹ��ı�����Ĭ�ϲ��ɹ�
		Session session=sf.openSession();//����һ���Ự
		Transaction t=session.beginTransaction();//��ʼһ������
		int total=0;//��������
		int j=session.createSQLQuery(sql).executeUpdate();//ִ�в���
		total++;//����ɹ�������1
		for(int i=0;i<firstList.size();i++){//����һ�������б�
			String s="insert into oa_docdept values('"+(String)firstList.get(i)+"','"+
					docnum+"',"+1+","+0+")";//��֯SQl
			int k=session.createSQLQuery(s).executeUpdate();//ִ�в���
			total++;//����ɹ�������1
		}
		if(type.equals("2")){//�������һ����������
			for(int i=0;i<secondList.size();i++){//�������������б�
				String s="insert into oa_docdept values('"+(String)secondList.get(i)+"','"+
						docnum+"',"+2+","+0+")";//��֯SQl
				int k=session.createSQLQuery(s).executeUpdate();//ִ�в���
				total++;//����ɹ�������1
			}
		}
		if(type.equals("1")){
			if(1+firstList.size()==total){
				b=true;
			}
		}//�ж��Ƿ����ɹ�
		if(type.equals("2")){
			if(1+firstList.size()+secondList.size()==total){
				b=true;
			}
		}//�ж��Ƿ����ɹ�
		t.commit();//�ύ����
		session.close();//�ر�session
		return b;//���ؽ��
	}
	public void updatedoc(String sql1,String sql2){
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		int i=session.createSQLQuery(sql1).executeUpdate();
		int j=session.createSQLQuery(sql2).executeUpdate();
		t.commit();
		session.close();
	}
}