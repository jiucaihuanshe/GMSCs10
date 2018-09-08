package com.gms.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class ContextUtil {
	public final static String STAFFID = "staff_id";
	public final static String STAFFNAME = "staff_name";

	public static HttpServletRequest getRequest() {
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes();
		return requestAttributes == null ? null : requestAttributes.getRequest();
	}

	public static HttpSession getSession() {
		return getRequest() == null ? null : getRequest().getSession();
	}

	public static String getRealPath() {
		return getRequest() == null ? null : getRequest().getServletContext().getRealPath("/");
	}

	public static String getContextPath() {
		return getRequest() == null ? null : getRequest().getContextPath();
	}

	public static void setSessionAttribute(String name, Object value) {
		HttpServletRequest request = getRequest();
		if (request != null) {
			request.getSession().setAttribute(name, value);
		}
	}

	public static Object getSessionAttribute(String name) {
		HttpServletRequest request = getRequest();
		return request == null ? null : request.getSession().getAttribute(name);
	}

	public static Object getRequestAttribute(String name) {
		HttpServletRequest request = getRequest();
		return request != null ? request.getAttribute(name) : null;
	}

	public static void setRequestAttribute(String name, Object value) {
		HttpServletRequest request = getRequest();
		if (request != null) {
			request.setAttribute(name, value);
		}
	}

	public static ContextUtil current() {
		ContextUtil helper = new ContextUtil();
		return helper;
	}

	private void setValue(String key, Object value) {
		HttpSession session = getSession();
		if (session != null) {
			session.setAttribute(key, value);
		}
	};

	private Object getValue(String key) {
		HttpSession session = getSession();
		if (session != null) {
			return session.getAttribute(key);
		}
		return null;
	}

	private void removeValue(String key) {
		HttpSession session = getSession();
		if (session != null) {
			session.removeAttribute(key);
		}
	}

	private void deleteSession() {
		HttpSession session = getSession();
		if (session != null) {
			session.invalidate();
		}
	}

	public void setStaffId(int staffId) {
		if (staffId == 0) {
			deleteSession();
		} else {
			setValue(STAFFID, staffId);
		}
	}

	public int getStaffId() {
		Object staffId = getValue(STAFFID);
		return staffId != null ? (int) staffId : 0;
	}

	public void setStaffName(String staffName) {
		setValue(STAFFNAME, staffName);
	}

	public String getStaffName() {
		Object staffName = getValue(STAFFNAME);
		return staffName != null ? (String) staffName : "";
	}

}
