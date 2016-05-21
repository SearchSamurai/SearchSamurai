package jp.co.koh.action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.koh.common.constants.JspConst;
import jp.co.koh.common.constants.SystemConst;
import jp.co.koh.form.LoginActionForm;
import jp.co.koh.ibatis.dao.UserDao;
import jp.co.koh.ibatis.dto.User;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 * 武士帳ログインAction
 *
 * @author kurose
 *
 */
public final class LoginAction extends BaseAction {

    /** アクションフォーム */
    private LoginActionForm loginActionForm = new LoginActionForm();
    /** Dao */
    private UserDao userDao = new UserDao(sqlMap);
	/** logger */
	private static final Logger log = Logger.getLogger(LoginAction.class);

    /**
     * ログインActionメイン処理
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest req, HttpServletResponse res) {
        // Formを取得する
        loginActionForm = (LoginActionForm) form;
        // String userId = loginActionForm.getUserId();
        // String userPassword = loginActionForm.getUserPassword();

        // 暫定的にID・パスワードがtestの場合でのログインが正常に行われるif文
        // どちらもtestだった場合正常処理を行い、そうでない場合はエラー処理を行う
        // if(!(userId.equals("test")&&userPassword.equals("test"))){
        // return(mapping.findForward("error"));
        // }else{
        // return mapping.findForward("success");

        try {
            // トランザクション開始
            startTransaction();
            // ユーザ管理テーブルから入力されたユーザIDをキーにレコードを取得する
            User user = userDao.findUser(loginActionForm.getUserId());
            // 1件取得できた場合
            if (user != null) {
                // 入力されたパスワードとDBから取得したパスワードが一致した場合
                if (user.getUserPassword().equals(loginActionForm.getUserPassword())) {
                    // セッションにユーザ情報をセットする
                    req.getSession().setAttribute(SystemConst.SESSION_KEY.USER_INFO, loginActionForm);
                    // セッションにログインフラグをセットする
                    req.getSession().setAttribute(SystemConst.SESSION_KEY.LOGIN_FLG, SystemConst.SESSION_VALUE.LOGIN_FLG_ON);
                    // ログインが成功し、メニュー画面に遷移する
                    return mapping.findForward(JspConst.JSP_RESULT.SUCCESS);
                // 入力されたパスワードのみがDBから取得したパスワードと一致しない場合
                } else {
                    req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.ERROR_LOGIN_FAILD_PASS));
                    return (mapping.findForward(JspConst.JSP_RESULT.INPUT));
                }
            }
            // 入力されたIDのみがDBから取得したIDと一致しない場合
            req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.ERROR_LOGIN_FAILD_ID));
            return (mapping.findForward(JspConst.JSP_RESULT.INPUT));

        } catch (SQLException se) {
			log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_DB_ACCESS));
			log.error(se);
        } finally {
            try {
                // トランザクション終了
                endTransaction();
            } catch (SQLException se) {
    			log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_SYSTEM));
    			log.error(se);
                return (mapping.findForward(JspConst.JSP_RESULT.ERROR));
            }
        }
        return (mapping.findForward(JspConst.JSP_RESULT.ERROR));
    }

}