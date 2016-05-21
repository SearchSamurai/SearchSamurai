package jp.co.koh.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import jp.co.koh.common.constants.JspConst;
import jp.co.koh.common.constants.SystemConst;
import jp.co.koh.form.KohRegistActionForm;
import jp.co.koh.ibatis.dao.KohDao;

/**
 * 武士帳登録CheckAction。
 * @author hara
 *
 */

public class KohRegistCheckAction extends BaseAction{

    /** アクションフォーム */
    private KohRegistActionForm kohRegistActionForm = new KohRegistActionForm();
    /** Dao */
    private KohDao kohDao = new KohDao(sqlMap);

    /**
     * 武士帳登録確認。
     */

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) {
        //formを取得
        kohRegistActionForm = (KohRegistActionForm)form;
        HttpSession session = req.getSession();
        try {

            // ID重複check
            Integer result = kohDao.zeroOrIchi(kohRegistActionForm);

            if (result.intValue() == 0) {

                //IDが登録されてなかった場合
                req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.INFO_KOHREGIST_COMPLETE));

                //Formをリストへ
                List<KohRegistActionForm> kohRegistList = new ArrayList<KohRegistActionForm>();

                kohRegistList.add(kohRegistActionForm);

                //Beanへ
                kohRegistActionForm.setKohRegistCheckList(kohRegistList);

                //リクエストへ(jsp)
                req.setAttribute(SystemConst.SESSION_KEY.KOH_REGIST_ACTION_FORM, kohRegistActionForm);

                //登録時に使うようにセッションスコープへ
                session.setAttribute("kohRegistActionForm", kohRegistActionForm);

            } else {

                //IDが登録していた場合
                req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.INFO_KOHREGIST_DUPLICATE));
                return mapping.findForward(JspConst.JSP_RESULT.ERROR);
            }


        } catch (SQLException e) {
            // TODO 自動生成された catch ブロック
            e.printStackTrace();
        }

        return mapping.findForward(JspConst.JSP_RESULT.SUCCESS);
    }
}
