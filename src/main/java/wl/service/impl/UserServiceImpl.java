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
	 * ����������ѯ�û�
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
	 * д�ж� ƴ�Ӹ������ԣ�
	 */
}
