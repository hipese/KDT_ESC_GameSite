package commons;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {
    private final String USER_EMAIL = "kdtesc134679@gmail.com";
    private final String USER_PW = "nrfi rwia iavb qkxt";
    private final String SMTP_HOST = "smtp.gmail.com";
    private final String CHARACTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private final String SPECIAL_CHARACTERS = "!@#$";
    //private final int SMTP_PORT = 465; //SSL
  	private final int SMTP_PORT = 587; //TLS

    public String sendEmail(String toEmail) {
        // SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        //props.put("mail.smtp.ssl.enable", "true"); 
        //props.put("mail.smtp.ssl.trust", SMTP_HOST);

        // 세션 생성
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USER_EMAIL, USER_PW);
            }
        });

        try {
            // 이메일 생성 및 보내기
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("ESC sends your temporary password");

            String temporaryPassword = generateRandomPassword();
            message.setText("Your temporary password is : " + temporaryPassword);

            Transport.send(message);

            return temporaryPassword;
        } catch (MessagingException e) {
            // 예외 처리: 이메일 전송 중 에러 발생
            e.printStackTrace();
            return null; // 또는 다른 방식으로 오류 처리
        }
    }

    public String generateRandomPassword() {
        Random random = new Random();
        StringBuilder password = new StringBuilder();

        // 랜덤한 길이(7~8)를 생성
        int length = random.nextInt(2) + 7;

        // 영어 대소문자와 숫자로 이루어진 문자열 생성
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(index);
            password.append(randomChar);
        }

        // 랜덤한 특수 문자('!', '@', '#', '$')를 마지막에 추가
        int specialCharIndex = random.nextInt(SPECIAL_CHARACTERS.length());
        char randomSpecialChar = SPECIAL_CHARACTERS.charAt(specialCharIndex);
        password.append(randomSpecialChar);

        return password.toString();
    }

   
}
