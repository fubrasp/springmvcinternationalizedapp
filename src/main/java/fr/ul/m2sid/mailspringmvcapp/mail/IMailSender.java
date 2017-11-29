package fr.ul.m2sid.mailspringmvcapp.mail;

public interface IMailSender {
    public void send(String subject, String content);
}
