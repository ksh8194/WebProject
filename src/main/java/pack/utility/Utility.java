package pack.utility;

import org.springframework.stereotype.Component;

@Component
public class Utility {	
	public static String getConvert(String msg) {
		msg = msg.replaceAll(">", "&gt;").replaceAll("<", "&lt").replaceAll("\n","<br>");
		return msg;
	}
}
