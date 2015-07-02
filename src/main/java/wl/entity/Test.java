package wl.entity;

import javax.persistence.*;

@Entity
@Table(name = "t_demo")
public class Test {

	@Id
	@GeneratedValue(strategy = javax.persistence.GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	@Column(name = "login_name", length = 100)
	private String loginName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Override
	public String toString() {
		return "User{" + "id=" + id + ", loginName='" + loginName + '}';
	}
}
