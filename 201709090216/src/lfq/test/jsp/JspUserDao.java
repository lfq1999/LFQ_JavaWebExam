package lfq.test.jsp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class JspUserDao {
		private Connection con;
		public Boolean check(JspUser jspuser) throws Exception {
		Boolean flag = false;
		con = DbConnection.getConnection();
		Statement stm = con.createStatement();
		ResultSet rs = stm.executeQuery("select username,password from jspuser");
		ArrayList<JspUser> data = new ArrayList<JspUser>();
		while (rs.next()) {
			JspUser item = new JspUser();
			item.setUsername(rs.getString("username"));
			item.setPassword(rs.getString("password"));
			data.add(item);
		}
		rs.close();
		stm.close();
		con.close();
		for(int i=0;i<data.size();i++) {
			JspUser user = (JspUser)data.get(i);
			String Username = (String)user.getUsername();
			String Password = (String)user.getPassword();
			if(Username.equals(jspuser.getUsername())&&Password.equals(jspuser.getPassword())) {
				flag = true;
				break;
			}else {
				flag = false;
			}
		}
		System.out.println("201709090216正在访问数据库.......");
		return flag;
	}

}
