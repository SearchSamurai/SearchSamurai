package jp.co.koh.action;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.koh.common.constants.JspConst;
import jp.co.koh.common.constants.SystemConst;
import jp.co.koh.form.KohSearchActionForm;
import jp.co.koh.ibatis.dao.KohDao;
import jp.co.koh.ibatis.dto.Koh;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * 武士帳検索アクションクラス。
 *
 * @author okazaki
 *
 */
public final class KohSearchAction extends BaseAction {
	/** アクションフォーム */
	private KohSearchActionForm kohSearchActionForm = new KohSearchActionForm();
	/** ロガー */
	private static final Logger log = Logger.getLogger(KohSearchActionForm.class);
	/** Daoクラス */
	private KohDao kohDao = new KohDao(sqlMap);
	/**
	 * 武士帳検索アクションクラスのメイン処理。
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) {

		try {

			//form(検索画面で入力した値)を取得する
			kohSearchActionForm = (KohSearchActionForm) form;

			//選択された武器の一時退避用変数
			String tmpSelectedWeapon = kohSearchActionForm.getWeaponList();

			//選択された所属の一時退避用変数
			String tmpSelectedGroup = kohSearchActionForm.getGroupList();

			//武器リストボックスの取得(BUSHIテーブルから武器の重複を除いたリストを取得)
			List<Koh> allWeaponList = kohDao.getKohWeaponList();

			//所属リストボックスの取得(BUSHIテーブルから所属の重複を除いたリストを取得)
			List<Koh> allGroupList = kohDao.getKohGroupList();

			//武器リストボックスをセット
			kohSearchActionForm.setAllWeaponList(allWeaponList);
			//所属リストボックスをセット
			kohSearchActionForm.setAllGroupList(allGroupList);

			//予期せぬ空文字・0・文字化けを判定してnullに置換する
			kohDao.illegalValueConvert(kohSearchActionForm);

			//セッションの取得
	        HttpSession session = req.getSession();

			//検索条件に武器と所属をわざと入力しなかった場合は、セッションに退避している武器と所属をセットし直す必要はない。
			//そのため、アクションフォームから渡ってきた武器と所属が空かnullだった場合は、その値をそのまま使いたいので、
			//条件分岐で回避している。
			if( ("" != tmpSelectedWeapon) && (null != tmpSelectedWeapon) && (null == kohSearchActionForm.getWeaponList()) ){
				kohSearchActionForm.setWeaponList(String.valueOf((session.getAttribute(SystemConst.SESSION_KEY.BEFORE_SEARCH_WEAPON))));
			}

			if( ("" != tmpSelectedGroup) && (null != tmpSelectedGroup) && (null == kohSearchActionForm.getGroupList()) ){
				kohSearchActionForm.setGroupList(String.valueOf((session.getAttribute(SystemConst.SESSION_KEY.BEFORE_SEARCH_GROUP))));
			}

			//現在のページのインデックス番号(画面上の表示-1)を取得している
			int page = kohSearchActionForm.getPages();

			//1ページごとの表示件数をセット
			kohSearchActionForm.setLimit(SystemConst.KOH_SEARCH_PAGE_MAX_CNT);

			//pageが1(表示上のページ2)以降なら、表示件数×ページ数番目を表示開始位置(OFFSET)としてセットする
			if (page >= 1) {
				kohSearchActionForm.setOffset(Integer.valueOf((page * kohSearchActionForm.getLimit().intValue())));
			} else {
				//そうでない場合(pageが0 つまり1ページ目)なら表示開始位置は0になるので0をセットする
				kohSearchActionForm.setOffset(Integer.valueOf(0));
			}

			//ソートフラグが0なら武士IDの昇順で結果を取得する
			if(0 == kohSearchActionForm.getSortFlag().intValue()){

				//アクションフォームにセットされた値を元にDBからレコードを取得する
				List<Koh> kohSearchList = kohDao.findKoh(kohSearchActionForm);

				//検索結果リストをセットする
				kohSearchActionForm.setKohSearchList(kohSearchList);

			//ソートフラグが1なら登録日時の降順で結果を取得する。
			} else if(1 == kohSearchActionForm.getSortFlag().intValue()){

				//アクションフォームにセットされた値を元にDBからレコードを取得する
				List<Koh> kohSearchList = kohDao.findKohSortByInsertDate(kohSearchActionForm);

				//検索結果リストをセットする
				kohSearchActionForm.setKohSearchList(kohSearchList);

			}

			req.setAttribute(SystemConst.SESSION_KEY.KOH_SEARCH_ACTION_FORM , kohSearchActionForm);

			//検索結果件数を取得する。件数が0な場合、「検索条件に該当するデータはありませんでした。」と表示される。
			String searchCnt = kohDao.getCountSearchList(kohSearchActionForm);
			req.setAttribute(SystemConst.REQUEST_KEY.SEARCH_CNT, searchCnt);

			//全体のページ数を計算している
			countPages(Integer.parseInt(searchCnt));

			//ページ番号リンクに付与する検索条件をフォームにセットする
			Map<String, Object> kohSearchListMap = new HashMap<String, Object>();
			kohSearchListMap.put("ageFrom", kohSearchActionForm.getAgeFrom());
			kohSearchListMap.put("ageTo", kohSearchActionForm.getAgeTo());
			kohSearchListMap.put("groupList" , kohSearchActionForm.getGroupList());
			kohSearchListMap.put("unitPriceFrom" , kohSearchActionForm.getUnitPriceFrom());
			kohSearchListMap.put("unitPriceTo" , kohSearchActionForm.getUnitPriceTo());
			kohSearchListMap.put("weaponList", kohSearchActionForm.getWeaponList());
			kohSearchListMap.put("offset", kohSearchActionForm.getOffset());
			kohSearchListMap.put("sortFlag", kohSearchActionForm.getSortFlag());
			kohSearchActionForm.setKohSearchListMap(kohSearchListMap);

			//文字化け対策用にアクションフォームから入力された武器と所属をセッションに退避している
			//詳細はKohDaoクラスのillegalValueConvertメソッドのコメントを参照
			session.setAttribute(SystemConst.SESSION_KEY.BEFORE_SEARCH_GROUP, kohSearchListMap.get("groupList"));
			session.setAttribute(SystemConst.SESSION_KEY.BEFORE_SEARCH_WEAPON, kohSearchListMap.get("weaponList"));

		} catch (SQLException e) {
			log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_DB_ACCESS));
			log.error(e);
		} finally {
			try {
				endTransaction();
			} catch (SQLException e) {
				log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_SYSTEM));
				log.error(e);
			}
		}
		return mapping.findForward(JspConst.JSP_RESULT.SUCCESS);

	}

	/**
	 * ページャーを作成します。
	 * @param searchCnt 検索結果件数
	 */
	private void countPages(int searchCnt) {

		// 1ページの最大表示件数
		int countlimit = kohSearchActionForm.getLimit().intValue();

		// 表示するページ数を計算。
		int pages = searchCnt / countlimit;
		if (searchCnt % countlimit != 0) {
			pages = pages + 1;
		}

		// 1から最終ページまでの数字を格納するための配列
		int[] allpages = new int[pages];
		for (int i = 0; i < pages; i++) {
			allpages[i] = i + 1;
		}

		kohSearchActionForm.setAllpages(allpages);

	}
}
