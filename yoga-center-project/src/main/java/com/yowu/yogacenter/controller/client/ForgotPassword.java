package com.yowu.yogacenter.controller.client;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    private final String OTP_PAGE = "Client/EnterOtp.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("txtEmail");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        if (email != null || !email.equals("")) {
            // sending otp
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String to = email;// change accordingly
            // Get the session object
            Properties properties = new Properties();

            //Enable authentication
            properties.put("mail.smtp.auth", "true");
            //Set TLS encryption enabled
            properties.put("mail.smtp.starttls.enable", "true");
            //Set SMTP host
            properties.put("mail.smtp.host", "smtp.gmail.com");
            //Set smtp port
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.ssl.trust", "*");
            Session session = Session.getDefaultInstance(properties, new jakarta.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("daigiaghe@gmail.com", "lmgxrmuvxbpwyjec");// Put your email
                    // id and
                    // password here
                }
            });
            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Hello, Yowu send to you the OTP to get new password.");
                message.setText("Your OTP is: " + otpvalue);
                // send message
                Transport.send(message);
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            dispatcher = request.getRequestDispatcher(OTP_PAGE);
            request.setAttribute("message", "OTP is sent to your email id");
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
        }

    }

}
