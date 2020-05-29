package member;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class MemberDAO {

	// DB변수
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Context cont = null;
	DataSource ds = null;

	// test_start-----------------------------------------------------------------------------
	public int test() throws Exception {
		// 출력객체
		int result = 0;
		System.out.println("---MemberDAO test");

		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select count(*) from member";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					result = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" test() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // test_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// checkID_start-----------------------------------------------------------------------------
	public boolean checkID(String id) throws Exception {
		// 출력객체
		boolean result = false;
		int k = -1;
		System.out.println("---MemberDAO checkID---"+id+"----");

		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select count(*) from member where id = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					k = rs.getInt(1);
					System.out.println("k=" + k);
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" checkID() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		System.out.println("k=" + k);
		if (k == 0) {
			result = true;
		}
		return result;
	} // checkID_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// input_start-----------------------------------------------------------------------------
	public int input(MemberDTO dto) throws Exception {
		// 출력객체
		int result = 0;
		System.out.println("---MemberDAO input");
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "insert into member(id, pwd, name)  values(? , ? , ?)";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			// 5. 실행
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" input() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return result;
	} // input_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// getDTO_start-----------------------------------------------------------------------------
	public MemberDTO getDTO(String id) throws Exception {
		// 출력객체
		MemberDTO dto = new MemberDTO();
		System.out.println("---MemberDAO getDTO");
		try {
			// 1+2
			con = ds.getConnection();
			// 3. sql
			String sql = "select * from member where id = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 --- select 때만 표시
			if (rs != null) {
				while (rs.next()) {
					dto.setId(rs.getString("id"));
					dto.setPwd(rs.getString("pwd"));
					dto.setName(rs.getString("name"));
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception(" getDTO() 예외  ");
		} finally {
			close(con, pstmt, rs);
		} // finally end
		return dto;
	} // getDTO_end-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-

	// //////////////////////////////////////////////////////////////////////////////////////////

	private MemberDAO() {
	}

	private static class SingleTone {
		public static final MemberDAO INSTANCE = new MemberDAO();
	}

	public static MemberDAO getInstance() {
		return SingleTone.INSTANCE;
	}

	// 커넥션 풀
	private Connection getConnection() throws Exception {
		cont = new InitialContext();
		ds = (DataSource) cont.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}

	// close 1
	static final void close(Connection con, PreparedStatement pstmt,
			ResultSet rs) throws Exception {
		close(con, pstmt);
		if (rs != null) {
			rs.close();
		}
	} // close () end

	// close 2
	static final void close(Connection con, PreparedStatement pstmt)
			throws Exception {
		if (con != null) {
			con.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
	} // close () end

}