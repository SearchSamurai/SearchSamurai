package jp.co.koh.ibatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.log4j.Logger;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

/**
 * SqlMapClientを返すクラス。
 * @author hara
 *
 */
public class SqlMapConfig {

	/** logger */
	private static final Logger log = Logger.getLogger(SqlMapConfig.class);
    /** sqlMapClient */
    private static SqlMapClient sqlMap;

    static {
        try {
            String resource = "sqlMapConfig.xml";
            //シングルトンとして利用
            if (sqlMap == null) {
                Reader reader = Resources.getResourceAsReader(resource);
                sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
            }
        } catch (IOException e) {
			log.error(e);
        }
    }

    /**
     * SqlMapClientインスタンスを取得します。
     * @return sqlMap
     */
    public static SqlMapClient getSqlMapInstance() {
        return sqlMap;
    }

}
