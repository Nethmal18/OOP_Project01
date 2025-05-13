package com.school.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LoginDBUtil {

    public static List<Staff> validate(String userId, String password) {
        List<Staff> userList = new ArrayList<>();

        String userType = "";
        if (userId != null && userId.length() >= 2) {
            userType = userId.substring(0, 2).toUpperCase();
        }

        String sql = "";
        String idField = "";
        String passwordField = "";

        if ("ST".equals(userType)) {
            sql = "SELECT std_id AS id, std_password AS password FROM Student WHERE std_id = ?";
        } else {
            sql = "SELECT stf_id AS id, stf_password AS password FROM Staff WHERE stf_id = ?";
        }

        try (
            Connection con = DBconnect.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)
        ) {
            pstmt.setString(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String dbPassword = rs.getString("password");

                    if (dbPassword != null && dbPassword.equals(password)) {
                        Staff user = new Staff(rs.getString("id"), dbPassword);  // You can rename class to User later
                        userList.add(user);
                    } else {
                        return null; // Invalid password
                    }
                } else {
                    return null; // No such user
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }
}
