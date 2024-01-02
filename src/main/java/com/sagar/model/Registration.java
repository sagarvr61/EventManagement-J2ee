package com.sagar.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



public class Registration
{
     HttpSession se;
	 Statement st = null;
     ResultSet rs = null;
     Connection con=null;
     
     public Registration(HttpSession session) {
    	 try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/events","root","Sagar");
			se=session;
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

     }
     public String Registration(String name, String phone, String email, String pw) {
         PreparedStatement ps;
         String status = "";
         try {
             Statement st = null;
             ResultSet rs = null;
             st = con.createStatement();
             rs = st.executeQuery("select * from userdata where phone='" + phone + "' or email='" + email + "';");
             boolean b = rs.next();
             if (b) {
                 status = "existed";
             } else {
                 ps = (PreparedStatement) con.prepareStatement("insert into userdata values(0,?,?,?,?,now())");
                 ps.setString(1, name);
                 ps.setString(2, phone);
                 ps.setString(3, email);
                 ps.setString(4, pw);
                 int a = ps.executeUpdate();
                 if (a > 0) {
                     status = "success";
                 } else {
                     status = "failure";
                 }
             }

         } catch (Exception e) {
             e.printStackTrace();
         }
         return status;
     }

     
	public ArrayList<Dproduct> get_eventinfo(String event_category) 
	
	{
        ArrayList<Dproduct> al = new ArrayList<Dproduct>();
        try
        {
            st = con.createStatement();
            
            String qry = " select * from events.eventstable where event_name='" +event_category+"';";
            rs = st.executeQuery(qry);
           
            
            while (rs.next())
            {
                Dproduct d = new Dproduct();
            
                d.setP_id(rs.getString("event_id")); // 1..r---db 2.. pass the data or value to Dproduct class set method
                d.setP_image(rs.getString("event_image"));
                d.setP_name(rs.getString("event_name"));
                d.setP_cost(rs.getString("event_cost"));
                d.setP_details(rs.getString("event_details"));
                d.setP_details(rs.getString("event_category"));
                d.setP_details(rs.getString("date"));
                al.add(d);
            }

        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        return al;

    
	}


public Dproduct getEventFormInfo() {
        Statement st = null;
        ResultSet rs = null;
        Dproduct s = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from eventstable where event_id= '" + se.getAttribute("id") +"'");
            boolean b = rs.next();
            if (b == true) {
                s = new Dproduct();
                s.setP_name(rs.getString("event_name"));
                s.setP_cost(rs.getString("event_cost"));
            } else 
            {
 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }


public String login(String email, String pw) {
    String status = "";
    try {
        
        String name = "", email1 = "", phone = "";
        String id = "";
        Statement st = null;
        ResultSet rs = null;
        st = con.createStatement();
        rs = st.executeQuery("select * from userdata where email='" + email + "' and pw='" + pw + "';");
        boolean b = rs.next();
        if (b == true) {
            name = rs.getString("name");
            phone = rs.getString("phone");
            email1 = rs.getString("email");
            id = rs.getString("id");
            se.setAttribute("name", name);
            se.setAttribute("id", id);
            se.setAttribute("email", email1);
            se.setAttribute("phone", phone);
            status = "success";

        } else {
            status = "failure";
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
}



public String Booknow(HttpServletRequest request) {
        String status = "";
        ResultSet rs = null;
        try {
            Statement st = con.createStatement();
            rs = st.executeQuery("select event_id from bookevent where eventdate= '" + request.getParameter("edate") + "'");
            boolean b = rs.next();
            if (b == true) {
                status = "existed";
            } else {
                String qry = "insert into bookevent select 0,event_image,event_name,'" 
            + request.getParameter("pno") + "', '" + request.getParameter("email") 
            + "','" + request.getParameter("address") + "',event_cost,'" 
            + se.getAttribute("name") + "'," + se.getAttribute("id") 
            + " ,'pending',now(),'" + request.getParameter("edate") 
            + "' from eventstable where event_id=" + se.getAttribute("id") + ";";
                int a = st.executeUpdate(qry);
                if (a > 0) {
                    status = "success";
                } else {
                    status = "failure";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }


public int deleteevent(int event_id)
{
    int status = 0;
    try 
    {
        Statement st = null;
        st = con.createStatement();
        String qry = "update bookevent set status='cancelled' where event_id=' " + event_id + "' ";
        status = st.executeUpdate(qry);
    }
    catch (Exception e) 
    {
        e.printStackTrace();
    }
    return status;
}

public ArrayList<Dproduct> geteventstatus()
{
    ArrayList<Dproduct> al = new ArrayList<Dproduct>();
    try
    {
        st = con.createStatement();
        HttpSession session=se;
		String qry = " select *,date_format(date,'%d %b,%Y') as date1,date_format(eventdate,'%d %b,%Y') as date2 from bookevent where u_id='" + session.getAttribute("id") + " ';";
        rs = st.executeQuery(qry);
        while (rs.next()) 
        {
            Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
            d.setP_id(rs.getString("event_id"));
            d.setP_image(rs.getString("event_image"));
            d.setP_name(rs.getString("event_name"));
            d.setP_cost(rs.getString("event_cost"));
            d.setPhone(rs.getString("phone"));
            d.setEmail(rs.getString("email"));
            d.setDate(rs.getString("date1"));
            d.setEventdate(rs.getString("date2"));
            d.setStatus(rs.getString("status"));
            al.add(d);
        }

    }
    catch (Exception e)
    {
        e.printStackTrace();
    }

    return al;

}
public String forgot(String email)
{
	PreparedStatement ps=null;
	String status="";
	String Q1="SELECT * FROM userdata WHERE EMAIL=?";
	try
	{
		ResultSet rs=null;
		ps=con.prepareStatement(Q1);
		ps.setString(1, email);
		rs=ps.executeQuery();
		if(rs.next()==true)
		{
			String mail=rs.getString("email");
			se.setAttribute("email", mail);
			status="success";
		}
		else
		{
			status="failure";
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return status;
}
public String change(String pwrd)
{
	PreparedStatement ps=null;
	String status="";
	String Q1="SELECT * FROM CUSTOMER WHERE EMAIL=?";
	String Q2="UPDATE CUSTOMER SET PWD=? WHERE EMAIL=?";
	try
	{
		ResultSet rs=null;
		String em=(String)se.getAttribute("email");
		ps=con.prepareStatement(Q1);
		ps.setString(1, em);
		rs=ps.executeQuery();
		if(rs.next()==true)
		{
			String pd=rs.getString("pwd");
			if(pd.equals(pwrd))
			{
				status="existed";
			}
		else
		{
			ps=con.prepareStatement(Q2);
			ps.setString(1, pwrd);
			ps.setString(2, em);
			int up=ps.executeUpdate();
			if(up>0)
			{
				status="success";
			}
			else
			{
				status="failure";
			}
		}
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return status;
}





}
