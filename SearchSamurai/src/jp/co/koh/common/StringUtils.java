package jp.co.koh.common;

import java.util.List;

/**
 * 共通のStringユーティリティークラス。
 * @author koh
 *
 */
public class StringUtils {

    /**
     * リストがNULLまたは空かの判定を行います。
     * @param list リスト
     * @return true, false
     */
    public static boolean isNullOrZero(List<?> list) {
        if (list == null || list.size() == 0) {
            return true;
        }
        return false;
    }

    /**
     * 文字列がNULLまたは空かの判定を行います。
     * @param str 文字列
     * @return true, false
     */
    public static boolean isNullOrEmpty(String str) {
        if (str == null || str == "") {
            return true;
        }
        return false;
    }

}
