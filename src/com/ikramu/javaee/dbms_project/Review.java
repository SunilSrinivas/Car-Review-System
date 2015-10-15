package com.ikramu.javaee.dbms_project;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Bean corresponding to Review table.
 */
public class Review {
    /**
     * The String representations of 'review ratings'.
     */
    private final String[] REVIEW_RATINGS =
            {"", "Extremely Helpful", "Very Helpful", "Helpful", "Not Helpful", "Misleading"};
    private int currentReviewID;

    public int getCurrentReviewID() {
        return currentReviewID;
    }

    public void setCurrentReviewID(int currentReviewID) {
        this.currentReviewID = currentReviewID;
    }

    /**
     * Get the string representation of the rating.
     *
     * @param rating integer representation of rating
     * @return string representation of rating
     */
    public String getRatingString(int rating) {
        return REVIEW_RATINGS[rating];
    }

    /**
     * Get all reviews for the particular car.
     *
     * @param model model of the car
     * @param make  make of the car
     * @param year  year of the car
     * @return all review ids for the given car
     */
    public ArrayList<Integer> getReviewIDs(String model, String make, String year) {
        ResultSet resultSet = DatabaseInteraction.getInstance().
                executeQuery("select reviewID from Car_has_Reviews where model=\"" + model
                        + "\" and make=\"" + make + "\" and year =\"" + year + "\";");

        ArrayList<Integer> reviewIDs = new ArrayList<Integer>();
        try {
            while (resultSet.next()) {
                reviewIDs.add(resultSet.getInt("reviewID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviewIDs;
    }

    /**
     * Get the description of the review
     *
     * @param reviewID review id
     * @return review description
     */
    public String getReviewDescription(int reviewID) {
        ResultSet resultSet = DatabaseInteraction.getInstance().executeQuery(
                "select reviewDescription from Review where reviewID=" + reviewID + ";");

        try {
            resultSet.next();
            return resultSet.getString("reviewDescription");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Get the features for the given review.
     *
     * @param reviewID review id
     * @return feature ids along with orders of importance
     */
    public HashMap<Integer, Integer> getFeaturesForReview(int reviewID) {
        ResultSet resultSet = DatabaseInteraction.getInstance().executeQuery(
                "select featureID, order_of_importance from Review_lists_Features " +
                        "where reviewID=" + reviewID + ";");


        HashMap<Integer, Integer> features = new HashMap<Integer, Integer>();
        int featureID, order_of_importance;

        try {
            while (resultSet.next()) {
                featureID = resultSet.getInt("featureID");
                order_of_importance = resultSet.getInt("order_of_importance");
                features.put(featureID, order_of_importance);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return features;
    }
}
