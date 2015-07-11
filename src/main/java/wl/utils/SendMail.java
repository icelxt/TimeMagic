package wl.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import wl.entity.User;

public class SendMail {

	public static void send(String user, String psw, User touesr) throws MessagingException {
		// 配置发送邮件的环境属性
		final Properties props = new Properties();
		/*
		 * 可用的属性： mail.store.protocol / mail.transport.protocol / mail.host /
		 * mail.user / mail.from
		 */
		// 表示SMTP发送邮件，需要进行身份验证
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", "smtp.sina.com");
		// 发件人的账号
		props.put("mail.user", user);
		// 访问SMTP服务时需要提供的密码
		props.put("mail.password", psw);

		// 构建授权信息，用于进行SMTP进行身份验证
		Authenticator authenticator = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// 用户名、密码
				String userName = props.getProperty("mail.user");
				String password = props.getProperty("mail.password");
				return new PasswordAuthentication(userName, password);
			}
		};
		// 使用环境属性和授权信息，创建邮件会话
		Session mailSession = Session.getInstance(props, authenticator);
		// 创建邮件消息
		MimeMessage message = new MimeMessage(mailSession);
		// 设置发件人
		InternetAddress form = new InternetAddress(props.getProperty("mail.user"));
		message.setFrom(form);

		// 设置收件人
		InternetAddress to = new InternetAddress(touesr.getLoginName());
		message.setRecipient(RecipientType.TO, to);

		// 设置抄送
//		InternetAddress cc = new InternetAddress("luo_aaaaa@yeah.net");
//		message.setRecipient(RecipientType.CC, cc);

		// 设置密送，其他的收件人不能看到密送的邮件地址
//		InternetAddress bcc = new InternetAddress("aaaaa@163.com");
//		message.setRecipient(RecipientType.CC, bcc);

		// 设置邮件标题
		message.setSubject("[TimeMagic] 感谢您的注册，请激活邮箱完成注册");

		// 设置邮件的内容体
		message.setContent("<p>你好, "+touesr.getName()+" 先生 :</p><h2>感谢您使用TimeMagic服务。</h2><h3>请点击以下链接进行邮箱验证，以便开始使用您的TimeMagic账号</h3><p><a href='http://www.baidu.com' title='此处有惊喜！'>开启您的TimeMgic服务</a></p><h3>如果您无法点击以上链接，请复制以下网址到浏览器里直接打开</h3><p><em>http:www.baidu.com</em></p><blockquote><p>连接有效期为48小时。</p><p>如果您并未申请TimeMagic账号，可能是其他用户误输入了您的邮箱地址。请忽略此邮件，或与我们联系。</p></blockquote>", "text/html;charset=UTF-8");

		// 发送邮件
		Transport.send(message);
	}
}
