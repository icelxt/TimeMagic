package wl.action;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import wl.entity.User;
import wl.entity.UserReg;
import wl.service.UserRegService;
import wl.service.UserService;
import wl.utils.MD5Util;
import wl.utils.SendMail;

@Controller
@Scope("prototype")
public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private UserService userService;
	@Resource
	private UserRegService userRegService;
	private User user;
	private String id;

	@Value("#{email.user}")
	private String _user;
	@Value("#{email.psw}")
	private String _psw;

	public String add() {
		return "add";
	}

	public String save() {
		Calendar calendar = Calendar.getInstance();
		user.setCreateTime(calendar.getTime());
		user.setIdentity("member");
		//TODO以后通过时间控件赋值
		user.setBirthday(calendar.getTime());
		user.setPassWord(MD5Util.string2MD5(user.getPassWord()));
		userService.save(user);
		UserReg userReg = new UserReg();
		userReg.setLoginName(user.getLoginName());
		userReg.setRegTime(calendar.getTime());
		userReg.setReg(userReg.getLoginName()+",|,"+userReg.getRegTime().toString());
		userRegService.save(userReg);
		try {
			SendMail.send(_user, _psw, user,userReg.getReg());
		} catch (MessagingException e) {
			System.out.println("UserAction.save()...发送邮件验证失败！");
			e.printStackTrace();
		}
		return "toList";
	}

	public String edit() {
		user = userService.getById(id);
		return "edit";
	}

	public String update() {
		return "toList";
	}

	public String delete() {
		userService.delete(id);
		return "toList";
	}

	public String list() {
		List<User> list = userService.findAll();
//		ActionContext.getContext().getValueStack().push(list);
		ServletActionContext.getRequest().setAttribute("list", list);
		return "list";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
