package jp.co.koh.form;
import org.apache.struts.validator.ValidatorForm;

/**
 * 新規武士登録ActionForm。
 * @author kurose
 *
 */
public class UserRegistActionForm extends ValidatorForm {

        private static final long serialVersionUID = 1L;

        /** ユーザID */
        private String userId;
        /** パスワード */
        private String userPassword;

        /**
         * ユーザIDを取得する
         * @return userId
         */
        public String getUserId() {
            return userId;
        }

        /**
         * ユーザIDを設定する
         * @param userId ユーザID
         */
        public void setUserId(String userId) {
            this.userId = userId;
        }

        /**
         * パスワードを取得する
         * @return userPassword
         */
        public String getUserPassword() {
            return userPassword;
        }

        /**
         * パスワードを設定する
         * @param userPassword パスワード
         */
        public void setUserPassword(String userPassword) {
            this.userPassword = userPassword;
        }

}
