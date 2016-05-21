package jp.co.koh.form;
import java.util.List;

import org.apache.struts.validator.ValidatorForm;

/**
 *武士帳削除ActionForm
 *@author hara
 */

public class KohDeleteActionForm extends ValidatorForm{

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
    /** 削除のリスト*/
    private List<KohDeleteActionForm> kohDeleteList;
    /**
     * @return bushiId
     */
    public String getBushiId() {
        return bushiId;
    }
    /**
     * @param bushiId セットする bushiId
     */
    public void setBushiId(String bushiId) {
        this.bushiId = bushiId;
    }
    /**
     * @return name
     */
    public String getName() {
        return name;
    }
    /**
     * @param name セットする name
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return age
     */
    public String getAge() {
        return age;
    }
    /**
     * @param age セットする age
     */
    public void setAge(String age) {
        this.age = age;
    }
    /**
     * @return bushiGroup
     */
    public String getBushiGroup() {
        return bushiGroup;
    }
    /**
     * @param bushiGroup セットする bushiGroup
     */
    public void setBushiGroup(String bushiGroup) {
        this.bushiGroup = bushiGroup;
    }
    /**
     * @return birthPlace
     */
    public String getBirthPlace() {
        return birthPlace;
    }
    /**
     * @param birthPlace セットする birthPlace
     */
    public void setBirthPlace(String birthPlace) {
        this.birthPlace = birthPlace;
    }
    /**
     * @return unitPrice
     */
    public String getUnitPrice() {
        return unitPrice;
    }
    /**
     * @param unitPrice セットする unitPrice
     */
    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }
    /**
     * @return weapon
     */
    public String getWeapon() {
        return weapon;
    }
    /**
     * @param weapon セットする weapon
     */
    public void setWeapon(String weapon) {
        this.weapon = weapon;
    }

    public List<KohDeleteActionForm> getKohDeleteList() {
        return kohDeleteList;
    }
    public void setKohDeleteList(List<KohDeleteActionForm> kohDeleteList) {
        this.kohDeleteList = kohDeleteList;
    }



}

