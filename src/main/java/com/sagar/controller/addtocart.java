package com.sagar.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.sagar.model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "addtocart", urlPatterns = {"/addtocart"})
public class addtocart extends HttpServlet
{
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
	{
        response.setContentType("text/html;charset=UTF-8");
        // type of the response sent to the client or browser
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Registration r = new Registration(session);
        if (session.getAttribute("name") != null && request.getParameter("bookevent") != null) 
        {
                String status = r.Booknow(request);
                if (status.equals("success")) 
                {
                    request.setAttribute("status", "Booking successful.<a href='Eventstatus.jsp'>Click here</a> to check status.");
                    RequestDispatcher rd = request.getRequestDispatcher("Eventbooking.jsp?event_id=" + request.getParameter("event_id"));
                    rd.forward(request, response);
                } 
                else if (status.equals("failure"))
                {
                    request.setAttribute("status", "Booking failed");
                    RequestDispatcher rd = request.getRequestDispatcher("Eventbooking.jsp?event_id=" + request.getParameter("event_id"));
                    rd.forward(request, response);
                } 
                else if (status.equals("existed")) 
                {
                    request.setAttribute("status", "Date not available for event");
                    RequestDispatcher rd = request.getRequestDispatcher("Eventbooking.jsp?event_id=" + request.getParameter("event_id"));
                    rd.forward(request, response);
                }
            }


        	else if (session.getAttribute("name") != null && request.getParameter("cancelevent") != null) 
        	{
                int event_id = Integer.parseInt(request.getParameter("event_id"));
                int status = r.deleteevent(event_id);
                if (status > 0) 
                {
                    RequestDispatcher rd = request.getRequestDispatcher("Eventstatus.jsp");
                    rd.forward(request, response);
                }
            }
        else if (session.getAttribute("name") != null && request.getParameter("bookevent") != null) {
            String status = r.Booknow(request);
            if (status.equals("success")) {
                request.setAttribute("status", "Booking successful.<a href='Eventstatus.jsp'>Click here</a> to check status.");
                RequestDispatcher rd = request.getRequestDispatcher("EventBooking.jsp?event_id=" + request.getParameter("event_id"));
                rd.forward(request, response);
            } else if (status.equals("failure")) {
                request.setAttribute("status", "Booking failed");
                RequestDispatcher rd = request.getRequestDispatcher("EventBooking.jsp?event_id=" + request.getParameter("event_id"));
                rd.forward(request, response);
            } else if (status.equals("existed")) {
                request.setAttribute("status", "Date not available for event");
                RequestDispatcher rd = request.getRequestDispatcher("EventBooking.jsp?event_id=" + request.getParameter("event_id"));
                rd.forward(request, response);
            }
        }


        else if (session.getAttribute("name") != null && request.getParameter("cancelevent") != null) 
        {
            int event_id = Integer.parseInt(request.getParameter("event_id"));
            int status = r.deleteevent(event_id);
            if (status > 0)
            {
                RequestDispatcher rd = request.getRequestDispatcher("Eventstatus.jsp");
                rd.forward(request, response);
            }
        }


	}
	 
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException
	 {
	        processRequest(request, response);
	 }

	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException 
	    {
	        processRequest(request, response);
	    }
}
