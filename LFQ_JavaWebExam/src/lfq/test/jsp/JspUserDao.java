package lfq.test.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JspUserDao {
	
	
	// 定义私有变量保存连接对象
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
//			System.out.println(flag);
			return flag;
			
		}

		public List<JspUser> queryAll() throws Exception {
			con = DbConnection.getConnection();
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select id,username,email,password from jspuser");
			List<JspUser> data = new ArrayList<JspUser>();
			while (rs.next()) {
				JspUser item = new JspUser();
				item.setId(rs.getInt("id"));
				item.setUsername(rs.getString("username"));
				item.setEmail(rs.getString("email"));
				item.setPassword(rs.getString("password"));
				data.add(item);
			}
			rs.close();
			stm.close();
			con.close();
			return data;
		}
		
		
		public JspUser queryById(int id) throws Exception{
			JspUser user=null;
			con = DbConnection.getConnection();
			ResultSet rs=null;
			String sql="select * from jspuser where id=?";

				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, id);
				rs=pstmt.executeQuery();
				while(rs.next()){
					user=new JspUser(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
				}

				rs.close();
				pstmt.close();
				con.close();
			return user;
		}
		
		
		public List<JspUser> queryUserByKey(String key) throws Exception{
			List<JspUser> list =new ArrayList<JspUser>();
			con = DbConnection.getConnection();
			String sql="select * from jspuser where username like ?";
			ResultSet rs=null;
				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+key+"%");
				rs=pstmt.executeQuery();
				while(rs.next()){
					list.add(new JspUser(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
				}
			rs.close();
			pstmt.close();
			con.close();
			return list;
		}
	public int addUSer(JspUser user) {
		int flag= 0;
		String sql = "insert into jspuser(username,email,password) values(?,?,?)";
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = DbConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			flag=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public int updateUser(JspUser user) {
		int flag = 0;
		String sql = "update jspuser set username=?,email=?,password=? where id=?";
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = DbConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setInt(4, user.getId());
			flag=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}

	
	
	public int delete(int id) {
		int flag = 0;
		String sql = "delete from jspuser where id=?";
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = DbConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			flag=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
}
