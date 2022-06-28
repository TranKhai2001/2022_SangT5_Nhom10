package com.example.the_final_term20220216;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Mail {
    private static String from = "raucuqua111@gmail.com";
    private static String password = "gcmwycbdfrvorhpp";
    public static boolean sendMail(String to, String subject, String content){
        Session session = connect();
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject(subject);

            // Now set the actual message
            message.setText(content,"UTF-8");

//            System.out.println("sending...");
            // Send message
            Transport.send(message);
            return true;
//            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();

        }
    return false;
    }
    public static Session connect(){
        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        //465, 587
        properties.put("mail.smtp.port", "587");
        //ssl to starttls
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(from,password);

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);
        return session;
    }

    public static void main(String[] args) {
        String email = "trkih2001@gmail.com";
        String content = "đường link là: ";
        Mail.sendMail(email,"xác nhận lấy mật khẩu từ trang raucuqua",content);

    }
}
