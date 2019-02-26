package global.sesoc.project1.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project1.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlSession;
	
	public UserVO login(String id, String password){
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		
		UserVO vo = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		
		vo = mapper.login(map);
		return vo;
	}
	
	
}
