package global.sesoc.project1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//��Ʈ�ѷ��� �޼��� ���� ���� ó��
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.debug("LoginInterceptor ����");
		
		//������ �α��� ���� �б�
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		
		//�α��ε��� ���� ��� �α��� �������� �̵�
		if (loginId == null) {
			//request.getContextPath()�� ��Ʈ ��θ� ���Ͽ� ���� ��η� ó��. ���⼭ /login�� controller�� value��.
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		//�α��� �� ��� ��û�� ��η� ����
		return super.preHandle(request, response, handler);
	}
}
