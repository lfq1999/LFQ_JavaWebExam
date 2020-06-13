package lfq.test.jsp;

import java.sql.*;

public class DbConnection {
	// 定义静态方法，返回一个数据库连接
	public static Connection getConnection() {
		Connection con = null;
		String drivername = "com.mysql.jdbc.Driver";
		String urlstr = "jdbc:mysql://localhost/jsptest?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password = "lfq5611";
		try {
			// 加载驱动程序
			Class.forName(drivername);
		} catch (Exception e) {
			System.out.println("加载驱动程序错误，驱动程序名称写错或未将驱动程序放在正确的位置");
			System.out.println(e);
		}
		try {
			// 建立连接，需提供连接字符串，数据库用户名及相应的密码
			con = DriverManager.getConnection(urlstr, username, password);
		} catch (SQLException e) {
			System.out.println("建立连接错误，数据库url有错误，数据库服务器端口不正确、数据库不存在、或用户密码不对");
			System.out.println(e);
		}
		return con;
	}
}
