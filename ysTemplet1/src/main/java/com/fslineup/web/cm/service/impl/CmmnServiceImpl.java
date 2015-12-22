package com.fslineup.web.cm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fslineup.web.cm.dao.CmmnDAO;
import com.fslineup.web.cm.service.CmmnService;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;


/**
 * @Class Name : CmmnService.java
 * @Description : CmmnService Class
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
@Service("cmmnService")
public class CmmnServiceImpl extends AbstractServiceImpl implements CmmnService {

	/** CmmnDAO */
	@Autowired
    private CmmnDAO cmmnDAO;
	
	/**
	 * 목록을 조회한다.
	 * @param VO - 조회용 VO, String QueryId
	 * @return List
	 * @exception Exception
	 */
	public List<?> selectList(Object paramVO, String queryId) throws Exception {
    	 return cmmnDAO.selectList(paramVO, queryId);
    }

	/**
	 * 전체 레코드 카운터를 조회한다.
	 * @param VO - 조회용 Object, String QueryId
	 * @return int
	 * @exception Exception
	 */
    public int selectCount(Object paramVO, String queryId) throws Exception {
    	 return cmmnDAO.selectCount(paramVO, queryId);
    }
    
	/**
	 * 상세정보를 조회한다.
	 * @param VO - 조회용 Object, String QueryId
	 * @return Object
	 * @exception Exception
	 */
	public Object selectContents(Object paramVO, String queryId) throws Exception {
		return cmmnDAO.selectContents(paramVO, queryId);
	}
       
	/**
	 * 정보를 입력한다.
	 * @param VO - 조회용 Object, String QueryId
	 * @return 
	 * @return Object
	 * @exception Exception
	 */
	public void insertContents(Object paramVO, String queryId) throws Exception {
		cmmnDAO.insertContents(paramVO, queryId);
	}
	
	/**
	 * 정보를 수정한다.
	 * @param VO - 조회용 Object, String QueryId
	 * @return 
	 * @return Object
	 * @exception Exception
	 */
	public void updateContents(Object paramVO, String queryId) throws Exception {
		cmmnDAO.updateContents(paramVO, queryId);
	}
       
	/**
	 * 정보를 삭제한다.
	 * @param VO - 조회용 Object, String QueryId
	 * @return Object
	 * @exception Exception
	 */
	public void deleteContents(Object paramVO, String queryId) throws Exception {
		cmmnDAO.deleteContents(paramVO, queryId);
	}       
}
