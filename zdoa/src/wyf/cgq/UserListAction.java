package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
public class UserListAction implements Action{
	private SearchDB searchDB;//����SearchDB������
	private String deptNumber;//������Ų��ű�ŵ�����
	private String userList;//���ڴ���û��б������
	private String hqluser;//����hql������
	public void setSearchDB(SearchDB searchDB){//searchDB��setter����
		this.searchDB=searchDB;
	}
	public void setDeptNumber(String deptNumber){//deptNumber��setter����
		this.deptNumber=deptNumber;
	}
	public String getUserList(){//userList��getter����
		return userList;
	}
	public String execute(){//��д��execute����
		hqluser="from RealUser ru where ru.deptNumber='"+deptNumber+"'";//��֯hql���
		List list=searchDB.getInstanceList(hqluser);//����û��б�
		int size=list.size();//���list�Ĵ�С
		StringBuilder result=new StringBuilder();//����StringBuilder����
		result.append("<table width=\"100%\" ><tr><td style=\"width:10\"></td><td><table border=0 width=\"100%\">");
		for(int i=0;i<size;i++){//����list��֯html����
			RealUser user=(RealUser)list.get(i);
			String unumber=user.getUserNumber();
			String uname=user.getUserName();
			result.append("<tr style=\"height:20px;color:#404040;font-size:14px;\" onmouseout=\"mouseoutcolor('row");
			result.append(i);
			result.append("')\" onmouseover=\"mouseovercolor('row");
			result.append(i);
			result.append("')\" onclick=\"add('");
			result.append(unumber);
			result.append("')\" id=\"row");
			result.append(i);
			result.append("\">");
			result.append("<td align=\"right\"><img src=\"images/usrlist.gif\"></td><td align=\"left\">");
			result.append(uname);
			result.append("<td></tr>");
		}
		result.append("</table></td></tr></table>");//��֯���
		this.userList=result.toString();//ת��Ϊ�ַ���
		userList=new MyConverter().escape(userList);//���б���
		return "success";//�����߼���ͼ
	}
}
