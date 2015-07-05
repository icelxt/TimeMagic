package wl.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import wl.entity.Test;
import wl.service.TestService;

@Controller
@Scope("prototype")
public class TestAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private TestService testService;
	private Test test;
	private String id;

	public String add() {
		return "add";
	}

	public String save() {
		testService.save(test);
		return "toList";
	}

	public String edit() {
		return "edit";
	}

	public String update() {
		return "toList";
	}

	public String delete() {
		testService.delete(id);
		return "toList";
	}

	public String list() {
		test = new Test();
		test.setId("123");
		test.setLoginName("your Name");
		List<Test> list = new ArrayList<Test>();
		list.add(test);
		list.add(test);
		list.add(test);
		list.add(test);
		ServletActionContext.getRequest().setAttribute("list", list);
		return "list";
	}

	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
