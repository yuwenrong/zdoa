package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;

public class SendFile2Action extends SendFileAction{
	private InsertDB insertDB;//����InsertDB������
	private String info;//�������ڴ���ļ����������
	private String touser;//���ڴ���ļ�������
	private String savePath;//���ڴ���ļ��洢·��
	private File myFile;//���յ����ļ�
	private String myFileType;//�ļ�����
	private String myFileName;//�ļ�����
	public void setInsertDB(InsertDB insertDB){//InsertDB��setter����
		this.insertDB=insertDB;
	}
	public void setInfo(String info){//info��setter����
		this.info=info;
	}
	public void setTouser(String touser){//touser��setter����
		this.touser=touser;
	}
	public void setSavePath(String savePath){//savaPath��setter����
		this.savePath=savePath;
	}
	public String getSavePath(){//savaPath��getter����
		return ServletActionContext.getRequest().getRealPath(savePath);
	}                                                                    
	public void setMyFile(File myFile){//myFile��setter����
		this.myFile=myFile;
	}
	public File getMyFile(){//myFile��getter����
		return this.myFile;
	}
	public void setMyFileContentType(String myFileType) {//MyFileContentType��setter����
		this.myFileType=myFileType;
	}

	public void setMyFileFileName(String myFileName) {//MyFileFileName��setter����
		this.myFileName=myFileName;
	}
	public String getMyFileContentType() {//MyFileContentType��getter����
		return this.myFileType;
	}
	public String getMyFileFileName() {//MyFileFileName��getter����
		return this.myFileName;
	}
	public String execute(){//��д��execute����
		if(this.myFileName!=null&&!this.myFileName.equals("")){//����ļ�ȷʵ����
			String filename=new Long(new Date().getTime()).toString()+this.myFileName.substring(this.myFileName.lastIndexOf("."),this.myFileName.length());//�Ե�ǰʱ��Ϊ���ļ�������
			FileOutputStream fos=null;//�ļ������
			FileInputStream fis=null;//�ļ�������
			try{
					fos=new FileOutputStream(this.getSavePath()+"\\"+filename);//�����ļ������
					fis=new FileInputStream(this.getMyFile());//�����ļ�������
					byte[] buffer=new byte[1024];//����byte����
					int length=0;
					while((length=fis.read(buffer))>0){
						fos.write(buffer,0,length);//��ȡ�ļ���д��
					}
				}
				catch(Exception e){
					System.out.println("�ϴ�ʧ��");//�ϴ�ʧ��
					return SUCCESS;
				}
				finally{
					try{
						if(fos!=null){//�ر������
						fos.close();
						}
						if(fis!=null){//�ر�������
							fis.close();
						}
					}
					catch(IOException e){
						e.printStackTrace();
					}
				}
			String[] touserarray=this.touser.split(";");//�ֽ��ռ����б�
			int size=touserarray.length;//����ռ��˸���
			List userlist=new ArrayList();//����һ��ArrayList
			for(int i=0;i<size;i++){//�����ռ����б�
				Transfile tf=new Transfile();//����Transfile����
				tf.setFileName(filename);
				tf.setFileRealname(this.myFileName);
				tf.setFromUser((String)this.getSession().get("user"));
				tf.setToUser(touserarray[i].trim());
				tf.setTransTime(new Date());
				tf.setFileInfo(this.info);
				tf.setFileType(this.myFileType);//����Transfile�������Ӧ����
				userlist.add(tf);//���������list
			}
			this.insertDB.saveTransFile(userlist);//����insertDB����Ӧ����������Ϣ
		}
		return "success";
	}
	public Map getSession(){//���session�ķ���
		return ActionContext.getContext().getSession();
	}
}