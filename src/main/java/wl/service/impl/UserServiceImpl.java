package wl.service.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import wl.base.DaoSupportImpl;
import wl.entity.User;
import wl.service.UserService;

@Service
@Transactional
public class UserServiceImpl extends DaoSupportImpl<User> implements UserService {

	/**
	 * 根据姓名查询用户
	 * @return
	 */
	public List<User> getUserByName(String name){
		Session session = getSession();
		Query query = session.createQuery("from User as u where u.name=:name");
		query.setString("name", name);
		@SuppressWarnings("unchecked")
		List<User> list = query.list();
		return list;
	}
	/**
	 * 写判断 拼接更新属性？
	 */

	/**
	 * 根据用户名返回用户
	 */
	public User getUserByUserName(String userName) {
		Session session = getSession();
		Query query = session.createQuery("from User as u where u.userName=:userName");
		query.setString("userName", userName);
		User user = (User)query.uniqueResult();
		return user;
	}
}
