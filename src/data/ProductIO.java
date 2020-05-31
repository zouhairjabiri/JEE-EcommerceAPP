package data;

import java.io.*;
import java.sql.*;
import java.util.*;

import metier.*;

public class ProductIO {

	public static Product getProduct(String code) throws SQLException {

		try {
		
		      String myDriver = "com.mysql.jdbc.Driver";
		      String myUrl  = "jdbc:mysql://localhost:3306/livres";
		      Class.forName(myDriver);
		      Connection conn = DriverManager.getConnection(myUrl, "root", "");
		      String query = "SELECT * FROM `livre` WHERE `code`="+code;
		      Statement st = conn.createStatement();
		      ResultSet rs = st.executeQuery(query);
		      
		      while (rs.next())
		      {
					Product p = new Product();
					String codeSQL = rs.getString("code");
				    String descriptionSQL = rs.getString("description");
				    Double prixSQL = rs.getDouble("prix");
				    
					p.setCode(codeSQL);
					p.setDescription(descriptionSQL);
					p.setPrice(prixSQL);
					return p;
		      }


		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}


}