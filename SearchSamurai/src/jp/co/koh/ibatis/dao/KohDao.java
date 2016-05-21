package jp.co.koh.ibatis.dao;



import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jp.co.koh.form.KohDeleteActionForm;
import jp.co.koh.form.KohRegistActionForm;
import jp.co.koh.form.KohSearchActionForm;
import jp.co.koh.form.LoginActionForm;
import jp.co.koh.ibatis.dto.Koh;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * 武士テーブルのDAO。
 * @author koh
 */
public final class KohDao {

	/** SqlMapClient */
	private SqlMapClient sqlMap;

	/** logger */
	private static final Logger log = Logger.getLogger(KohDao.class);

	/**
	 * コンストラクタ。
	 * @param sqlMap
	 */
	public KohDao(SqlMapClient sqlMap) {
		this.sqlMap = sqlMap;
	}

    /**
     * 武士テーブルからレコードを検索します。
     * @param kohSearchActionForm 武士帳検索アクションのフォーム
     * @throws SQLException
     */
    @SuppressWarnings("unchecked")
    public List<Koh> findKoh(KohSearchActionForm kohSearchActionForm) throws SQLException {
        HashMap<String, Object> paramMap = new HashMap<String, Object>();

        illegalValueConvert(kohSearchActionForm);

		log.debug("form=" + kohSearchActionForm);

        paramMap.put("form", kohSearchActionForm);

        return sqlMap.queryForList("findKoh", paramMap);
    }

    /**
     * 武士テーブルからレコードを検索し登録日順にソートします。
     * @param kohSearchActionForm 武士帳検索アクションのフォーム
     * @throws SQLException
     */
    @SuppressWarnings("unchecked")
    public List<Koh> findKohSortByInsertDate(KohSearchActionForm kohSearchActionForm) throws SQLException {
    	HashMap<String, Object> paramMap = new HashMap<String, Object>();

    	illegalValueConvert(kohSearchActionForm);

    	log.debug("form=" + kohSearchActionForm);

    	paramMap.put("form", kohSearchActionForm);

    	return sqlMap.queryForList("findKohSortByInstDate", paramMap);
    }

    /**
     * 武士テーブルからレコードの検索件数を取得します。
     * @param kohSearchActionForm 武士帳検索アクションのフォーム
     * @throws SQLException
     */
	public String getCountSearchList(KohSearchActionForm kohSearchActionForm) throws SQLException {

        illegalValueConvert(kohSearchActionForm);

		log.debug("form=" + kohSearchActionForm);

        return (sqlMap.queryForObject("countSearchResult" , kohSearchActionForm)).toString();
    }

    /**
     * 予期せぬ空文字・0・文字化けを判定してnullに置換する。
     * @param kohSearchActionForm 武士帳検索アクションのフォーム
     * @throws SQLException
     */
	public void illegalValueConvert(KohSearchActionForm kohSearchActionForm) throws SQLException{

		//予期せぬ空文字・0・文字化けを判定してnullに置換している
        if("".equals(kohSearchActionForm.getGroupList())){
        	kohSearchActionForm.setBushiId(null);
        }
        if(Integer.valueOf(0).equals(kohSearchActionForm.getAgeFrom())){
        	kohSearchActionForm.setAgeFrom(null);
        }
        if(Integer.valueOf(0).equals(kohSearchActionForm.getAgeTo())){
        	kohSearchActionForm.setAgeTo(null);
        }
        if(Integer.valueOf(0).equals(kohSearchActionForm.getUnitPriceFrom())){
        	kohSearchActionForm.setUnitPriceFrom(null);
        }
        if(Integer.valueOf(0).equals(kohSearchActionForm.getUnitPriceTo())){
        	kohSearchActionForm.setUnitPriceTo(null);
        }
        if("".equals(kohSearchActionForm.getWeaponList())){
        	kohSearchActionForm.setUnitPriceTo(null);
        }

        //アクションフォームに日本語(武器と所属)が渡ってきた場合に文字化けする問題があり、
        //文字コードを指定して解決したかったが、方法を見つけられず下記の通りとした。
        //アクションフォームに入力した値を、武器と所属の選択リストボックス内の値と比較していき、
        //文字化けしていた場合は一致することがないはずなので、その数をカウントして判定している。
        //文字化けしていた場合は結果的に一旦nullがセットされ、呼び出し元のクラスで、
        //セッションに退避していた値をセットし直すことで検索条件を保持している。
        int count = 0;
        int allWeaponListSize = kohSearchActionForm.getAllWeaponList().size();
        String selectedWeapon = kohSearchActionForm.getWeaponList();

        for(int i = 0; i < allWeaponListSize; i++){
        	if(selectedWeapon != null){
        		if((kohSearchActionForm.getAllWeaponList().get(i).getWeaponList()).equals(selectedWeapon)){
        		count++;
        		}
        	}
        }

        if(count == 0){
        	kohSearchActionForm.setWeaponList(null);
        }

        count = 0;
        int allGroupListSize = kohSearchActionForm.getAllGroupList().size();
        String selectedGroup = kohSearchActionForm.getGroupList();

        for(int i = 0; i < allGroupListSize; i++){
        	if(selectedGroup != null){
        		if((kohSearchActionForm.getAllGroupList().get(i).getGroupList()).equals(selectedGroup)){
        		count++;
        		}
        	}
        }

        if(count == 0){
        	kohSearchActionForm.setGroupList(null);
        }

	}

