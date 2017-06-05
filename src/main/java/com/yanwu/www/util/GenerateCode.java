package com.yanwu.www.util;


public class GenerateCode {
	
	 
	//产生4位验证码
	


	
	public String getCode() {
		
		/*
		 * 65-90,A-Z
		 * 97-102,a-z
		 * 48-57,0-9
		 */
		
		char[] c = new char[4];
		int flag=0,d=0;
		
		for(int i=0;i<4;i++){
			flag=(int) (Math.random()*3);
			if(flag==0){
				d=(int) (Math.random()*10+48); //产生0-9
			}
			if(flag==1){
				d=(int) (Math.random()*26+65);//产生大写字母
			}
			if(flag==2){
				d=(int) (Math.random()*26+97);//产生小写字母
			}
			
			c[i]=(char)d;
			
		}
		System.out.println(c[0]+"---"+c[1]+"---"+c[2]+"---"+c[3]);
		
		String code="";
		for(char a:c){
			code+=a;
		}
		
		return code;
	}
	
}
