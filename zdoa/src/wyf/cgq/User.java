package wyf.cgq;
public class User{
	private String userNumber;//���ڼ�¼�û����
	private String uid;//�û��ĵ�½��
	private String pwd;//�û�������
	private Role role;//�û���ְλ
	public User(){}//�޲ι�����
	public User(String userNumber,String uid,String pwd,Role role){//�вι�����
		this.userNumber=userNumber;this.uid=uid;this.pwd=pwd;
		this.role=role;
	}
	public void setUserNumber(String userNumber){this.userNumber=userNumber;}
	public String getUserNumber(){return this.userNumber;}//userNumber��getter��setter����
	public void setUid(String uid){this.uid=uid;}//uid��setter����
	public String getUid(){return this.uid;}//uid��getter����
	public void setPwd(String pwd){this.pwd=pwd;}//pwd��setter����
	public String getPwd(){return this.pwd;}//pwd��getter����
	public void setRole(Role role){this.role=role;}//role��getter����
	public Role getRole(){return this.role;}//role��setter����
}