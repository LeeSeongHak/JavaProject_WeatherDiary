package global.sesoc.project1.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project1.vo.DiaryVO;

@Repository
public class DiaryDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertDiary(DiaryVO diaryVO){
		
		int result = 0;
		
		DiaryMapper mapper = sqlSession.getMapper(DiaryMapper.class);
		try {
			result = mapper.insertDiary(diaryVO);
		}
		catch (Exception e) {
				e.printStackTrace();
		}
		
		return result;
	}
}
