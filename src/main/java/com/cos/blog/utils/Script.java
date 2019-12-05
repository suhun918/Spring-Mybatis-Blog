package com.cos.blog.utils;

public class Script {
	
	public static String back(String msg) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('" + msg + "');");
		sb.append("history.back();");
		sb.append("</script>");

		return sb.toString();
	}

	public static String home(String msg) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("location.href='/"+msg+"'");
		sb.append("</script>");

		return sb.toString();
	}

}
