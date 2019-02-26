package global.sesoc.project1.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiaryDAO {

	@Autowired
	SqlSession sqlSession;
}
