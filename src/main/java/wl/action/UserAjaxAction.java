package wl.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import wl.entity.User;
import wl.service.UserService;

@Controller
@Scope("prototype")
public class UserAjaxAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private UserService userService;
	private String userName;
	private String result;

	public String getUser(){
		User user = userService.getUserByUserName(userName);
		if(user != null){
			result = "已存在";
		}else{
			result = "不存在";
		}
		return SUCCESS;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
