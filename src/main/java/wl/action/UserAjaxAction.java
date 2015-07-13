package wl.action;

import java.security.interfaces.RSAPublicKey;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import wl.entity.User;
import wl.service.UserService;
import wl.utils.Base64Util;
import wl.utils.MD5Util;
import wl.utils.RSAUtil;

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
	private String psw;
	private String key;

	@JSON(serialize=false)
	public String getUser() {
		User user = userService.getUserByUserName(userName);
		if (user != null) {
			result = "已存在";
		} else {
			result = "不存在";
		}
		return SUCCESS;
	}

	@JSON(serialize=false)
	public String getPsw() {
		if (StringUtils.isNotBlank(psw)) {
//			RSAPublicKey publicKey = (RSAPublicKey) ServletActionContext.getRequest().getAttribute("publicKey");
//			RSAPublicKey publicKey = null;
//			try {
//				publicKey = (RSAPublicKey) Base64Util.getPublicKey(key);
//			} catch (Exception e1) {
//				e1.printStackTrace();
//			}
//			String modulus = publicKey.getModulus().toString();
//			String public_exponent = publicKey.getPublicExponent().toString();
			key = Base64Util.Decrypt(key);
			String[] split = key.split(",");
			RSAPublicKey pubKey = RSAUtil.getPublicKey(split[1], split[0]);
			try {
				result = RSAUtil.encryptByPublicKey(MD5Util.string2MD5(psw), pubKey);
			} catch (Exception e) {
				e.printStackTrace();
			}
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

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

}
