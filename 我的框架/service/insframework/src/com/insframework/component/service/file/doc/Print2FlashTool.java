package com.insframework.component.service.file.doc;

import com.jacob.activeX.ActiveXComponent;

public class Print2FlashTool
{

	
	public static boolean toSwf(String path){
		
		boolean flag = false;
		
		try{			
			// Create Server object
			ActiveXComponent p2f = new ActiveXComponent("Print2Flash4.Server"); 

			// Setup interface and protection options
			ActiveXComponent defProfile = new ActiveXComponent(p2f.getProperty("DefaultProfile").toDispatch());
			defProfile.setProperty("InterfaceOptions", P2FConst.INTDRAG | P2FConst.INTSELTEXT | P2FConst.INTFITWIDTH | P2FConst.INTFITPAGE | P2FConst.INTZOOMSLIDER | P2FConst.INTPREVPAGE | P2FConst.INTGOTOPAGE | P2FConst.INTNEXTPAGE | P2FConst.INTPRINT);
			//defProfile.setProperty("ProtectionOptions", P2FConst.PROTDISPRINT | P2FConst.PROTENAPI);
			//defProfile.setProperty("DocumentType", P2FConst.FLASH | P2FConst.HTML5);
			defProfile.setProperty("DocumentType", P2FConst.FLASH);
			// Convert document
			p2f.invoke("ConvertFile", new String(path));
			
			flag = true;
		}catch (Exception e) {
			//e.printStackTrace();
			
			//本机环境有点问题，临时做处理
			Runtime rt = Runtime.getRuntime();
			Process p = null;
			try{
				p = rt.exec("cmd.exe /c D:\\Print2Flash4\\p2fServer.exe " + path);
				p.waitFor();
				flag = true;
			}catch(Exception ex){
				flag = false;
			}finally{
				p.destroy();
			}
		}
		
		return flag;
	}	
	
}