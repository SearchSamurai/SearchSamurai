package jp.co.koh.action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.koh.common.constants.JspConst;
import jp.co.koh.common.constants.SystemConst;
import jp.co.koh.form.UserRegistActionForm;
import jp.co.koh.ibatis.dao.UserDao;
import jp.co.koh.ibatis.dto.User;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *  新規武士登録Action
 * @author kurose
 *
 */
public class UserRegistAction extends BaseAction {

    /** logger */
    private static final Logger log = Logger.getLogger(UserRegistAction.class);
    /** アクションフォーム */
    private UserRegistActionForm UserRegistActionForm = new UserRegistActionForm();
    /** Dao */
    private UserDao userDao = new UserDao(sqlMap);

    /**
     * 新規武士登録Actionメイン処理。
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) {
        // Formを取得する
        UserRegistActionForm = (UserRegistActionForm)form;

        //2016 5/17 画面遷移修正,validation,登録時処理追加 hara
        try {
            // トランザクション開始
            startTransaction();
            // 武士ユーザーテーブルから入力されたIDがすでに登録されてないか確認
            User user = userDao.findUser(UserRegistActionForm.getUserId());
            // すでに登録されていたら
            if (user != null) {
                //メッセージをリクエストに
                req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.ERROR_USERREGIST_FAILD));
                // 自画面へ遷移する
                return mapping.findForward(JspConst.JSP_RESULT.INPUT);
            //登録されていなかったら
            } else {
                //IDとpassを登録
                userDao.addUser(UserRegistActionForm.getUserId(), UserRegistActionForm.getUserPassword());
            }


        } catch (SQLException se) {
			log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_DB_ACCESS));
			log.error(se);
        } finally {
            try {
                // トランザクション終了
                endTransaction();
				// セッション情報を出力
				outSessionInfo(req);
            } catch (SQLException se) {
				log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_SYSTEM));
				log.error(se);
                return (mapping.findForward(JspConst.JSP_RESULT.ERROR));
            }
        }

        //メッセージをリクエストに
        req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.INFO_KOHREGIST_COMPLETE));
        // 結果画面へ遷移する
        return (mapping.findForward(JspConst.JSP_RESULT.SUCCESS));
    }

}