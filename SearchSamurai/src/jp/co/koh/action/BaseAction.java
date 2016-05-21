package jp.co.koh.action;

import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import jp.co.koh.common.constants.SystemConst;
import jp.co.koh.ibatis.SqlMapConfig;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * Actionの基底クラス。
 * @author hara
 *
 */
public class BaseAction extends Action {

    /** logger */
    private static final Logger log = Logger.getLogger(BaseAction.class);
    /** SqlMapClient */
    public static final SqlMapClient sqlMap = SqlMapConfig.getSqlMapInstance();

    /**
     * applicationリソースファイルのvalueを取得します。
     * @param key キー
     * @return value
     */
    @SuppressWarnings("unchecked")
    public String getMessage(String key) {
        ServletContext context = this.getServlet().getServletContext();
        Map<String, String> applicationMap = new HashMap<String, String>();
        applicationMap = (Map<String, String>)context.getAttribute(SystemConst.APPLICATION_KEY.APPLICATION_MAP);

        return applicationMap.get(key);
    }
    /**
     * トランザクションを開始します。
     * @throws SQLException
     */
    public void startTransaction() throws SQLException {
        sqlMap.startTransaction();
    }

    /**
     * トランザクションをコミットします。
     * @throws SQLException
     */
    public void commit() throws SQLException {
        sqlMap.commitTransaction();
    }

    /**
     * トランザクションを終了します。
     * @throws SQLException
     */
    public void endTransaction() throws SQLException {
        sqlMap.endTransaction();
    }

    /**
     * セッション情報をログに出力します。
     * @param req リクエスト
     */
    @SuppressWarnings("rawtypes")
    public void outSessionInfo(HttpServletRequest req) {
        log.debug("セッション情報 セッションID：" + req.getSession().getId());
        Enumeration e = req.getSession().getAttributeNames();
        while(e.hasMoreElements()) {
            String key = (String)e.nextElement();
            log.debug("------->【key:" + key + ", value:" + req.getSession().getAttribute(key) + "】");
        }
    }
}
