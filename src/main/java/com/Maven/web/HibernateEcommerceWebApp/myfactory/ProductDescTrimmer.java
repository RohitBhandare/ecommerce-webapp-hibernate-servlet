package com.Maven.web.HibernateEcommerceWebApp.myfactory;

public class ProductDescTrimmer {
	
	public static String get10Words(String desc)
	{
		String[] str=desc.split(" ");
		
		if(str.length>10)
		{
			String ans="";
			for(int i=0;i<10;i++)
			{
				ans=(ans+str[i]+" ");
			}
			return (ans+" ");
		}
		else
		{
			return (desc);
		}
	}

}
