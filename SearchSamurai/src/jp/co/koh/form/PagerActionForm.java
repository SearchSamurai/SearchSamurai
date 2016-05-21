package jp.co.koh.form;
import org.apache.struts.action.ActionForm;

/**
 * ページャー用のActionForm。
 * @author d-iimura
 *
 */
public class PagerActionForm extends ActionForm {

	private static final long serialVersionUID = 1L;

	/** ページ番号 */
	private int pages;

	/** 総ページ数 */
	private int[] allpages;

	/**
	 * ページ番号を取得します。
	 * @return pages
	 */
	public int getPages() {
		return pages;
	}

	/**
	 * ページ番号を設定します。
	 * @param pages ページ番号
	 */
	public void setPages(int pages) {
		this.pages = pages;
	}

	/**
	 * 総ページ数を取得します。
	 * @return allpages
	 */
	public int[] getAllpages() {
		return allpages;
	}

	/**
	 * 総ページ数を設定します。
	 * @param allpages 総ページ数
	 */
	public void setAllpages(int[] allpages) {
		this.allpages = allpages;
	}

}