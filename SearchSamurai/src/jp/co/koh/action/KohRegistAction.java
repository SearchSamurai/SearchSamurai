package jp.co.koh.action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.koh.common.constants.JspConst;
import jp.co.koh.common.constants.SystemConst;
import jp.co.koh.form.KohRegistActionForm;
import jp.co.koh.form.LoginActionForm;
import jp.co.koh.ibatis.dao.KohDao;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * 武士帳登録Action。
 * @author hara
 *
 */
public final class KohRegistAction extends BaseAction {

    /** Dao */
    private KohDao kohDao = new KohDao(sqlMap);
	/** logger */
	private static final Logger log = Logger.getLogger(KohRegistAction.class);

    /**
     * 武士帳登録Actionメイン処理。
     */

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) {
        //セッションスコープから取得
        HttpSession session = req.getSession();
        KohRegistActionForm kohRegistActionForm  = (KohRegistActionForm)session.getAttribute("kohRegistActionForm");

        try {
            startTransaction();
            // セッションから現在ログインしているユーザIDを取得する
            String userId = ((LoginActionForm) req.getSession().getAttribute(SystemConst.SESSION_KEY.USER_INFO)).getUserId();

            // 武士テーブルに登録する
            kohDao.addBushi(kohRegistActionForm, userId);
            //メッセージをリクエストへ
            req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.INFO_KOHREGIST_COMPLETE));

            commit();
        } catch (SQLException e) {
            // TODO 自動生成された catch ブロック
			log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_DB_ACCESS));
			log.error(e);
        }
        //使わなくなったsessionを破棄
        session.removeAttribute("kohRegistActionForm");
        return mapping.findForward(JspConst.JSP_RESULT.SUCCESS);
    }
}
