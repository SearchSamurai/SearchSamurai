package jp.co.koh.common;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;

/**
 * SessionListenerクラス。
 * @author koh
 *
 */
public class SessionListener implements HttpSessionListener {

	/** logger */
	private static final Logger log = Logger.getLogger(SessionListener.class);

    /**
     * セッション生成時に実行します。
     * @param ev HttpSessionEvent
     */
	public void sessionCreated(HttpSessionEvent ev) {
		HttpSession session = ev.getSession();
		log.debug("セッション生成 セッションID：" + session.getId());
	}

    /**
     * セッション破棄時に実行します。
     * @param ev HttpSessionEvent
     */
	public void sessionDestroyed(HttpSessionEvent ev) {
		HttpSession session = ev.getSession();
		log.debug("セッション破棄 セッションID：" + session.getId());
	}

}