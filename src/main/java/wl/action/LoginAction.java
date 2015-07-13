package wl.action;

import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import wl.entity.User;
import wl.service.UserService;
import wl.utils.Base64Util;
import wl.utils.RSAUtil;

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
	private User user;

	public String in() {
		user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user == null){
			user = userService.getUserByUserName(loginName);
			String err = null;
			if(user == null || !user.getPassWord().equals(psw)){
				err = "用户名不存在或密码错误";
				ActionContext.getContext().getValueStack().push(err);
				return ERROR;
			}
			ServletActionContext.getRequest().getSession().setAttribute("user", user);
		}else{
			ActionContext.getContext().getValueStack().push(user);
		}
		return SUCCESS;
	}

	public String login(){
		HashMap<String,Object> map = RSAUtil.getKeys();
		RSAPublicKey publicKey = (RSAPublicKey) map.get("public");
		RSAPrivateKey privateKey = (RSAPrivateKey) map.get("private");
//		ServletActionContext.getRequest().setAttribute("publicKey", Base64Util.getKeyString(publicKey));
		ServletActionContext.getRequest().setAttribute("publicKey", Base64Util.encrypt(publicKey.getPublicExponent().toString()+","+publicKey.getModulus().toString()));
		ServletActionContext.getRequest().getSession().setAttribute("privateKey", privateKey);
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
