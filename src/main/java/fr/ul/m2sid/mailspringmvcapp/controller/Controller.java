package fr.ul.m2sid.mailspringmvcapp.controller;

import fr.ul.m2sid.mailspringmvcapp.mail.IMailReceiver;
import fr.ul.m2sid.mailspringmvcapp.mail.IMailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.Locale;

@org.springframework.stereotype.Controller
public class Controller {

    @Autowired
    public IMailSender mailSender;
    @Autowired
    public IMailReceiver mailReceiver;

    @GetMapping("/")
    public String defaultPage(Model model){
        ArrayList<fr.ul.m2sid.mailspringmvcapp.metier.Message> messages = mailReceiver.checkMail();
        model.addAttribute("messages", messages);
        return "index";
    }

    @GetMapping("/sendMail")
    public String getSendMailForm(){
        return "formSendMail";
    }

    @PostMapping("/sendMail")
    public String sendMail(String name, String email, String subject, String content){
        System.out.println(name+" "+email+" "+content);
        mailSender.send(email, "["+email+"_"+name+"]" + subject, content);
        return "redirect:/";
    }

    @ExceptionHandler(Exception.class)
    public String handleErrors(Exception ex, Model model){
        model.addAttribute("error", ex.toString());
        return "redirect:/sendMail";
    }


}
