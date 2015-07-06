package wl.base;

import java.util.List;

public interface DaoSupport<T> {

	/**
	 * @param entity
	 */
	void save(T entity);

	/**
	 * @param id
	 */
	void delete(String id);

	/**
	 * @param entity
	 */
	void update(T entity);

	/**
	 * @param id
	 * @return
	 */
	T getById(String id);
	
	/**
	 * @param ids
	 * @return
	 */
	List<T> getByIds(String[] ids);


	/**
	 * @return
	 */
	List<T> findAll();
}
