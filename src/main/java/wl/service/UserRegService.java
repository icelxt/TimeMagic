package wl.service;

import wl.base.DaoSupport;
import wl.entity.UserReg;

public interface UserRegService extends DaoSupport<UserReg> {

	public UserReg getUserByLoginName(String loginName);
}
