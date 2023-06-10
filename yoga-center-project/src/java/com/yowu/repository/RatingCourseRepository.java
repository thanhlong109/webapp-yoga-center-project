/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.repository;

import com.yowu.model.RatingCourse;
import com.yowu.model.RegistrationCourse;
import com.yowu.util.DBHelpler;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class RatingCourseRepository {

    public class CourseInstructorRepository {

        public List<RatingCourse> getAll() {
            String sql = "select * from tblRatingCourse";
            List<RatingCourse> list = new ArrayList<>();

            try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
                try ( ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        RatingCourse c = new RatingCourse();
                        RegistrationCourseRepository rc = new RegistrationCourseRepository();
                        c.setRegistrationCourse(rc.detail(rs.getInt("registraion_id")));
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
            String sql = "select * from tblRatingCourse where registraion_id=? "
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

    }

    public boolean add(RatingCourse ratingCourse) {
        String sql = "INSERT INTO tblRatingCourse (registraion_id, feedback, rating_star) "
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
        String sql = "UPDATE tblRatingCourse SET feedback = ?, rating_star = ? WHERE registraion_id = ?";
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
}
