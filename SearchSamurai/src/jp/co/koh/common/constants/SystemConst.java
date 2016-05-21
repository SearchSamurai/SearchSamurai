package jp.co.koh.common.constants;

/**
 * システム用の定数定義クラス
 * @author kurose
 *
 */
public class SystemConst {

	/** 武士帳検索 1ページの最大表示件数 */
	public static final Integer KOH_SEARCH_PAGE_MAX_CNT = Integer.valueOf(10);

    /** セッションキー定義 */
    public static class SESSION_KEY {
        /** ユーザ情報 */
        public static final String USER_INFO = "userInfo";
        /** ログインフラグ */
        public static final String LOGIN_FLG = "loginFlg";
        /** 武器検索条件文字化け回避兼保持用 */
        public static final String BEFORE_SEARCH_WEAPON = "beforeSearchWeapon";
        /** 所属検索条件文字化け回避兼保持用 */
        public static final String BEFORE_SEARCH_GROUP = "beforeSearchGroup";
        /** 検索条件保持用 */
        public static final String BEFORE_SEARCH_MAP = "beforeSearchMap";
        /** ログインフラグ */
        public static final String KOH_SEARCH_ACTION_FORM = "KohSearchActionForm";
        /**登録Check用*/
        public static final String KOH_REGIST_ACTION_FORM = "KohRegistActionForm";
        /**削除Check用*/
        public static final String KOH_DELETE_ACTION_FORM = "KohDeleteActionForm";
        /**登録用リスト*/
        public static final String KOH_REGIST_LIST = "kohRegistList";
        /**武器検索用リスト*/
        public static final String KOH_WEAPON_LIST = "weaponList";
        /**所属検索用リスト*/
        public static final String KOH_GROUP_LIST = "groupList";
        /**ユーザー一覧取得*/
        public static final String KOH_USER_LIST = "LoginActionForm";
    }

    /** セッションキーバリュー定義 */
    public static class SESSION_VALUE {
        /** ログインフラグ：ログイン済み */
        public static final String LOGIN_FLG_ON = "1";
    }

    /** ファイルパス定義 */
    public static class FILE_CONFIG {
        /** application.propertiesファイル名 */
        public static final String APPLICATION_PROPERTIES_FILE = "../resources/application.properties";
    }

    /** アプリケーションキー定義 */
    public static class APPLICATION_KEY {
        /** applicationリソースファイル */
        public static final String APPLICATION_MAP = "applicationMap";
    }

    /** ログメッセージキー定義 */
    public static class LOG_MSG_KEY {
        /** 共通メッセージ */
        public static final String ERROR_DB_ACCESS = "msg.error.db.access";
        public static final String ERROR_SYSTEM = "msg.error.system";
        public static final String ERROR_CHARACTER_ENCODE = "msg.error.character.encode";
    }

    /** リクエストキー定義 */
    public static class REQUEST_KEY {
        /** メッセージ */
        public static final String MESSAGE_INFO = "messageInfo";
		/** レコード件数 */
		public static final String SEARCH_CNT= "searchCnt";
    }
}
