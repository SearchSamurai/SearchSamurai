package jp.co.koh.ibatis.dto;

/**
 * ユーザー管理テーブルDTO
 * @author kurose
 *
 */
public class User {

    /** ユーザーID */
    private String userId;

    /** パスワード */
    private String userPassword;

    /**
     * @return userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId セットする userId
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * @return userPassword
     */
    public String getUserPassword() {
        return userPassword;
    }

    /**
     * @param userPassword セットする userPassword
     */
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }


}
