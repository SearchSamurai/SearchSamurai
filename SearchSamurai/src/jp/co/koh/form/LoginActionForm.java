package jp.co.koh.form;
import java.util.List;

import org.apache.struts.action.ActionForm;

/**
 * 武士帳ログインActionForm
 * @author kurose
 */
public class LoginActionForm extends ActionForm {

    private static final long serialVersionUID = 1L;

    /** ユーザーID */
    private String userId;
    /** パスワード */
    private String userPassword;
    /** ユーザー一覧 */
    private List<LoginActionForm> kohUserList;

    /**
     * ユーザーIDを取得する
     * @return userId
     */
    public String getUserId() {
        return userId;
    }
    /**
     * ユーザーIDを設定する
     * @param userId セットする userId
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
    /**
     *  パスワードを取得する
     * @return userPassword
     */
    public String getUserPassword() {
        return userPassword;
    }
    /**
     * パスワードを設定する
     * @param userPassword セットする userPassword
     */
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    /**
     * @return kohUserList
     */
    public List<LoginActionForm> getKohUserList() {
        return kohUserList;
    }
    /**
     * @param kohUserList セットする kohUserList
     */
    public void setKohUserList(List<LoginActionForm> kohUserList) {
        this.kohUserList = kohUserList;
    }
}
