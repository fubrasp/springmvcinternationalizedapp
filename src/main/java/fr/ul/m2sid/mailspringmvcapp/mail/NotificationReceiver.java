package fr.ul.m2sid.mailspringmvcapp.mail;

import fr.ul.m2sid.mailspringmvcapp.metier.Message;

import java.util.ArrayList;

public interface NotificationReceiver {
    public ArrayList<Message> checkMail();
}
