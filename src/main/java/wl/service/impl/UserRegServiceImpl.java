package wl.service.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import wl.base.DaoSupportImpl;
import wl.entity.UserReg;
import wl.service.UserRegService;

@Service
@Transactional
public class UserRegServiceImpl extends DaoSupportImpl<UserReg> implements UserRegService {
	/**
	 * 根据用户名返回用户
	 */
	public UserReg getUserByLoginName(String loginName) {
		Session session = getSession();
		Query query = session.createQuery("from UserReg as u where u.loginName=:loginName");
		query.setString("loginName", loginName);
		UserReg user = (UserReg)query.uniqueResult();
		return user;
	}

}
