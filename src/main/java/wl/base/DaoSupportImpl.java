package wl.base;

import java.lang.reflect.ParameterizedType;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@SuppressWarnings("unchecked")
public abstract class DaoSupportImpl<T> implements DaoSupport<T> {

	@Resource
	private SessionFactory sessionFactory;
	protected Class<T> clazz = null;

	public DaoSupportImpl() {
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		this.clazz = (Class<T>) pt.getActualTypeArguments()[0];

		System.out.println("---> clazz = " + clazz);
	}

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(T entity) {
		getSession().save(entity);
	}

	public void update(T entity) {
		getSession().update(entity);
	}

	public void delete(String id) {
		if (StringUtils.isBlank(id)) {
			return;
		}
		Object entity = getById(id);
		if (entity != null) {
			getSession().delete(entity);
		}
	}
	@Transactional(readOnly=true)
	public T getById(String id) {
		if (id == null) {
			return null;
		} else {
			return (T) getSession().get(clazz, id);
		}
	}

	public List<T> getByIds(String[] ids) {
		if(ids == null || ids.length == 0){
			return Collections.EMPTY_LIST;
		}
		
		return getSession().createQuery(//
				"FROM " + clazz.getSimpleName() + " WHERE id IN (:ids)")//
				.setParameterList("ids", ids)//
				.list();
	}

	public List<T> findAll() {
		return getSession().createQuery("FROM " + clazz.getSimpleName()).list();
	}

}
