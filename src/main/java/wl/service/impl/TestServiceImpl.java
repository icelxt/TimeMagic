package wl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import wl.base.DaoSupportImpl;
import wl.dao.TestDao;
import wl.entity.Test;
import wl.service.TestService;

@Service
public class TestServiceImpl extends DaoSupportImpl<Test> implements TestService {

	@Resource
	private TestDao testDao;

	@Override
	public void save(Test test) {
		testDao.save(test);
	}

	@Override
	public void delete(Long id) {
		testDao.delete(id);
	}

	@Override
	public Test get(Long id) {
		return testDao.getById(id);
	}

}
