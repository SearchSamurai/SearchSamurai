package jp.co.koh.ibatis.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import jp.co.koh.ibatis.dto.User;
import jp.co.koh.ibatis.dao.UserDao;

import org.apache.log4j.Logger;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 *  ユーザーテーブルDAO
 * @author kurose
 *
 */
public class UserDao {

    /** SqlMapClient */
    private SqlMapClient sqlMap;
    /** logger */
    private static final Logger log = Logger.getLogger(UserDao.class);

    /**
     * コンストラクタ
     * @param sqlMap sqlMap
     */
    public UserDao(SqlMapClient sqlMap){
        this.sqlMap = sqlMap;
    }

    /**
     * ユーザーテーブルからユーザーIDに紐づいたレコードを取得
     * @param userId
     * @return
     * @throws SQLException
     */
    public User findUser(String userId) throws SQLException {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userId", userId);

		log.debug("userId=" + userId);

        // SQL呼び出し
        User seachResult =  (User)sqlMap.queryForObject("findUser", paramMap);

        return seachResult;
    }

    /**
     * ユーザ管理テーブルにユーザを登録します。
     * @param UserRegistActionForm ユーザID
     * @param userPassword パスワード
     * @throws SQLException
     */
    public void addUser(String userId, String userPassword) throws SQLException {
        HashMap<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userId", userId);
        paramMap.put("userPassword", userPassword);
        paramMap.put("registName", userId);

        log.debug("userId=" + userId);
        log.debug("userPassword=" + userPassword);

        sqlMap.insert("addUser", paramMap);
    }
    /**
     * ユーザー管理テーブルからpassを更新
     * @author hara
     * @throws SQLException
     */
    public void upDatePass(String userId, String userPassword) throws SQLException{
        HashMap<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userId", userId);
        paramMap.put("userPassword",userPassword);

        log.debug("userId=" + userId);
        log.debug("userPassword=" + userPassword);

        sqlMap.update("UserUpd", paramMap);
    }

}
