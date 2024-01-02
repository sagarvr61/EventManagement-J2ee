package com.sagar.controller;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.sagar.model.Registration;
//import com.archi.Model.student;

@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // type of the response sent to the client or browser
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Registration reg = new Registration(session);
        try {
            if (request.getParameter("register") != null) {

                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String pw = request.getParameter("pw");
                String cp = request.getParameter("cp");

                if (pw.equals(cp)) {
                    String status = reg.Registration(name, phone, email, pw);
                    
                    
                    if (status.equals("existed")) {

                        request.setAttribute("status", "Existed record");
                        RequestDispatcher rd1 = request.getRequestDispatcher("Registration.jsp");
                        rd1.forward(request, response);

                    } else if (status.equals("success")) {
                        request.setAttribute("status", "Successfully Registered");
                        RequestDispatcher rd1 = request.getRequestDispatcher("Login.jsp");
                        rd1.forward(request, response);

                    } else if (status.equals("failure")) {
                        request.setAttribute("status", "Registration failed");
                        RequestDispatcher rd1 = request.getRequestDispatcher("Registration.jsp");
                        rd1.forward(request, response);

                    }
                }
            }
            else if (request.getParameter("Login") != null)
            {
                String email = request.getParameter("email");
                String pass = request.getParameter("pw");
                String status = reg.login(email, pass);
                if (status.equals("success"))
                {
                
                    RequestDispatcher rd1 = request.getRequestDispatcher("Eventbooking.jsp");
                    rd1.forward(request, response);

                } 
                else if (status.equals("failure"))
                {
                    request.setAttribute("status", "Login failed");
                    RequestDispatcher rd1 = request.getRequestDispatcher("Login.jsp");
                    rd1.forward(request, response);
                }
            } 
            else if (request.getParameter("logout") != null) {
                session.invalidate();
                RequestDispatcher rd1 = request.getRequestDispatcher("Index.jsp");
                rd1.forward(request, response);
            } 
            else if(request.getParameter("continue")!=null)
            {
            	String email=request.getParameter("email");
            	String status=reg.forgot(email);
            	if(status.equals("success"))
            	{
            		RequestDispatcher rd1 = request.getRequestDispatcher("Change.jsp");
                    rd1.forward(request, response);
            	}
            	else if(status.equals("failure"))
            	{
            		request.setAttribute("status","Invalid email");
            		RequestDispatcher rd1 = request.getRequestDispatcher("Fpass.jsp");
                    rd1.forward(request, response);
                }
            	
            }
            else if (session.getAttribute("name") != null && request.getParameter("bookevent") != null)
            {
                String status = reg.Booknow(request);
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
                int status = reg.deleteevent(event_id);
                if (status > 0) 
                {
                    RequestDispatcher rd = request.getRequestDispatcher("Eventstatus.jsp");
                    rd.forward(request, response);
                }
            }
            else if(request.getParameter("change")!=null)
            {
            	String pword=request.getParameter("pw");
            	String cword=request.getParameter("cp");
            	if(pword.equals(cword))
            	{
            		String status=reg.change(pword);
            		if(status.equals("existed"))
            		{
            			request.setAttribute("status","existed password");
            			RequestDispatcher rd1 = request.getRequestDispatcher("Change.jsp");
                        rd1.forward(request, response);
            		}
            		else if(status.equals("success"))
            		{
            			request.setAttribute("status","password updated successfully");
            			RequestDispatcher rd1 = request.getRequestDispatcher("Login.jsp");
                        rd1.forward(request, response);
            			
            		}
            		else if(status.equals("failure"))
            		{
            			request.setAttribute("status","upadation failed");
            			RequestDispatcher rd1 = request.getRequestDispatcher("Change.jsp");
                        rd1.forward(request, response);
            		}
            	}
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

   
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
