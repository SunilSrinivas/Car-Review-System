package com.ikramu.javaee.dbms_project;

import org.yaml.snakeyaml.Yaml;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 * Singleton to Interact with the database.
 */
public class DatabaseInteraction {
    private static DatabaseInteraction databaseInteraction;
    private Connection connection = null;
    private Statement statement = null;

    /**
     * This is a Singleton class. Call {@link DatabaseInteraction}.{@link #getInstance()} instead.
     */
    DatabaseInteraction() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // Get Database Details from the db_details.yml file
        DBDetails dbDetails = new Yaml().loadAs(getClass().getClassLoader().getResourceAsStream("db_details.yml"), DBDetails.class);

        // Get connection
        try {
            connection = DriverManager.getConnection(dbDetails.getDbUrl(), dbDetails.getUser(), dbDetails.getPassword());
            statement = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static DatabaseInteraction getInstance() {
        if (databaseInteraction == null)
            databaseInteraction = new DatabaseInteraction();
        return databaseInteraction;
    }

    public Connection getConnection() {
        return connection;
    }

    /**
     * Run the SQL query on the database and get the result.
     *
     * @param query The SQL query
     * @return Result of the SQL query
     */
    public ResultSet executeQuery(String query) {
        ResultSet resultSet = null;

        try {
            resultSet = statement.executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultSet;
    }

    /**
     * Run DML sql statements
     *
     * @param sqlStatement sql statement
     * @return Number of rows updated
     */
    public int executeUpdate(String sqlStatement) {
        int updatedRows = 0;
        try {
            updatedRows = statement.executeUpdate(sqlStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updatedRows;
    }
}