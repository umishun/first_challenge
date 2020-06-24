package dbAccess;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import dao.Dao;
import dto.Dto;

public class Delete implements DBAccess {

	@Override
	public void execute(HttpServletRequest request) throws SQLException {
		
		Dao dao = null;
		int n = 0;
		
		String id =request.getParameter("id");
	
		Dto dto = new Dto();
		dto.setId(Integer.parseInt(id));
		try {
			dao = new Dao();
			n = dao.DeleteId(dto);
			if(n > 0) {
				request.setAttribute("message", "商品の削除が完了しました");
			}else {
				request.setAttribute("message", "商品の登録に失敗しました");
			}
		}finally {
			if(dao != null) dao.close();
		}
	}
	
}

	