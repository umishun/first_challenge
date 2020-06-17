package dbAccess;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dao.Dao;
import dto.Dto;

public class Select implements DBAccess {

	@Override
	public void execute(HttpServletRequest request) throws SQLException {
		
		Dao dao = null;
		
		try {
			dao = new Dao();
			ArrayList<Dto> list = dao.getMoney();
			if(list.size() > 0) {
				request.setAttribute("list", list);
			}else {
				request.setAttribute("message", "まだデータがありません");
			}
		}finally {
			if(dao != null) dao.close();
		}		
	}

}
