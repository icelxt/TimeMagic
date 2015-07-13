package wl.action.interceptor;

import java.security.interfaces.RSAPrivateKey;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.util.ValueStack;

import wl.utils.RSAUtil;

public class RSAInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		HttpServletRequest request= (HttpServletRequest) ctx.get(StrutsStatics.HTTP_REQUEST);
		ValueStack stack = ctx.getValueStack();
		RSAPrivateKey privateKey = (RSAPrivateKey)ServletActionContext.getRequest().getSession().getAttribute("privateKey");
		String key = request.getParameter("key");
		String[] split = key.split(",");
		String psw = RSAUtil.decryptByPrivateKey(split[1], privateKey);
		stack.setParameter("psw", psw);
		return invocation.invoke();
	}

}
