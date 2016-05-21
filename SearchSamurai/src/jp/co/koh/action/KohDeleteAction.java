package jp.co.koh.action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.koh.common.constants.JspConst;
import jp.co.koh.common.constants.SystemConst;
import jp.co.koh.form.KohDeleteActionForm;
import jp.co.koh.ibatis.dao.KohDao;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * 武士帳削除Action。
 * @author hara
 *
 */
public final class KohDeleteAction extends BaseAction {

    /** Dao */
    private KohDao kohDao = new KohDao(sqlMap);
    /** logger */
    private static final Logger log = Logger.getLogger(KohDeleteAction.class);


    /**
     * 武士帳削除Actionメイン処理。
     */

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) {
        //セッションスコープから取得
        HttpSession session = req.getSession();
        KohDeleteActionForm kohDeleteActionForm  = (KohDeleteActionForm)session.getAttribute("kohDeleteActionForm");

        try {
            //トランザクション開始
            startTransaction();
            // 武士テーブル削除する
            kohDao.deleteBushi(kohDeleteActionForm.getBushiId());
            //メッセージをリクエストへ
            req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.INFO_KOHDELETE_COMPLETE));
            //コミット
            commit();
        } catch (SQLException se) {
            log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_DB_ACCESS));
            log.error(se);
            return (mapping.findForward(JspConst.JSP_RESULT.ERROR));
        } catch(Exception e){
            log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_SYSTEM));
            log.error(e);
            return (mapping.findForward(JspConst.JSP_RESULT.ERROR));
        } finally {
            try{
                // トランザクション終了
                endTransaction();
            } catch (SQLException se) {
                log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_SYSTEM));
                log.error(se);
                return (mapping.findForward(JspConst.JSP_RESULT.ERROR));
            }
        }
        //使わなくなったsessionを破棄
        session.removeAttribute("kohDeleteActionForm");
        return mapping.findForward(JspConst.JSP_RESULT.SUCCESS);
    }
}
