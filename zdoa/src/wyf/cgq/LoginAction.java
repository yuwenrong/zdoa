package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
@Validation()
public class LoginAction extends ActionSupport{
	private String uid;//���ڷ�װ�û���������
	private String pwd;//���ڷ�װ���������
	private String yanzhengma;//���ڷ�װ��֤�������
	private String result="";//���ڷ�װ������������
	private LoginDB loginDB;//���������������ݿ���������
	@RequiredStringValidator(message="${getText(\"validate.uidempty\")}")
	public void setUid(String uid){this.uid=uid;}//uid��setter����
	public String getUid(){return this.uid;}//uid��getter����
	@RequiredStringValidator(message="${getText(\"validate.pwdempty\")}")
	public void setPwd(String pwd){this.pwd=pwd;}//pwd��setter����
	public String getPwd(){return this.pwd;	}//pwd��getter����
	public void setYanzhengma(String yanzhengma){this.yanzhengma=yanzhengma;}
	public String getYanzhengma(){return this.yanzhengma;}//yanzhengma��setter��getter����
	public String getResult(){return result;}//result��getter����
	public void setLoginDB(LoginDB loginDB){this.loginDB=loginDB;}//loginDB��setter����
	public String execute(){
		String yanzhengma=(String)ActionContext.getContext().getSession().get("yanzhengma");//���session�յ���֤��
		if(yanzhengma!=null){//�����֤�벻Ϊ��
			if(!yanzhengma.equals(this.yanzhengma.toLowerCase())){//���������֤�벻��ȷ
				this.result=this.getText("login.yanzhengmaerror");//���ô�����ʾ��Ϣ
				return SUCCESS;//���ص���½ҳ��
			}
			else{String hql="from User u where u.uid='"+uid+"' and u.pwd='"+pwd+"'";//�����ȷ
				List list=loginDB.getUser(hql);//�������ݿ�
				if(list.size()>0){//����и��û������û�����������ȷ
					User user=(User)list.get(0);//��ø��û�
					int right=user.getRole().getRoleRight();//��ø��û���Ȩ��
					this.getSession().put("user",user.getUserNumber());//���û���ŷ���session
					this.getSession().put("right",right);//��Ȩ�޷���session
					return "mainmanage";//�����߼���ͼ
				}
				else{this.result="�û������������";//û�и��û�
					return SUCCESS;//���ص�½ҳ����߼���ͼ
				}
			}
		}
		return SUCCESS;
	}
	public Map getSession(){//���session�ķ���
		return ActionContext.getContext().getSession();}
}