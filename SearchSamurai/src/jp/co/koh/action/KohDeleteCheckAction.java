package jp.co.koh.action;

import java.sql.SQLException;
import java.util.List;

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
 * 武士帳削除CheckAction。
 * @author hara
 *
 */

public class KohDeleteCheckAction extends BaseAction{

    /** logger */
    private static final Logger log = Logger.getLogger(KohDeleteCheckAction.class);
    /** アクションフォーム */
    private KohDeleteActionForm kohDeleteActionForm = new KohDeleteActionForm();
    /** Dao */
    private KohDao kohDao = new KohDao(sqlMap);

    /**
     * 武士帳削除確認。
     */

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) {
        //formを取得
        kohDeleteActionForm = (KohDeleteActionForm)form;
        HttpSession session = req.getSession();
        try {
            // ID登録check
            Integer result = kohDao.deleteNullCheck(kohDeleteActionForm);
            if (!(result.intValue() == 0)) {

                //削除用検索
                List<KohDeleteActionForm> KohList = kohDao.deleteCheck(kohDeleteActionForm);

                //Beanへ
                kohDeleteActionForm.setKohDeleteList(KohList);

                //リクエストへ(jsp)
                req.setAttribute(SystemConst.SESSION_KEY.KOH_DELETE_ACTION_FORM, kohDeleteActionForm);

                //削除時に使うようにセッションスコープへ
                session.setAttribute("kohDeleteActionForm", kohDeleteActionForm);

              } else {

                //IDが登録されてない場合
                req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.INFO_KOHDELETE_DUPLICATE));
                return mapping.findForward(JspConst.JSP_RESULT.ERROR);
            }

        } catch (SQLException se) {
            log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_DB_ACCESS));
            log.error(se);
            return (mapping.findForward(JspConst.JSP_RESULT.ERROR));
        } catch (Exception e){
            log.error(getMessage(SystemConst.LOG_MSG_KEY.ERROR_SYSTEM));
            log.error(e);
            return (mapping.findForward(JspConst.JSP_RESULT.ERROR));
        }

        return mapping.findForward(JspConst.JSP_RESULT.SUCCESS);
    }
}
