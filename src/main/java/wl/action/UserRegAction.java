package wl.action;

import java.util.Calendar;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import wl.entity.User;
import wl.entity.UserReg;
import wl.service.UserRegService;
import wl.service.UserService;
import wl.utils.Base64Coding;
import wl.utils.SendMail;

@Controller
@Scope("prototype")
public class UserRegAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private UserService userService;
	@Resource
	private UserRegService userRegService;
	private String user_reg;

	@Value("#{email.user}")
	private String _user;
	@Value("#{email.psw}")
	private String _psw;

	public String reg() {
		if(StringUtils.isBlank(user_reg)){
			return ERROR;
		}
		String decrypt = Base64Coding.Decrypt(user_reg);
		String[] split = decrypt.split(",|,");
		UserReg userReg = userRegService.getUserByLoginName(split[0]);
		if(userReg!=null){
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, -2);
			if(userReg.getRegTime().toString().equals(split[1]) && userReg.getRegTime().after(calendar.getTime())){
				User user = userService.getUserByUserName(userReg.getLoginName());
				user.setIdentity("vip");
				userService.update(user);
				userRegService.delete(userReg.getId());
			}else{
				System.out.println("激活链接已超时");
				return "toList";//指向重新激活的页面
			}
		}else{
			System.out.println("用户已经激活！");
			return ERROR;
		}
		return "reg";
	}

	public String rereg(){
		User user = new User();//通过session获取用户信息
		if(!user.getIdentity().equals("member")){
			return "";//重定向到主页
		}
		UserReg userReg = userRegService.getUserByLoginName(user.getLoginName());
		userReg.setRegTime(Calendar.getInstance().getTime());
		userReg.setReg(userReg.getLoginName() + ",|,"+ userReg.getRegTime());
		try {
			SendMail.send(_user, _psw, user,userReg.getReg());
		} catch (MessagingException e) {
			System.out.println("UserRegAction.rereg()...发送邮件验证失败！");
			e.printStackTrace();
		}
		return "rereg";
	}

	public String getUser_reg() {
		return user_reg;
	}

	public void setUser_reg(String user_reg) {
		this.user_reg = user_reg;
	}

}
