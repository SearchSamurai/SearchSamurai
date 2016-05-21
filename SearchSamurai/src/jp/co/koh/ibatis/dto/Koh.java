package jp.co.koh.ibatis.dto;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 武士テーブルDTO。
 * @author koh
 *
 */
public class Koh {

	private String bushiId;
	private String name;
	private Integer age;
	private String bushiGroup;
	private String birthPlace;
	private Integer unitPrice;
	private String weapon;
	private String instId;
	private String updateDate;
	private String updateId;
	private String weaponList;
	private String groupList;
	private Date instDate;
	/** 日付フォーマット */
	private final String DATE_PATTERN ="yyyy年MM月dd日 - HH時:mm分:ss秒";

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
	public Integer getAge() {
		return age;
	}
	/**
	 * @param age セットする age
	 */
	public void setAge(Integer age) {
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
	 * @return updateId
	 */
	public String getUpdateId() {
		return updateId;
	}
	/**
	 * @param updateId セットする updateId
	 */
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	/**
	 * @return weaponList
	 */
	public String getWeaponList() {
		return weaponList;
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

}