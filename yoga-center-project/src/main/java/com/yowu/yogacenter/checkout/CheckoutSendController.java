/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.checkout;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.BillRepository;
import com.yowu.yogacenter.repository.CourseRepository;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

/**
 *
 * @author Chien Thang
 */
public class CheckoutSendController extends HttpServlet {
    private final String CHECKOUT_PAGE ="Client/checkout.jsp";
    private final String PENDING_CHECKOUT = "Client/pending.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = CHECKOUT_PAGE;
        try {
            int courseId = Integer.parseInt(request.getParameter("id"));
            CourseRepository cr = new CourseRepository();
            Course c = cr.detail(courseId);
            String orderCode = Config.getRandomNumber(6);
            Account acc = (Account) request.getSession().getAttribute("account");
            String accountID = Integer.toString(acc.getId());
            float total = Float.parseFloat(request.getParameter("total"));
            int discount = 0;
            String sDiscount = request.getParameter("discountTotal");
            if (!sDiscount.isEmpty()) {
                discount = Integer.parseInt(sDiscount);
            }
            String method = request.getParameter("payment-method");
            
            int status = 2;
            boolean isActive = true;
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            System.out.println(date);
            Bill order = new Bill(c, acc, status, isActive, total, discount, date, orderCode, method);
            BillRepository billRepo = new BillRepository();
            billRepo.add(order);
            
//            System.out.println(billRepo);
            int courseScheduleID = Integer.parseInt(request.getParameter("course_scheduleId"));
//            System.out.println(courseId);
            CourseScheduleRepository csr = new CourseScheduleRepository();
 //           System.out.println(csr);
            CourseSchedule cs = csr.detailByScheduleID(courseScheduleID);
//            System.out.println(cs);
            int course_status = 1;
            boolean regis_status = true;
            RegistrationCourse regis = new RegistrationCourse(acc, c, date, date, cs, course_status, regis_status);
            RegistrationCourseRepository regisRepo = new RegistrationCourseRepository();
            regisRepo.addRegistration(regis);
            System.out.println(regis);
            
//            url = SUCCESS;
            if (method.equals("studio")) {
                url = PENDING_CHECKOUT;
                request.getRequestDispatcher(url).forward(request, response);
            }else{
                long totalVnPay = (long)(total*100);
                url = vnpay_payment(orderCode, totalVnPay, request, response);
                response.sendRedirect(url);
                System.out.println(url);
            }
        } catch (Exception e) {
            System.out.println(e);
        }        
    }

    private String vnpay_payment(String paymentCode, long price, HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException, IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "100";
        long amount = price*23520;
        String bankCode = "";

        String vnp_TxnRef = paymentCode;
        String vnp_IpAddr = Config.getIpAddress(req);
        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        System.out.println(paymentUrl);
        return paymentUrl;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
