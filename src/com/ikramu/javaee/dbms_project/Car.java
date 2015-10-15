package com.ikramu.javaee.dbms_project;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 * Bean corresponding to Car table
 */
public class Car {

    /**
     * The selected car.
     */
    private String selectedModel, selectedMake, selectedYear;

    public String getSelectedModel() {
        return selectedModel;
    }

    public void setSelectedModel(String selectedModel) {
        this.selectedModel = selectedModel;
    }

    public String getSelectedMake() {
        return selectedMake;
    }

    public void setSelectedMake(String selectedMake) {
        this.selectedMake = selectedMake;
    }

    public String getSelectedYear() {
        return selectedYear;
    }

    public void setSelectedYear(String selectedYear) {
        this.selectedYear = selectedYear;
    }

    /**
     * Get the list of all the cars from Car table.
     *
     * @return List of cars
     */
    public ArrayList<String[]> getAllCars() {
        String[] carDetails;

        ArrayList<String[]> carList = new ArrayList<String[]>();

        ResultSet resultSet = DatabaseInteraction.getInstance().executeQuery(
                "SELECT model, make, year FROM Car;");

        try {
            while (resultSet.next()) {
                carDetails = new String[3];
                carDetails[0] = resultSet.getString("model");                                      // model
                carDetails[1] = resultSet.getString("make");                                       // make
                carDetails[2] = new SimpleDateFormat("YYYY").format(resultSet.getDate("year"));    // year

                carList.add(carDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carList;
    }
}