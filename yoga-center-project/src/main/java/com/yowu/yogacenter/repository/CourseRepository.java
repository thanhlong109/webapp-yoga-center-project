/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.util.DBHelpler;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ACER
 */
public class CourseRepository implements Serializable{

    public List<Course> getAll() {
        String sql = "select * from tblCourse";
        List<Course> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Course> getActive() {
        String sql = "select * from tblCourse where course_is_active=1";
        List<Course> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Course> filterCourse(int categoryID,int minPrice,int maxPrice){
        String sql ;
        if(categoryID>=0){
            sql = "select * from tblCourse where course_is_active=1 and category_id="+categoryID+" and course_price>="+minPrice+" and course_price<="+maxPrice;
        }else{
            sql = "select * from tblCourse where course_is_active=1 and course_price>="+minPrice+" and course_price<="+maxPrice;
        }
        List<Course> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Course> getCourseByCategory(int categoryID){
        String sql = "select * from tblCourse where course_is_active=1 and category_id=?";
        List<Course> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, categoryID);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public int getMinCoursePrice(){
        String sql = "select top 1 course_price from tblCourse where course_is_active=1 order by course_price asc";
        int price = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    price=rs.getInt("course_price");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return price;
    }
    public int getMaxCoursePrice(){
        String sql = "select top 1 course_price from tblCourse where course_is_active=1 order by course_price desc";
        int price = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    price=rs.getInt("course_price");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return price;
    }
    public int countNumberCourseByInstructor(int accountID){
        String sql = "select count(*) as num from tblCourse where course_is_active=1 and account_id=?";
        int count = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountID);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    count=rs.getInt("num");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }
    
    public List<Course> getCourseByInstructor(int accountID){
        String sql = "select * from tblCourse where course_is_active=1 and account_id=?";
        List<Course> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountID);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public List<Course> getPopularCourse(int offset, int next){
        String sql = "select * from  tblCourse c  left join (select count(course_id) as num, rc.course_id from tblRegistrationCourse rc group by rc.course_id) rc on ( rc.course_id = c.course_id and c.course_is_active=1 ) order by num desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        List<Course> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    

    public List<Course> getRandomNCourses(int n) {
        String sql = "SELECT TOP " + n + " * FROM tblCourse ORDER BY NEWID()";
        List<Course> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {

            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Course detail(int id) {
        String sql = "select * from tblCourse where course_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean update(Course c) {
        String sql = "update tblCourse set course_title=? , course_is_active=? ,course_detail=? , course_duration=? , course_img=? , course_price=? , category_id=? ,account_id=?  where course_id=? ";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, c.getTitle());
            stmt.setBoolean(2, c.isIsActive());
            stmt.setString(3, c.getDetail());
            stmt.setInt(4, c.getDuration());
            stmt.setString(5, c.getImg());
            stmt.setFloat(6, c.getPrice());
            stmt.setInt(7, c.getCategory().getId());
            stmt.setInt(8, c.getAccount().getId());
            stmt.setInt(9, c.getId());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean delete(int id) {
        String sql = "update tblCourse set course_is_active=? where course_id=? ";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setBoolean(1, false);
            stmt.setInt(2, id);
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean add(Course c) {
        String sql = "INSERT INTO tblCourse (category_id, course_detail, course_duration, course_img, course_is_active, course_price, course_title, account_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, c.getCategory().getId());
            stmt.setString(2, c.getDetail());
            stmt.setInt(3, c.getDuration());
            stmt.setString(4, c.getImg());
            stmt.setBoolean(5, c.isIsActive());
            stmt.setFloat(6, c.getPrice());
            stmt.setString(7, c.getTitle());
            stmt.setInt(8, c.getAccount().getId());
            status = stmt.executeUpdate();
            System.out.println("Add success");

        } catch (Exception e) {
            System.out.println("Failed" + e.getMessage());
        }
        return status == 1;
    }

    public List<Course> getLastAddCourse() {
        List<Course> list = new ArrayList<>();

        String sql = "select * from tblCourse order by course_id desc ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository _categoryRepository = new CategoryRepository();
                    AccountRepository _accountRepository = new AccountRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(_categoryRepository.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    c.setAccount(_accountRepository.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            } catch (Exception e) {
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Course> searchName(String search) {
        String sql = "select * from tblCourse where course_title Like ? ";
        List<Course> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, search);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean checkDuplicate(String title) {
        String sql = "select course_title from tblCourse where course_title Like ? ";
        boolean status = false;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, title);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    status = true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public List<Course> getAllFollowPagination(int offset, int next) {
        String sql = "select * from tblCourse where course_is_active=1 order by course_id desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        List<Course> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CategoryRepository cr = new CategoryRepository();
                    Course c = new Course();
                    c.setId(rs.getInt("course_id"));
                    c.setCategory(cr.detail(rs.getInt("category_id")));
                    c.setDetail(rs.getString("course_detail"));
                    c.setDuration(rs.getInt("course_duration"));
                    c.setImg(rs.getString("course_img"));
                    c.setIsActive(rs.getBoolean("course_is_active"));
                    c.setPrice(rs.getFloat("course_price"));
                    c.setTitle(rs.getString("course_title"));
                    AccountRepository ar = new AccountRepository();
                    c.setAccount(ar.detail(rs.getInt("account_id")));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int count() {
        String sql = "select count(*) as num from tblCourse ";
        int count = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("num");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public boolean checkDuplicateUpdate(String title) {
        String sql = "SELECT a.course_title FROM (select course_title from tblCourse where course_is_active = 1 and course_title not Like ? ) a  where a.course_title Like ? ";
        boolean status = false;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, title);
            stmt.setString(2, title);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    status = true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    public static void main(String[] args) {
        CourseRepository cr = new CourseRepository();
        System.out.println(cr.getMaxCoursePrice());

        Course c = cr.detail(1);
        c.setImg("img");
        //cr.update(c);

    }

}
