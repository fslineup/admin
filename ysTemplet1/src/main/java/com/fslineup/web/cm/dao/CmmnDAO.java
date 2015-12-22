package com.fslineup.web.cm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


/**
 * @Class Name : CmmnDao.java
 * @Description : CmmnDAO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 					           최초생성
 *
 * @author 
 * @since 
 * @version 1.0
 * @see
 *
 *  
 */
@Repository("cmmnDAO")
public class CmmnDAO extends EgovAbstractMapper {

	/**
	 * 목록을 조회한다.
	 * @param VO - 조회용 Object, String QueryId
	 * @return List
	 * @exception Exception
	 */
	public List<?> selectList(Object paramVO, String queryId) throws Exception {
        return (List<?>)list(queryId + ".selectList", paramVO);
    }
    
	/**
	 * 전체 레코드 카운터를 조회한다.
	 * @param VO - 조회용 Object, String QueryId
	 * @return int
	 * @exception Exception
	 */
    public int selectCount(Object paramVO, String queryId) throws Exception {
        return (Integer)getSqlSession().selectOne(queryId + ".selectCount", paramVO);
    }
    
    /**
	 * 상세정보를 조회한다.
	 * @param VO - 조회용 Object, String QueryId
	 * @return Object
	 * @exception Exception
	 */
    public Object selectContents(Object paramVO, String queryId) throws Exception {
    	return selectByPk(queryId + ".selectContents", paramVO);
    }

    /**
   	 * 정보를 입력한다.
   	 * @param VO - 조회용 Object, String QueryId
   	 * @return null
   	 * @exception Exception
   	 */
    public void insertContents(Object paramVO, String queryId) throws Exception {
    	insert(queryId + ".insertContents", paramVO);
    }
    
    /**
   	 * 정보를 수정한다.
   	 * @param VO - 조회용 Object, String QueryId
   	 * @return null
   	 * @exception Exception
   	 */
    public void updateContents(Object paramVO, String queryId) throws Exception {
    	update(queryId + ".updateContents", paramVO);
    }
     
    /**
     * 정보를 삭제한다.
     * @param VO - 조회용 Object, String QueryId
     * @return null
     * @exception Exception
     */
    public void deleteContents(Object paramVO, String queryId) throws Exception {
    	delete(queryId + ".deleteContents", paramVO);
    }
}
