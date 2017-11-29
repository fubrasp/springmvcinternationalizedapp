package fr.ul.m2sid.mailspringmvcapp.mail;

import org.springframework.stereotype.Service;
import sun.management.resources.agent_fr;

import javax.mail.*;
import java.util.ArrayList;
import java.util.Properties;

@Service
public class MailReceiver implements IMailReceiver {

    //Set mail properties and configure accordingly
    String hostval = "smtp.mailtrap.io";
    String mailStrProt = "pop3";
    String uname = "75f1ea16e05565";
    String pwd = "06551260b74810";

    public ArrayList<fr.ul.m2sid.mailspringmvcapp.metier.Message> checkMail(){
        ArrayList<fr.ul.m2sid.mailspringmvcapp.metier.Message> messages = new ArrayList<fr.ul.m2sid.mailspringmvcapp.metier.Message>();
        try {
            //Set property values
            Properties propvals = new Properties();
            propvals.put("mail.pop3.host", hostval);
            propvals.put("mail.pop3.port", "1100");
            propvals.put("mail.pop3.starttls.enable", "true");

            Session emailSessionObj = Session.getDefaultInstance(propvals);
            //Create POP3 store object and connect with the server
            Store storeObj = emailSessionObj.getStore("pop3");
            storeObj.connect(hostval, uname, pwd);
            //Create folder object and open it in read-only mode
            Folder emailFolderObj = storeObj.getFolder("INBOX");
            emailFolderObj.open(Folder.READ_ONLY);
            //Fetch messages from the folder and print in a loop
            Message[] messageobjs = emailFolderObj.getMessages();

            for (int i = 0, n = messageobjs.length; i < n; i++) {
                Message indvidualmsg = messageobjs[i];
                System.out.println("Printing individual messages");
                System.out.println("No# " + (i + 1));
                System.out.println("Email Subject: " + indvidualmsg.getSubject());
                System.out.println("Sender: " + indvidualmsg.getFrom()[0]);
                System.out.println("Content: " + indvidualmsg.getContent().toString());
                //System.out.println("Date: " + indvidualmsg.getReceivedDate().toString());

                messages.add(new fr.ul.m2sid.mailspringmvcapp.metier.Message(indvidualmsg.getFrom()[0].toString(), indvidualmsg.getSubject(), indvidualmsg.getContent().toString(), indvidualmsg.getReceivedDate()));

            }
            //Now close all the objects
            emailFolderObj.close(false);
            storeObj.close();
        } catch (NoSuchProviderException exp) {
            exp.printStackTrace();
        } catch (MessagingException exp) {
            exp.printStackTrace();
        } catch (Exception exp) {
            exp.printStackTrace();
        }
        return messages;
    }
}
