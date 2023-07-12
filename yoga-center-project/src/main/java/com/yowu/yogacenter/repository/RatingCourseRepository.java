/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.RatingCourse;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class RatingCourseRepository {

    public List<RatingCourse> getAll() {
        String sql = "select * from tblRatingCourse";
        List<RatingCourse> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RatingCourse c = new RatingCourse();
                    RegistrationCourseRepository rc = new RegistrationCourseRepository();
                    c.setRegistrationCourse(rc.detail(rs.getInt("registration_id")));
                    c.setFeedback(rs.getString("feedback"));
                    c.setRatingStar(rs.getInt("rating_star"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     public List<RatingCourse> getByCourseID(int courseId) {
        String sql = "select * from tblRatingCourse where course_id=?";
        List<RatingCourse> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RatingCourse c = new RatingCourse();
                    RegistrationCourseRepository rc = new RegistrationCourseRepository();
                    c.setRegistrationCourse(rc.detail(rs.getInt("registration_id")));
                    c.setFeedback(rs.getString("feedback"));
                    c.setRatingStar(rs.getInt("rating_star"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public RatingCourse detail(int id) {
        String sql = "select * from tblRatingCourse where registration_id=? "
                + "AND account_id =? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RatingCourse c = new RatingCourse();
                    RegistrationCourseRepository rc = new RegistrationCourseRepository();
                    c.setRegistrationCourse(rc.detail(rs.getInt("registraion_id")));
                    c.setFeedback(rs.getString("feedback"));
                    c.setRatingStar(rs.getInt("rating_star"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }


    
    public boolean add(RatingCourse ratingCourse) {
        String sql = "INSERT INTO tblRatingCourse (registration_id, feedback, rating_star) "
                + "VALUES (?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, ratingCourse.getRegistrationCourse().getId());
            stmt.setString(2, ratingCourse.getFeedback());
            stmt.setInt(3, ratingCourse.getRatingStar());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(RatingCourse ratingCourse) {
        String sql = "UPDATE tblRatingCourse SET feedback = ?, rating_star = ? WHERE registration_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, ratingCourse.getFeedback());
            stmt.setInt(2, ratingCourse.getRatingStar());
            stmt.setInt(3, ratingCourse.getRegistrationCourse().getId());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }
    public float getAvgCourseRating(int courseId){
        String sql = "select SUM(rating_star) as sum , COUNT(rating_star) as count from tblRatingCourse where course_id=?";
        float avg = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            try(ResultSet rs = stmt.executeQuery()){
                if(rs.next()){
                    int count = rs.getInt("count");
                    int sum = rs.getInt("sum");
                    avg = sum/(float)count;
                    DecimalFormat df = new DecimalFormat("#.#");
                    avg = Float.parseFloat(df.format(avg).replace(",", "."));
                }
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return avg;
        
    }
    public static void main(String[] args) {
        RatingCourseRepository rcr = new RatingCourseRepository();
        System.out.println(rcr.getByCourseID(2).get(0).getRegistrationCourse().getAccount().getImg());
    }
}
