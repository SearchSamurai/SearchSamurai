package jp.co.koh.ibatis.dao;

import jp.co.koh.ibatis.SqlMapConfig;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * DAOの基底クラス。
 * @author koh
 *
 */
public class BaseDao {

	/** SqlMapClient */
	public static final SqlMapClient sqlMap = SqlMapConfig.getSqlMapInstance();

}
