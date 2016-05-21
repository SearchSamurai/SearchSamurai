package jp.co.koh.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.koh.common.constants.JspConst;
import jp.co.koh.common.constants.SystemConst;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public final class LogoutAction extends BaseAction {

    /** logger */
    private static final Logger log = Logger.getLogger(LogoutAction.class);


    /**
     * ログアウトActionメイン処理。
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) {
        try {
            // セッションから全ての情報を削除する
            req.getSession().invalidate();
            // セッション情報を出力
            outSessionInfo(req);
        } catch (Exception e) {
            log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_SYSTEM));
            log.error(e);
            return (mapping.findForward(JspConst.JSP_RESULT.ERROR));
        }
        return (mapping.findForward(JspConst.JSP_RESULT.SUCCESS));
    }
}
