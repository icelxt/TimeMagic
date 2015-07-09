package wl.service;

import java.util.List;

import wl.base.DaoSupport;
import wl.entity.User;

public interface UserService extends DaoSupport<User> {

	public List<User> getUserByName(String name);
	public User getUserByUserName(String userName);
}
