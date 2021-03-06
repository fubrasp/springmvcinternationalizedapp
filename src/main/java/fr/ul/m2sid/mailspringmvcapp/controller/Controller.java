package fr.ul.m2sid.mailspringmvcapp.controller;

import fr.ul.m2sid.mailspringmvcapp.mail.NotificationReceiver;
import fr.ul.m2sid.mailspringmvcapp.mail.NotificationSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.jws.WebParam;
import java.util.ArrayList;

@org.springframework.stereotype.Controller
public class Controller {

    @Autowired
    public NotificationSender mailSender;
    @Autowired
    public NotificationReceiver mailReceiver;

    @GetMapping({"/check-mail", "/"})
    public String defaultPage(Model model){
        ArrayList<fr.ul.m2sid.mailspringmvcapp.metier.Message> messages = mailReceiver.receive();
        model.addAttribute("messages", messages);
        return "index";
    }

    @GetMapping("/send-mail")
    public String getSendMailForm(){
        return "formSendMail";
    }

    @PostMapping("/send-mail")
    public String sendMail(String name, String email, String subject, String content){
        System.out.println(name+" "+email+" "+content);
        mailSender.send(email, "["+email+"_"+name+"]" + subject, content);
        return "redirect:/";
    }

    @ExceptionHandler(Exception.class)
    public String handleErrors(Exception ex, Model model){
        ex.printStackTrace();
        model.addAttribute("error", ex.toString());
        return "redirect:/sendMail";
    }


}
