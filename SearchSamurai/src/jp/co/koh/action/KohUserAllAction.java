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
 * 武士userpass変更Action。
 * @author hara
 *
 */
public final class KohUserAllAction extends BaseAction {

    /** logger */
    private static final Logger log = Logger.getLogger(KohUserAllAction.class);
    /** Actionクラス */
    private  LoginActionForm loginActionForm = new LoginActionForm();
    /** Daoクラス */
    private UserDao userDao = new UserDao(sqlMap);
    /**
     * 武士帳登録Actionメイン処理。
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) {

        //画面に最初から値を出力するテストの為だけに作ったので特に処理なし
        //pass更新を作ってみる
        loginActionForm = (LoginActionForm)form;

        try {
            startTransaction();
            //入力したIDがあるかないか判定
            User seachResult = userDao.findUser(loginActionForm.getUserId());

                //取得できれば
                if(seachResult != null){
                    //更新
                    userDao.upDatePass(loginActionForm.getUserId(),loginActionForm.getUserPassword());

                    //メッセージをリクエストへ
                    req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.INFO_KOHREGIST_COMPLETE));

                    commit();
                //取得できなければ
                } else {
                    //IDが登録していない場合
                    req.setAttribute(SystemConst.REQUEST_KEY.MESSAGE_INFO, getMessage(JspConst.DISP_MSG_KEY.INFO_KOHUPDID_FAILD));
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
        } finally {
            try {
                endTransaction();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return mapping.findForward(JspConst.JSP_RESULT.SUCCESS);
    }
}
