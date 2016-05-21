package jp.co.koh.form;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jp.co.koh.ibatis.dto.Koh;

/**
 * 武士帳検索アクションフォーム
 * @author okazaki
 *
 */
public final class KohSearchActionForm extends PagerActionForm{

	private static final long serialVersionUID = 1L;

	/** 武士ID */
	private String bushiId;

	/** 武士名 */
	private String name;

	/** 年齢 */
	private Integer age;

	/** 年齢From */
	private Integer ageFrom;

	/** 年齢To */
	private Integer ageTo;

	/** 所属 */
	private String bushiGroup;

	/** 出身 */
	private String birthPlace;

	/** 単価 */
	private Integer unitPrice;

	/** 単価From */
	private Integer unitPriceFrom;

	/** 単価To */
	private Integer unitPriceTo;

	/** 武器 */
	private String weapon;

	/** 登録ID */
	private String instId;

	/** 登録日 */
	private Date instDate;

	/** 更新日 */
	private String updateDate;

	/** 検索条件格納用リスト */
	private List<Koh> kohSearchList;

	/** 武器リストボックス表示用 */
	private String weaponList;

	/** 所属リストボックス表示用 */
	private String groupList;

	/** 1ページごとの表示件数 */
	private Integer limit;

	/** 1ページごとの検索結果表示開始位置 */
	private Integer offset;

	/** 検索条件保持用マップ */
	private Map<String, Object> kohSearchListMap = new HashMap<String, Object>();

	/** 武器リストボックス表示用リテラル格納用  */
	private List<Koh> allWeaponList;

	/** 所属リストボックス表示用リテラル格納用  */
	private List<Koh> allGroupList;

	/** 更新日が新しい順ソート用フラグ  */
	private Integer sortFlag;

	/** 日付フォーマット */
	private final String DATE_PATTERN ="yyyy年MM月dd日 - HH時:mm分:ss秒";

	/**
	 * bushiIdを取得します。
	 * @return bushiId
	 */
	public String getBushiId() {
		return bushiId;
	}

	/**
	 * 武士IDを設定します。
	 * @param bushiId
	 */
	public void setBushiId(String bushiId) {
		this.bushiId = bushiId;
	}
	/**
	 * 武士名を取得します。
	 * @return name
	 */
	public String getName() {
		return name;
	}
	/**
	 * 武士名を設定します。
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 年齢を取得します。
	 * @return age
	 */
	public Integer getAge() {
		return age;
	}
	/**
	 * 年齢を設定します。
	 * @param age
	 */
	public void setAge(Integer age) {
		this.age = age;
	}
	/**
	 * 年齢Fromを取得します。
	 * @return ageFrom
	 */
	public Integer getAgeFrom() {
		return ageFrom;
	}
	/**
	 * 年齢Fromを設定します。
	 * @param ageFrom
	 */
	public void setAgeFrom(Integer ageFrom) {
		this.ageFrom = ageFrom;
	}
	/**
	 * @return ageTo
	 */
	public Integer getAgeTo() {
		return ageTo;
	}
	/**
	 * @param ageTo セットする ageTo
	 */
	public void setAgeTo(Integer ageTo) {
		this.ageTo = ageTo;
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
	public Integer getUnitPrice() {
		return unitPrice;
	}
	/**
	 * @param unitPrice セットする unitPrice
	 */
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	/**
	 * @return unitPriceFrom
	 */
	public Integer getUnitPriceFrom() {
		return unitPriceFrom;
	}
	/**
	 * @param unitPriceFrom セットする unitPriceFrom
	 */
	public void setUnitPriceFrom(Integer unitPriceFrom) {
		this.unitPriceFrom = unitPriceFrom;
	}
	/**
	 * @return unitPriceTo
	 */
	public Integer getUnitPriceTo() {
		return unitPriceTo;
	}
	/**
	 * @param unitPriceTo セットする unitPriceTo
	 */
	public void setUnitPriceTo(Integer unitPriceTo) {
		this.unitPriceTo = unitPriceTo;
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
	/**
	 * @return instDate
	 */
	public String getInstDate() {
		return (new SimpleDateFormat(DATE_PATTERN)).format(instDate);
	}
	/**
	 * @param instDate セットする instDate
	 */
	public void setInstDate(Date instDate) {
		this.instDate = instDate;
	}
	/**
	 * @return instId
	 */
	public String getInstId() {
		return instId;
	}
	/**
	 * @param instId セットする instId
	 */
	public void setInstId(String instId) {
		this.instId = instId;
	}
	/**
	 * @return updateDate
	 */
	public String getUpdateDate() {
		return updateDate;
	}
	/**
	 * @param updateDate セットする updateDate
	 */
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	/**
	 * @return kohSearchList
	 */
	public List<Koh> getKohSearchList() {
		return kohSearchList;
	}
	/**
	 * @param kohSearchList セットする kohSearchList
	 */
	public void setKohSearchList(List<Koh> kohSearchList) {
		this.kohSearchList = kohSearchList;
	}
	/**
	 * @return weaponList
	 */
	public String getWeaponList() {

		return this.weaponList;
	}
	/**
	 * @param weaponList セットする weaponList
	 */
	public void setWeaponList(String weaponList) {
		this.weaponList = weaponList;
	}
	/**
	 * @return groupList
	 */
	public String getGroupList() {
		return groupList;
	}
	/**
	 * @param groupList セットする groupList
	 */
	public void setGroupList(String groupList) {
		this.groupList = groupList;
	}

	/**
	 * @return kohSearchListMap
	 */
	public Map<String, Object> getKohSearchListMap() {
		return kohSearchListMap;
	}

	/**
	 * @param kohSearchListMap セットする kohSearchListMap
	 */
	public void setKohSearchListMap(Map<String, Object> kohSearchListMap) {
		this.kohSearchListMap = kohSearchListMap;
	}

	/**
	 * @return limit
	 */
	public Integer getLimit() {
		return limit;
	}

	/**
	 * @param limit セットする limit
	 */
	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	/**
	 * @return offset
	 */
	public Integer getOffset() {
		return offset;
	}

	/**
	 * @param offset セットする offset
	 */
	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	/**
	 * @return allWeaponList
	 */
	public List<Koh> getAllWeaponList() {
		return allWeaponList;
	}

	/**
	 * @param allWeaponList セットする allWeaponList
	 */
	public void setAllWeaponList(List<Koh> allWeaponList) {
		this.allWeaponList = allWeaponList;
	}

	/**
	 * @return allGroupList
	 */
	public List<Koh> getAllGroupList() {
		return allGroupList;
	}

	/**
	 * @param allGroupList セットする allGroupList
	 */
	public void setAllGroupList(List<Koh> allGroupList) {
		this.allGroupList = allGroupList;
	}

	/**
	 * @return sortFlag
	 */
	public Integer getSortFlag() {
		return sortFlag;
	}

	/**
	 * @param sortFlag セットする sortFlag
	 */
	public void setSortFlag(Integer sortFlag) {
		this.sortFlag = sortFlag;
	}

}