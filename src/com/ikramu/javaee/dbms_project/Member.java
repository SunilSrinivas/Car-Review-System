package com.ikramu.javaee.dbms_project;

import java.sql.*;

/**
 * Bean corresponding to Member table.
 */
public class Member {
    /**
     * The current member.
     */
    private String currentUsername;

    public String getCurrentUsername() {
        return currentUsername;
    }

    public void setCurrentUsername(String currentUsername) {
        this.currentUsername = currentUsername;
    }

    /**
     * Authenticate the member.
     *
     * @param username username
     * @param email    email
     * @return Whether member exists in the database.
     */
    public boolean authenticateMember(String username, String email) {
        ResultSet resultSet = DatabaseInteraction.getInstance().
                executeQuery("SELECT username, email FROM Member;");
        String db_username, db_email;
        try {
            while (resultSet.next()) {
                db_username = resultSet.getString("username");
                db_email = resultSet.getString("email");
                if (db_username.equals(username) && db_email.equals(email)) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}