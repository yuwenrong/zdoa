package wyf.cgq;
public class Dept{
	private String deptNumber;//���ڴ洢���ű�ŵ�����
	private String deptName;//���ڴ洢�������Ƶ�����
	public Dept(){
	}//�޲ι�����
	public Dept(String deptNumber,String deptName){//�вι�����
		this.deptNumber=deptNumber;
		this.deptName=deptName;
	}
	public void setDeptNumber(String deptNumber){//deptNumber��setter����
		this.deptNumber=deptNumber;
	}
	public String getDeptNumber(){//deptNumber��getter����
		return this.deptNumber;
	}
	public void setDeptName(String deptName){//deptName��setter����
		this.deptName=deptName;
	}
	public String getDeptName(){//deptname��getter����
		return this.deptName;
	}
}