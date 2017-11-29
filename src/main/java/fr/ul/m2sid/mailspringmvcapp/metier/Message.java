package fr.ul.m2sid.mailspringmvcapp.metier;

import java.util.Date;
import java.util.UUID;

public class Message {
    private UUID id;
    private String sender;
    private String subject;
    private String content;
    private java.util.Date date;

    public Message(String sender, String subject, String content, Date date) {
        this.id = UUID.randomUUID();
        this.sender = sender;
        this.subject = subject;
        this.content = content;
        this.date = date;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
