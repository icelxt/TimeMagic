package wl.service;

import wl.base.DaoSupport;
import wl.entity.Test;

public interface TestService extends DaoSupport<Test> {

	public void save(Test test);
	public void delete(Long id);
	public Test get(Long id);
}
