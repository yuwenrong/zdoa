package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
import java.math.*;
public class ReceiveFileAction extends FenYeAction{
	public List getMyFileList(){//����ļ��б�ķ���
		int begin=(this.getCurrenPage()-1)*this.getPageSpan();//��¼�Ŀ�ʼλ��
		int end=this.getCurrenPage()*this.getPageSpan();//��¼�Ľ���λ��
		String usernumber=(String)this.getSession().get("user");//����û��ı��
		String sql="select filename,realname,fromuser,touser,filetime,fileinfo,username,filenumber from("+
		"select rownum rn,filename,realname,fromuser,touser,filetime,fileinfo,username,filenumber from ("+
		"select oa_transfile.transfile_name filename,"+
		"oa_transfile.transfile_realname realname,oa_transfile.transfile_fromuser fromuser,"+
		"oa_transfile.transfile_touser touser,to_char(oa_transfile.transfile_time,'YYYY/MM/DD HH:MI:SS') filetime,"+
		"oa_transfile.transfile_info fileinfo,oa_user.user_realname username,oa_transfile.transfile_number filenumber"+
		" from oa_transfile,oa_user where oa_transfile.transfile_fromuser="+
		"oa_user.user_number and oa_transfile.transfile_touser='"+usernumber.trim()+"' "+
		"order by oa_transfile.transfile_time desc)) where rn>"+begin+" and rn<="+end;//��֯SQL
		List list=this.getSearchDB().getArrayList(sql);//����������б�
		int size=list.size();//����б�Ĵ�С
		List filelist=new ArrayList();//����List������ļ�����
		for(int i=0;i<size;i++){//����List
			Object[] o=(Object[])list.get(i);//������е�һ������
			Transfile tf=new Transfile((String)o[0],(String)o[1],(String)o[2],(String)o[3],
			(String)o[4],(String)o[5],(String)o[6],(String)o[7]);//���ļ�����
			filelist.add(tf);//���ļ��������filelist
		}
		return filelist;//�����ļ������б�
	}
	public String execute(){//��д��execute����
		this.updateInfo();//�������ҳ��
		return "success";//�����߼���ͼ
	}
	public void updateInfo(){//�������ҳ���ķ���
		String usernumber=(String)this.getSession().get("user");//����û��ı��
		String sql="select count(*) from oa_transfile where transfile_touser='"+usernumber.trim()+"'";
		List list=this.getSearchDB().getArrayList(sql);//��֯SqL����ѯ��¼������
		int total=((BigDecimal)list.get(0)).intValue();//��ü�¼������
		this.setMaxPage(total%this.getPageSpan()==0?total/this.getPageSpan():(total/this.getPageSpan()+1));//������ҳ��
	}
}
