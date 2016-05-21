package jp.co.koh.common.constants;

public class JspConst {

    /** JSPのRESULTマッピングの定義 */
    public static class JSP_RESULT {
        /** success */
        public static final String SUCCESS = "success";
        /** input */
        public static final String INPUT = "input";
        /** error */
        public static final String ERROR = "error";
    }

    /** JSPの共通定義 */
    public static class JSP_COMMON {
        /** ヘッダー */
        public static final String HEADER = "./parts/header.jsp";
        /** ログイン */
        public static final String LOGIN = "./login.jsp";
        /** フッター */
        public static final String FOOTER = "./parts/footer.jsp";
    }

    /** JSPのFOWARD先のパス定義 */
    public static class JSP_FOWARD {
        /** ログイン画面 */
        public static final String LOGIN = "/koh/pages/login.jsp";
        /** TOP画面 */
        public static final String TOP = "/koh/pages/top.jsp";
        /** 新規ユーザ登録画面 */
        public static final String USER_REGIST = "/koh/pages/userRegist.jsp";
    }

    /** 画面表示メッセージキー定義 */
    public static class DISP_MSG_KEY{
        /** ログイン失敗(ユーザーIDかパスワードの誤り) */
        public static final String ERROR_LOGIN_FAILD = "msg.error.login.faild";
        /** ログイン失敗(ユーザーID誤り) */
        public static final String ERROR_LOGIN_FAILD_ID = "msg.error.login.id";
        /** ログイン失敗(パスワードの誤り) */
        public static final String ERROR_LOGIN_FAILD_PASS = "msg.error.login.pass";
        /** 新規ユーザ登録失敗(既に同一ユーザIDのユーザが存在する) */
        public static final String ERROR_USERREGIST_FAILD = "msg.error.userRegist.faild";
        /** 新規ユーザ登録完了 */
        public static final String INFO_USERREGIST_COMPLETE = "msg.info.userRegist.complete";
        /** 武士帳登録完了 */
        public static final String INFO_KOHREGIST_COMPLETE = "msg.info.kohRegist.complete";
        /** 武士帳ID重複の場合 */
        public static final String INFO_KOHREGIST_DUPLICATE = "msg.info.kohRegist.duplicate";
        /** 武士帳ID重複の場合 */
        public static final String INFO_KOHDELETE_DUPLICATE = "msg.info.kohDelete.duplicate";
        /** 武士帳削除完了 */
        public static final String INFO_KOHDELETE_COMPLETE = "msg.info.kohDelete.complete";
        /** 武士帳更新完了 */
        public static final String INFO_KOHUPD_COMPLETE = "msg.info.kohUpd.complete";
        /** 武士帳更新時IDがいなかった場合 */
        public static final String INFO_KOHUPDID_FAILD = "msg.info.kohUpdId.faild";
    }
}
