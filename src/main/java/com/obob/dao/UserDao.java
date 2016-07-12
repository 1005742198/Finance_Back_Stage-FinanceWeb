package com.obob.dao;

import java.util.List;
import java.util.Map;

import com.obob.support.db.MyBatisDao;
import com.obob.vo.UserVo;

/**
 * 
 * User
 * @author auto-generator
 * 2016-07-12 33:18:13
 */
@MyBatisDao
public interface UserDao {
	public int insert(UserVo o);
	
	public int update(UserVo o);
	
	public void delete(Map<String, Object> map);
	
	public UserVo getById(Map<String, Object> map);
	
	public List<UserVo> select(Map<String, Object> map);

}