    /**
     * 武士テーブルから武器リストを取得します(検索用)。
     * @throws SQLException
     */
    @SuppressWarnings("unchecked")
    public List<Koh> getKohWeaponList() throws SQLException {

    	return sqlMap.queryForList("findWeaponList");
    }

    /**
     * 武士テーブルから所属リストを取得します(検索用)。
     * @throws SQLException
     */
    @SuppressWarnings("unchecked")
    public List<Koh> getKohGroupList() throws SQLException {

    	return sqlMap.queryForList("findGroupList");
    }
    /**
     * 武士ユーザーテーブルから一覧取得
     * @author hara
     */
    @SuppressWarnings("unchecked")
    public List<LoginActionForm> getKohUserList() throws SQLException {

        return sqlMap.queryForList("findUserList");
    }


    /**
     * 武士テーブルにレコードを登録します。
     * @param form 武士帳登録アクションのフォーム
     * @throws SQLException
     * @author hara
     */
    public void addBushi(KohRegistActionForm kohRegistActionForm, String userId) throws SQLException {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("form", kohRegistActionForm);
        paramMap.put("instId",userId);

        log.debug("userId=" + userId);
        log.debug("form=" + kohRegistActionForm);

        sqlMap.insert("addKoh", paramMap);
    }
    /**
     * 重複checkです
     * @throws SQLException
     * @author hara
     */
    public Integer zeroOrIchi(KohRegistActionForm kohRegistActionForm) throws SQLException{
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("form", kohRegistActionForm);

		log.debug("form=" + kohRegistActionForm);

        return (Integer)sqlMap.queryForObject("addKohNullCheck", paramMap);
    }
    /**
     * 削除nullCheckです
     * @throws SQLException
     * @author hara
     */

    public Integer deleteNullCheck(KohDeleteActionForm kohDeleteActionForm) throws SQLException{
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("form", kohDeleteActionForm);

		log.debug("form=" + kohDeleteActionForm);

        return (Integer)sqlMap.queryForObject("addKohNullCheck", paramMap);
    }
    /**
     * 削除Checkです
     * @throws SQLException
     * @author hara
     */

    @SuppressWarnings("unchecked")
    public List<KohDeleteActionForm> deleteCheck(KohDeleteActionForm kohDeleteActionForm) throws SQLException{
        Map<String , Object> paramMap = new HashMap<String,Object>();
        paramMap.put("form", kohDeleteActionForm);

		log.debug("form=" + kohDeleteActionForm);

        return sqlMap.queryForList("kohDeleteCheck", paramMap);
    }

    /**
     * 削除です
     * @throws SQLException
     * @author hara
     */
    public void deleteBushi(String bushiId) throws SQLException {
        Map<String , Object> paramMap = new HashMap<String,Object>();
        paramMap.put("bushiId", bushiId);
        sqlMap.delete("kohDelete", paramMap);

		log.debug("bushiId=" + bushiId);
    }

}
