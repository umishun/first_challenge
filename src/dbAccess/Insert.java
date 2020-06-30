package dbAccess;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import dao.Dao;
import dto.Dto;
import filter.Judge;

public class Insert implements DBAccess {

	
	@Override
	public void execute(HttpServletRequest request) throws SQLException {
		
		Dao dao = null;
		int n = 0;
		
		String product =request.getParameter("product");
		String price =request.getParameter("price");
		String shupi =request.getParameter("shupi");
		String year = request.getParameter("year");
		String day = request.getParameter("day");
		String month =request.getParameter("month");
		
		System.out.println(shupi);
		if(product !=null && !product.isEmpty() 
			&& price != null && !price.isEmpty()&& Judge.isNumber(price)
			&& shupi != null && !shupi.isEmpty()) {
			
			Dto dto = new Dto();
			dto.setBuy(product);
			dto.setMoney(Integer.parseInt(price));
			dto.setKubun(Boolean.parseBoolean(shupi));
			dto.setYear(Integer.parseInt(year));
			dto.setDay(Integer.parseInt(day));
			dto.setMonth(Integer.parseInt(month));
			
			try {
				dao = new Dao();
				n = dao.setMoney(dto);
				if(n > 0) {
					request.setAttribute("message", "新規商品の登録が完了しました");
				}else {
					request.setAttribute("message", "商品の登録に失敗しました");
				}
			}finally {
				if(dao != null) dao.close();
			}
		}else {
			request.setAttribute("message", "入力が不正です");
		}
	}
}

