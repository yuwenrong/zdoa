package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.struts2.*;
import java.io.*;
import org.apache.struts2.*;
public class LoadFileAction extends ReceiveFileAction{
	private String fileNumber;//Ҫ���ص��ļ��ı��
	private String inputPath;//�ļ��Ĵ洢·��
	private String fileName;//�ļ�������
	private String downloadName;//�ļ����غ������
	private String fileType;//�ļ�������
	public void setInputPath(String inputPath){//inputPath��setter����
		this.inputPath=inputPath;
	}
	public String getInputPath(){//inputPath��getter����
		return ServletActionContext.getRequest().getRealPath(inputPath);
	}
	public InputStream getInputName(){//�����������ķ���
		InputStream is=ServletActionContext.getServletContext().getResourceAsStream(this.inputPath+"\\"+fileName);//���������
		return is;//����������
	}
	public String getDownloadName(){//������غ��ļ����ֵķ���
		try{   
  				downloadName = new String(downloadName.getBytes(), "ISO-8859-1");   
  		   }//ת�룬�Ա㴫��
  		   catch (UnsupportedEncodingException e){   
            e.printStackTrace();  
        }   
        return downloadName;   //��������
	}
	public String getFileType(){//����ļ����͵ķ���
		if(fileType.equals("application/octet-stream"));
		this.fileType="application/octet-stream;charset=ISO8859-1";//����ļ�����
		return this.fileType;//�����ļ�����
	}
	public void setFileNumber(String fileNumber){//�����ļ���ŵķ���
		this.fileNumber=fileNumber;
	}
	public String execute(){//��д��execute����
		String sql="select transfile_name,transfile_realname,transfile_type "+
				"from oa_transfile where transfile_number='"+fileNumber+"'";
		List list=this.getSearchDB().getArrayList(sql);//ִ��sql,���list
		if(list.size()<=0){//���С���㣬˵��������
			return "input";//�����߼���ͼ
		}
		Object[] o=(Object[])list.get(0);//��õ�һ������
		this.fileName=(String)o[0];//����ļ�����
		this.downloadName=(String)o[1];//������غ�����֣����ļ�ԭʼ����
		this.fileType=(String)o[2];//����ļ�����
		return "success";//�����߼���ͼ
	}
}
