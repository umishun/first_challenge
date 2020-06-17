package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Dto;

public class Dao {

	private Connection con;
	private String sql;
	
	/**
	 * コンストラクタ
	 * @throws SQLException
	 */
	public Dao() throws SQLException{
		// DBを指定
		String url= "jdbc:mysql://localhost:3306/kakeibo?serverTimezone=UTC" ;
		// ログイン情報
		String user = "root";
		String pass = "root";
		// DBへ接続
		con = DriverManager.getConnection(url, user, pass);
		System.out.println("Connection success!");
	}
	
	/**
	 * DBとの接続を閉じる
	 */
	public void close() {
		try {
			// 接続を閉じる
			if(con != null) con.close(); 
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	/**
	 * お気に入り店舗のIDを取得
	 * @param accountId:アカウントID
	 * @return お気に入り店舗のIDリスト
	 * @throws SQLException
	 */
	public ArrayList<Dto> getMoney() throws SQLException{
		// SQL
		sql = "select * from nyushutsu";
		PreparedStatement ps = null;
		
		ResultSet rs = null;
		
		// 店舗IDリスト
		ArrayList<Dto> list = new ArrayList<Dto>();
		
		try {
			// プレースホルダを設定
			ps = con.prepareStatement(sql);
			//ps.setString(1, accountId);

			// SQL実行して戻り値として実行結果をrsに代入している。	
			rs = ps.executeQuery();
			while(rs.next()) {
				//型をつけて名前（変数名）を付ける。
				Dto item = new Dto();
				// 店舗IDを取得してリストへ格納
				item.setMoney(rs.getInt("money"));
				item.setMonth(rs.getInt("month"));
				item.setKubun(rs.getInt("Kubun"));
				item.setBuy(rs.getString("buy"));
				list.add(item);
			}
			rs.close();
		}finally {
			ps.close();
		}
		
		return list;
	}
	
}
