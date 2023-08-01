package com.thaisq.service.mail;

import javax.mail.MessagingException;

import com.thaisq.model.MailInformation;

public interface MailService {
	void send(MailInformation mail) throws MessagingException;
	void send(String to, String subject, String body) throws MessagingException;
	void queue(MailInformation mail);
	void queue(String to, String subject, String body);
}
