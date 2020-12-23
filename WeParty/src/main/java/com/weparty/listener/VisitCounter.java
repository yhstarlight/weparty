package com.weparty.listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class VisitCounter implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {

        HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        
        String ip = req.getRemoteAddr();
        
        Connection conn = null;
        Statement stmt = null;
        
        String user = "nyuwol"; 
        String pw = "alzl1541";
        String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
        
        try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
		} catch (SQLException | ClassNotFoundException e1) {
			e1.printStackTrace();
		}

        String query = "insert into visitor values ((select nvl(max(visitor_id), 0)+1 from visitor),'"+ ip +"',sysdate)";

        try {
        	stmt = conn.createStatement();
        	stmt.executeUpdate(query);
        	stmt.close();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
	}

}
