package jp.co.koh.common;

import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import jp.co.koh.action.BaseAction;
import jp.co.koh.common.constants.SystemConst;
import jp.co.koh.form.LoginActionForm;
import jp.co.koh.ibatis.dao.KohDao;
import jp.co.koh.ibatis.dto.Koh;

import org.apache.log4j.Logger;

/**
 * InitializationListenerクラス。
 *
 * @author koh
 *
 */
public class InitializationListener extends BaseAction implements
		ServletContextListener {

	/** logger */
	private static final Logger log = Logger
			.getLogger(InitializationListener.class);
	/** Dao */
	private KohDao kohDao = new KohDao(sqlMap);

	/**
	 * Webアプリケーション終了時に実行します。
	 *
	 * @param ev
	 *            ServletContextEvent
	 */
	public void contextDestroyed(ServletContextEvent ev) {
		ServletContext sc = ev.getServletContext();
		log.info(sc.getServletContextName()
				+ "■■■■■■■■■■ 武士帳起動終了にて候 ■■■■■■■■■■");
		System.exit(1);
	}

	/**
	 * Webアプリケーション開始時に実行します。
	 *
	 * @param ev
	 *            ServletContextEvent
	 */
	@SuppressWarnings("rawtypes")
	public void contextInitialized(ServletContextEvent ev) {
		ServletContext sc = ev.getServletContext();
		log.info(sc.getServletContextName()
				+ "■■■■■■■■■■ 武士帳起動開始にて候 ■■■■■■■■■■");

		try {
			// トランザクション開始
			startTransaction();

			log.info("---------------- applicationリソースファイル読み込み ----------------");
			ResourceBundle applicationBundle = ResourceBundle
					.getBundle("application");
			Enumeration applicationEnum = applicationBundle.getKeys();
			Map<String, String> applicationMap = new HashMap<String, String>();
			while (applicationEnum.hasMoreElements()) {
				String key = (String) applicationEnum.nextElement();
				String value = applicationBundle.getString(key);
				applicationMap.put(key, value);
				log.info("applicationリソース=[key:" + key + ", value:" + value + "]");
			}

			// 検索用に武器と所属のリストを先に取得している(検索画面に遷移する前に取得しておく必要があるため)
			log.info("---------------- 武器検索用リスト取得 ----------------");
			List<Koh> allWeaponList = kohDao.getKohWeaponList();

			log.info("---------------- 所属検索用リスト取得 ----------------");
			List<Koh> allGroupList = kohDao.getKohGroupList();

			// 検索用に取得した武器と所属のリストは、DISTINCTで重複を除いた値を取得している。
			// しかしこれではリストボックスの初期値に常にnullを設定できない。
			// 検索者が必ず武器と所属を入力して検索したいとは限らないため、これでは好ましくない。
			// そのため、それぞれのインスタンスを一つ作り、空の状態であるそれをリストの0番目のインデックスにaddしている。
			// 本来は武器と所属それぞれのマスタテーブルを作成し、その外部キーを利用した紐付けを行うべきであり、
			// スマートな方法とは言えないが、ひとまずこのような方法をとった。
			Koh kohWeaponListEmpty = new Koh();
			Koh kohGroupListEmpty = new Koh();

			allWeaponList.add(0, kohWeaponListEmpty);
			allGroupList.add(0, kohGroupListEmpty);

			// 武器検索用リストの中身を設定しつつログ出力
			for (Koh koh : allWeaponList) {
				log.info(koh.toString());
			}
			// 所属検索用リストの中身を設定しつつログ出力
			for (Koh koh : allGroupList) {
				log.info(koh.toString());
			}

            List<LoginActionForm> kohUserList = kohDao.getKohUserList();

            LoginActionForm loginActionForm = new LoginActionForm();

            loginActionForm.setKohUserList(kohUserList);

            sc.setAttribute(SystemConst.SESSION_KEY.KOH_USER_LIST , loginActionForm);

			sc.setAttribute(SystemConst.APPLICATION_KEY.APPLICATION_MAP , applicationMap);
			sc.setAttribute(SystemConst.SESSION_KEY.KOH_WEAPON_LIST , allWeaponList);
			sc.setAttribute(SystemConst.SESSION_KEY.KOH_GROUP_LIST , allGroupList);

		} catch (SQLException e) {
			log.error(e);
			contextDestroyed(ev);
		} finally {
			try {
				// トランザクション終了
				endTransaction();
			} catch (Exception e) {
				log.error(e);
				contextDestroyed(ev);
			}
		}
	}

}
