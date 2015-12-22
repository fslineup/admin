package com.fslineup.web.cm.service;

import java.util.List;

/**
 * @Class Name : CmmnService.java
 * @Description : CmmnService Class
 * @Modification Information
 * @
 * @  ?�정??     ?�정??             ?�정?�용
 * @ ---------   ---------   -------------------------------
 * @ 					           최초?�성
 *
 * @author 
 * @since 
 * @version 1.0
 * @see
 *
 * 
 */
public interface CmmnService {

	/**
	 * 목록??조회?�다.
	 * @param VO - 조회??VO, String QueryId
	 * @return List
	 * @exception Exception
	 */
	List<?> selectList(Object paramVO, String queryId) throws Exception;

	/**
	 * ?�체 ?�코??카운?��? 조회?�다.
	 * @param VO - 조회??Object, String QueryId
	 * @return int
	 * @exception Exception
	 */
    int selectCount(Object paramVO, String queryId) throws Exception;
    
	/**
	 * ?�세?�보�?조회?�다.
	 * @param VO - 조회??Object, String QueryId
	 * @return Object
	 * @exception Exception
	 */
	Object selectContents(Object paramVO, String queryId) throws Exception;
       
	/**
	 * ?�보�??�력?�다.
	 * @param VO - 조회??Object, String QueryId
	 * @return 
	 * @return Object
	 * @exception Exception
	 */
	void insertContents(Object paramVO, String queryId) throws Exception;
	
	/**
	 * ?�보�??�정?�다.
	 * @param VO - 조회??Object, String QueryId
	 * @return 
	 * @return Object
	 * @exception Exception
	 */
	void updateContents(Object paramVO, String queryId) throws Exception;
       
	/**
	 * ?�보�???��?�다.
	 * @param VO - 조회??Object, String QueryId
	 * @return Object
	 * @exception Exception
	 */
	void deleteContents(Object paramVO, String queryId) throws Exception;
}
