package wyf.cgq;
import java.util.*;
public class DailyTask extends TimerTask{
	private InsertDB insertDB;//����InsertDB������
	private SearchDB searchDB;//����SearchDB������
	public void setInsertDB(InsertDB insertDB){//InsertDB��setter����
		this.insertDB=insertDB;	}
	public void setSearchDB(SearchDB searchDB){//SearchDB��setter����
		this.searchDB=searchDB;	}
	public void run(){//��д��run����
		Date d=new Date();//��õ�ǰʱ��
		String strmonth="";
		String strdate="";
		int year=d.getYear()+1900;//�����
		int month=d.getMonth()+1;//�����
		if(month<10){strmonth=0+""+month;	}//��֯�µ��ַ���
		else{strmonth=month+"";	}
		int date=d.getDate();//�����
		if(date<10){strdate=0+""+date;	}
		else{strdate=date+"";	}//��֯����ַ���
		String sql="select * from oa_attinfo where to_char(att_time,'YYYY-MM-DD')='"+
					year+"-"+strmonth+"-"+strdate+"'";//��֯��ѯ��sql
		List list=this.searchDB.getArrayList(sql);//���в�ѯ
		if(list.size()==0){//����鵽0����¼
			String sql1="insert into oa_attinfo(att_user) select user_number from oa_user";
			this.insertDB.update(sql1);//�����µļ�¼
		}	}}