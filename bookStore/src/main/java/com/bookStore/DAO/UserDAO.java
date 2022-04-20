package com.bookStore.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.zaxxer.hikari.HikariConfig;

public class UserDAO {
	
	private Connection conn; //자바와 데이터 베이스를 연결 (연결)
	private PreparedStatement pstmt; //쿼리문 대기 및 설정 (설정 및 실행)
	private ResultSet rs; //결과값 받아오기 (결과값)
	
	private HikariConfig hik; //root-context에서 hikariConfig에서 property로 정의한 값 가져오기
	
	/* 기본 생성자 */
	//DAO가 실행 되면 자동으로 생성되는 부분
	//메소드 마다 반복되는 코드를 이곳에 넣으면 코드가 간소화 됨
	public UserDAO() {
		try {
			String dbURL = hik.getJdbcUrl();
			String dbID = hik.getUsername();
			String dbPASS = hik.getPassword();
			Class.forName(hik.getDriverClassName()); //jdbc연결 클래스를 string 타입으로 불러옴
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPASS); //드라이버 매니저에 미리 저장했던 연결url, id, password를 담아 연결 설정을 함
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	/* 로그인 영역 */
	public int login(String userId, String userPassword) {
		String sql = "select userPassword from user where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql); //sql문을 대기시킴
			pstmt.setString(1, userId); //첫번째 '?'에 매개변수로 받아온 'userId' 대입
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}else {
					return 0; //비밀번호 틀림
				}
			}else {
				return -1; //아이디 없음
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0; //실제 사용자가 입력한 내용은 매개변수에 담아와서 로그인 메소드를 실행할 때 각 위치에 브라우저에서 넘어온 아이디와 비밀번호를 적용 시켜 결과를 도출하고, int타입으로 반환
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
