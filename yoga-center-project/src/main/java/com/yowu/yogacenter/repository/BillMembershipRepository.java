/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yowu.yogacenter.model.BillMembership;
import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.util.DBHelpler;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chien Thang
 */
public class BillMembershipRepository {

    public List<BillMembership> getAll() {
        String sql = "select * from tblBillMembership";
        List<BillMembership> list = new ArrayList<>();

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    MembershipRepository mb = new MembershipRepository();
                    BillMembership c = new BillMembership();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<BillMembership> getByAccountID(int accountId) {
        String sql = "select * from tblBillMembership where account_id=?";
        List<BillMembership> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    BillMembership c = new BillMembership();
                    MembershipRepository mb = new MembershipRepository();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public BillMembership getMembershipIdByOrdercode(String ordercode) {
        String sql = "select * from tblBillMembership where order_code=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, ordercode);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    BillMembership c = new BillMembership();
                    MembershipRepository mb = new MembershipRepository();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public BillMembership getMembershipIdByAccountID(int accountID) {
        String sql = "select * from tblBillMembership where account_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountID);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    BillMembership c = new BillMembership();
                    MembershipRepository mb = new MembershipRepository();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public BillMembership getAllByAccountIdAndCourseID(String accountId, int memId) {
        String sql = "select * from tblBillMembership WHERE account_id = ? AND course_id = ? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, accountId);
            stmt.setInt(2, memId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    BillMembership c = new BillMembership();
                    MembershipRepository mb = new MembershipRepository();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public BillMembership getAllByAccountIdAndMemId(int accountId, int memId) {
        String sql = "select * from tblBillMembership WHERE account_id = ? AND membership_id = ? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            stmt.setInt(2, memId);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    BillMembership c = new BillMembership();
                    MembershipRepository mb = new MembershipRepository();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean updateStatus(String ordercode, String date, int status) throws ParseException {
        boolean check = false;
        LocalDateTime sqlDate = null;
        if (!date.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
            sqlDate = LocalDateTime.parse(date, formatter);
        }

        String sql = "UPDATE tblBillMembership SET bill_status = ? , payment_date =? WHERE order_code = ?";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, status);
            stmt.setObject(2, sqlDate);
            stmt.setString(3, ordercode);
            check = stmt.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
            System.out.println(e);
        }
        return check;
    }
    
    public boolean updateStatus(String ordercode, LocalDate date, int status) throws ParseException {
        boolean check = false;
        LocalDateTime sqlDate = null;
        
        
        String sql = "UPDATE tblBillMembership SET bill_status = ? , payment_date =? WHERE order_code = ?";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, status);
            stmt.setObject(2, date);
            stmt.setString(3, ordercode);
            check = stmt.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
            System.out.println(e);
        }
        return check;
    }
    

    public boolean updateStatus(int id, int status) {

        String sql = "UPDATE tblBillMembership SET bill_status = ? WHERE bill_mem_id = ?";
        int updateStatus = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, status);
            stmt.setInt(2, id);

            updateStatus = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return updateStatus == 1;
    }

    public BillMembership detail(int id) {
        String sql = "select * from tblBillMembership where bill_mem_id=? ";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    BillMembership c = new BillMembership();
                    MembershipRepository mb = new MembershipRepository();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    return c;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean add(BillMembership c) {
        String sql = "INSERT INTO tblBillMembership (membership_id, account_id, bill_status,"
                + " bill_is_active, bill_value, bill_discount, bill_date, "
                + "order_code, payment_method) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, c.getMembership().getId());
            stmt.setInt(2, c.getAccount().getId());
            stmt.setInt(3, c.getStatus());
            stmt.setBoolean(4, c.isIsActive());
            stmt.setFloat(5, c.getValue());
            stmt.setInt(6, c.getDiscount());
            stmt.setDate(7, c.getDate());
            stmt.setString(8, c.getOrdercode());
            stmt.setString(9, c.getMethod());

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean update(BillMembership c) {
        String sql = "UPDATE tblBillMembership SET membership_id = ?, account_id = ?, "
                + "bill_status = ?, bill_is_active = ?, bill_value = ?, "
                + "bill_discount = ?, bill_date = ?, order_code = ?, payment_method = ?, paymenmt_date =? "
                + "WHERE bill_mem_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, c.getMembership().getId());
            stmt.setInt(2, c.getAccount().getId());
            stmt.setInt(3, c.getStatus());
            stmt.setBoolean(4, c.isIsActive());
            stmt.setFloat(5, c.getValue());
            stmt.setInt(6, c.getDiscount());
            stmt.setDate(7, c.getDate());
            stmt.setInt(8, c.getId());
            stmt.setString(9, c.getOrdercode());
            stmt.setString(10, c.getMethod());
            stmt.setDate(11, c.getPaymentDate());
            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status == 1;
    }

    public boolean delete(int id) {
        String sql = "UPDATE tblBillMembership SET bill_is_active = 0 WHERE bill_mem_id = ?";
        int status = 0;

        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, id);

            status = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status == 1;
    }

    public List<BillMembership> searchId(int search) {
        String sql = "select * from tblBillMembership where bill_mem_id=? ";
        List<BillMembership> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, search);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    CourseRepository cr = new CourseRepository();
                    BillMembership c = new BillMembership();
                    MembershipRepository mb = new MembershipRepository();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalPaidBill() {
        int total = 0;
        String sql = "select count(*) as num from tblBillMembership where bill_status = 0";
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

    public int getTotalPaidBill(Date to) {
        int total = 0;
        String sql = "select count(*) as num from tblBillMembership where bill_status = 0 and payment_date<=?";
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

    public float getTotalIncome() {
        float income = 0;
        String sql = "select SUM(bill_value) as income from tblBillMembership where bill_status = 0";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    income = rs.getFloat("income");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return income;
    }

    public float getTotalIncome(Date to) {
        float income = 0;
        String sql = "select SUM(bill_value) as income from tblBillMembership where bill_status = 0 and payment_date<=?";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setDate(1, to);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    income = rs.getFloat("income");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return income;
    }

    public String getBillMembershipJson() {
        String sql = "select bill_date, SUM(bill_value)as bill_value from tblBillMembership where bill_status=0 group by  bill_date order by bill_date asc";
        List<List<Object>> list = new ArrayList();
        String data = "";
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    List<Object> row = new ArrayList<>();
                    long date = rs.getDate("bill_date").getTime();
                    row.add(date);
                    row.add(rs.getFloat("bill_value"));
                    list.add(row);
                }
                ObjectMapper mapper = new ObjectMapper();
                data = mapper.writeValueAsString(list);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return data;
    }

    public String getBillPaidDateJson(int year) {
        String sql = "SELECT DATEPART(MONTH, payment_date) AS [Month], COUNT(bill_mem_id) AS [total] FROM tblBillMembership where bill_status=0 and YEAR(payment_date)=? GROUP BY DATEPART(MONTH, [payment_date]) ORDER BY [Month]";
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
            System.out.println(e);
        }
        return data;
    }

    public List<BillMembership> getAllFollowPagination(int offset, int next) {
        String sql = "select * from tblBillMembership order by bill_mem_id desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        List<BillMembership> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, next);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    MembershipRepository mb = new MembershipRepository();
                    BillMembership c = new BillMembership();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int count() {
        String sql = "select count(*) as num from tblBillMembership ";
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

    public List<BillMembership> searchOrderCode(String search) {
        String sql = "select * from tblBillMembership where order_code Like ? ";
        List<BillMembership> list = new ArrayList<>();
        try ( PreparedStatement stmt = DBHelpler.makeConnection().prepareStatement(sql)) {
            stmt.setString(1, search);
            try ( ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccountRepository acc = new AccountRepository();
                    MembershipRepository mb = new MembershipRepository();
                    BillMembership c = new BillMembership();
                    c.setMembership(mb.detail(rs.getInt("membership_id")));
                    c.setAccount(acc.detail(rs.getInt("account_id")));
                    c.setId(rs.getInt("bill_mem_id"));
                    c.setStatus(rs.getInt("bill_status"));
                    c.setIsActive(rs.getBoolean("bill_is_active"));
                    c.setValue(rs.getFloat("bill_value"));
                    c.setDiscount(rs.getInt("bill_discount"));
                    c.setDate(rs.getDate("bill_date"));
                    c.setOrdercode(rs.getString("order_code"));
                    c.setMethod(rs.getString("payment_method"));
                    c.setPaymentDate(rs.getDate("payment_date"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        BillRepository b = new BillRepository();

    }
}
