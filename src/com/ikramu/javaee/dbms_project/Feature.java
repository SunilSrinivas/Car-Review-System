package com.ikramu.javaee.dbms_project;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Bean corresponding to Feature table.
 */
public class Feature {
    /**
     * Get the feature name of the corresponding feature id.
     *
     * @param featureID The feature id
     * @return feature name
     */
    public String getFeatureName(int featureID) {
        ResultSet resultSet = DatabaseInteraction.getInstance().executeQuery(
                "select featureName from Feature where featureID=" + featureID);

        try {
            resultSet.next();
            return resultSet.getString("featureName");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int updateFeature(int reviewID, int featureID, int order_of_importance) {
        return DatabaseInteraction.getInstance().executeUpdate(
                "update Review_lists_Features " +
                        "set order_of_importance=" + order_of_importance +
                        " where reviewID=" + reviewID + " and featureID=" + featureID);
    }

    public ArrayList<Integer> getFeatureIDsOfCar(String model, String make, String year) {
        ResultSet resultSet = DatabaseInteraction.getInstance().
                executeQuery("select featureID from Car_has_Features where " +
                        "model='" + model + "' and make='" + make + "' and year='" + year + "'");

        ArrayList<Integer> featureIDs = new ArrayList<Integer>();
        try {
            while (resultSet.next()) {
                featureIDs.add(resultSet.getInt("featureID"));
            }
        } catch (SQLException ignored) {
        }

        return featureIDs;
    }
}