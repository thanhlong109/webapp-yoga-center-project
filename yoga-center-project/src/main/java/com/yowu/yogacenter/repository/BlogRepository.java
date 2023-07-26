/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.model.Blog;
import com.yowu.yogacenter.model.Role;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class BlogRepository {

    public List<Blog> getAll(int offset, int next) {
        String sql = "select * from tblBlog order by blog_date desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Blog> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Blog c = new Blog();
                    AccountRepository cr = new AccountRepository();
                    c.setId(rs.getInt("blog_id"));
                    c.setTitle(rs.getString("blog_title"));
                    c.setDetail(rs.getString("blog_detail"));
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getTimestamp("blog_date"));
                    c.setImg(rs.getString("blog_img"));
                    c.setActive(rs.getBoolean("is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Blog> getActive(int offset, int next) {
        String sql = "select * from tblBlog where is_active=1 order by blog_date desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Blog> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Blog c = new Blog();
                    AccountRepository cr = new AccountRepository();
                    c.setId(rs.getInt("blog_id"));
                    c.setTitle(rs.getString("blog_title"));
                    c.setDetail(rs.getString("blog_detail"));
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getTimestamp("blog_date"));
                    c.setImg(rs.getString("blog_img"));
                    c.setActive(rs.getBoolean("is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getInActive(int offset, int next) {
        String sql = "select * from tblBlog where is_active=0 order by blog_date desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Blog> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Blog c = new Blog();
                    AccountRepository cr = new AccountRepository();
                    c.setId(rs.getInt("blog_id"));
                    c.setTitle(rs.getString("blog_title"));
                    c.setDetail(rs.getString("blog_detail"));
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getTimestamp("blog_date"));
                    c.setImg(rs.getString("blog_img"));
                    c.setActive(rs.getBoolean("is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int count() {
        String sql = "select count(*) as num from tblBlog where is_active=1";
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
    
    public int countInactive() {
        String sql = "select count(*) as num from tblBlog where is_active=0";
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
    public int countAll() {
        String sql = "select count(*) as num from tblBlog";
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
    public int count(Date to) {
        String sql = "select count(*) as num from tblBlog where blog_date<=? and is_active=1";
        int count = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, to);
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

    public boolean create(Blog blog) {
        String sql = "INSERT INTO tblBlog ("
                + "blog_img, blog_date, account_id, "
                + "blog_detail, blog_title,is_active) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, blog.getImg());
            stmt.setTimestamp(2, blog.getDate());
            stmt.setInt(3, blog.getAccount().getId());
            stmt.setString(4, blog.getDetail());
            stmt.setString(5, blog.getTitle());
            stmt.setBoolean(6, blog.isActive());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }
    
    public void approval(int id){
        String sql = "update tblBlog set is_active=1 where blog_id=?";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Blog> getRecentBlog(int offset, int next, int accountId) {
        String sql = "select * from tblBlog where account_id=? order by blog_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Blog> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            stmt.setInt(2, offset);
            stmt.setInt(3, next);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Blog c = new Blog();
                    AccountRepository cr = new AccountRepository();
                    c.setId(rs.getInt("blog_id"));
                    c.setTitle(rs.getString("blog_title"));
                    c.setDetail(rs.getString("blog_detail"));
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getTimestamp("blog_date"));
                    c.setImg(rs.getString("blog_img"));
                    c.setActive(rs.getBoolean("is_active"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalBlog(int accountId) {
        String sql = "select COUNT(*) as count from tblBlog where account_id=?";
        int count = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("count");
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public Blog detail(int id) {
        String sql = "select * from tblBlog where blog_id =? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Blog c = new Blog();
                    AccountRepository cr = new AccountRepository();
                    c.setId(rs.getInt("blog_id"));
                    c.setTitle(rs.getString("blog_title"));
                    c.setDetail(rs.getString("blog_detail"));
                    c.setAccount(cr.detail(rs.getInt("account_id")));
                    c.setDate(rs.getTimestamp("blog_date"));
                    c.setImg(rs.getString("blog_img"));
                    c.setActive(rs.getBoolean("is_active"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean update(Blog c) {
        String sql = "update tblBlog set blog_title=? , blog_detail=? , account_id=? , blog_date=? , blog_img=?, is_active=? where blog_id=? ";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, c.getTitle());
            stmt.setString(2, c.getDetail());
            stmt.setInt(3, c.getAccount().getId());
            stmt.setTimestamp(4, c.getDate());
            stmt.setString(5, c.getImg());
            stmt.setInt(7, c.getId());
            stmt.setBoolean(6, c.isActive());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public boolean delete(int id) {
        String sql = "delete from tblBlog where blog_id=?";
        int status = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            CommentRepository cr = new CommentRepository();
            cr.delete(id);
            stmt.setInt(1, id);
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public int getTotalAllBlog() {
        String sql = "select count(*) as num from tblBlog ";
        int total = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    total = rs.getInt("num");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }

    public int getTotalAllBlog(Date to) {
        String sql = "select count(*) as num from tblBlog where blog_date <= ?";
        int total = 0;
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, to);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    total = rs.getInt("num");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }

    public List<Integer> getYearList() {
        String sql = "select YEAR(blog_date) as year from tblBlog group by YEAR(blog_date) order by YEAR(blog_date) desc";
        List<Integer> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    list.add(rs.getInt("year"));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return list;
    }

    public String getBlogDateJson(int year) {
        String sql = "SELECT DATEPART(MONTH, blog_date) AS [Month], COUNT(blog_id) AS [total] FROM tblBlog where YEAR(blog_date)=? GROUP BY DATEPART(MONTH, [blog_date]) ORDER BY [Month] ";
        String data = "";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, year);
            try ( ResultSet rs = stmt.executeQuery()) {
                int[] array;// at index 0 defind maximum month to display
                LocalDate now = LocalDate.now();
                if (now.getYear() == year) {
                    int month = now.getMonthValue();
                    array = new int[month];
                } else {
                    array = new int[12];
                }
                while (rs.next()) {
                    array[rs.getInt("Month") - 1] = rs.getInt("total");
                }
                ObjectMapper objMapper = new ObjectMapper();
                data = objMapper.writeValueAsString(array);
            }
        } catch (Exception e) {
            System.out.println("getBlogDateJson: " + e);
        }
        return data;
    }

    public static void main(String[] args) {
        BlogRepository cr = new BlogRepository();
        System.out.println(cr.delete(12));
    }
}
