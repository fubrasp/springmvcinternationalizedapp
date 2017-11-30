package fr.ul.m2sid.mailspringmvcapp.mail;

public interface NotificationSender {
    public void send(String mailFrom, String subject, String content);
}
