package jp.co.koh.form;
import java.util.List;

import org.apache.struts.validator.ValidatorForm;

/**
 *武士帳登録ActionForm
 *@author hara
 */

public class KohRegistActionForm extends ValidatorForm{

    private static final long serialVersionUID = 1L;

    /** ID */
    private String bushiId;
    /** 名前 */
    private String name;
    /** 年齢 */
    private String age;
    /** 所属隊 */
    private String bushiGroup;
    /** 出身地 */
    private String birthPlace;
    /** 単価 */
    private String unitPrice;
    /** 得意武器 */
    private String weapon;
    /** 登録者*/
    private String instId;
    /** 登録のリスト*/
    private List<KohRegistActionForm> kohRegistCheckList;

    /**
     * IDを取得する
     * @return bushiId
     */
    public String getBushiId() {
        return bushiId;
    }
    /**
     * IDを設定する
     * @param bushiId セットする bushiId
     */
    public void setBushiId(String bushiId) {
        this.bushiId = bushiId;
    }
    /**
     * 名前を取得する
     * @return name
     */
    public String getName() {
        return name;
    }
    /**
     * 名前を設定する
     * @param name セットする name
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * 年齢を取得する
     * @return age
     */
    public String getAge() {
        return age;
    }
    /**
     * 年齢を設定する
     * @param age セットする age
     */
    public void setAge(String age) {
        this.age = age;
    }
    /**
     * 所属隊を取得する
     * @return bushiGroup
     */
    public String getBushiGroup() {
        return bushiGroup;
    }
    /**
     * 所属隊を設定する
     * @param bushiGroup セットする bushiGroup
     */
    public void setBushiGroup(String bushiGroup) {
        this.bushiGroup = bushiGroup;
    }
    /**
     * 出身地を取得する
     * @return birthPlace
     */
    public String getBirthPlace() {
        return birthPlace;
    }
    /**
     * 出身地を設定する
     * @param birthPlace セットする birthPlace
     */
    public void setBirthPlace(String birthPlace) {
        this.birthPlace = birthPlace;
    }
    /**
     * 単価取得する
     * @return unitPrice
     */
    public String getUnitPrice() {
        return unitPrice;
    }
    /**
     * 単価を設定する
     * @param unitPrice セットする unitPrice
     */
    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }
    /**
     * 得意武器を取得する
     * @return weapon
     */
    public String getWeapon() {
        return weapon;
    }
    /**
     * 得意武器を設定する
     * @param weapon セットする weapon
     */
    public void setWeapon(String weapon) {
        this.weapon = weapon;
    }
    /**
     * 登録者取得する
     * @return instId
     */
    public String getInstId() {
        return instId;
    }
    /**
     * 登録者設定する
     * @param instId セットする instId
     */
    public void setInstId(String instId) {
        this.instId = instId;
    }


    public List<KohRegistActionForm> getKohRegistCheckList() {
        return kohRegistCheckList;
    }
    public void setKohRegistCheckList(List<KohRegistActionForm> kohRegistCheckList) {
        this.kohRegistCheckList = kohRegistCheckList;
    }

}

