package wl.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import wl.entity.User;
import wl.service.UserService;

@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private UserService userService;
	private String loginName;
	private String psw;

	public String login() {
		System.out.println(psw);
		User user = userService.getUserByUserName(loginName);
		String err = null;
		if(user == null || !user.getPassWord().equals(psw)){
			err = "用户名不存在或密码错误";
			ActionContext.getContext().getValueStack().push(err);
			return ERROR;
		}
		ServletActionContext.getRequest().getSession().setAttribute("user", user);
		return SUCCESS;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

}
