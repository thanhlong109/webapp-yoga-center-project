/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.yowu.yogacenter.checkout;

import com.yowu.yogacenter.model.Account;
import com.yowu.yogacenter.model.Bill;
import com.yowu.yogacenter.model.BillMembership;
import com.yowu.yogacenter.model.ClassSchedule;
import com.yowu.yogacenter.model.Course;
import com.yowu.yogacenter.model.CourseSchedule;
import com.yowu.yogacenter.model.Membership;
import com.yowu.yogacenter.model.RegistrationCourse;
import com.yowu.yogacenter.model.RegistrationMembership;
import com.yowu.yogacenter.repository.AccountRepository;
import com.yowu.yogacenter.repository.BillMembershipRepository;
import com.yowu.yogacenter.repository.BillRepository;
import com.yowu.yogacenter.repository.ClassScheduleRepository;
import com.yowu.yogacenter.repository.CourseRepository;
import com.yowu.yogacenter.repository.CourseScheduleRepository;
import com.yowu.yogacenter.repository.MembershipRepository;
import com.yowu.yogacenter.repository.RegistrationCourseRepository;
import com.yowu.yogacenter.repository.RegistrationMembershipRepository;
import jakarta.mail.Session;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.DayOfWeek;
import java.util.Arrays;

/**
 *
 * @author Chien Thang
 */
public class CheckoutSendController extends HttpServlet {

    private final String CHECKOUT_PAGE = "Client/checkout.jsp";
    private final String PENDING_CHECKOUT = "Client/pending.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = CHECKOUT_PAGE;
        String method = request.getParameter("payment-method");
        String orderCode = Config.getRandomNumber(6);
        float total = 0;
        Bill order = null;
        BillMembership orderMem = null;
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        Account acc = (Account) request.getSession().getAttribute("account");
                        RegistrationMembership rm = new RegistrationMembership();

        try {
            RegistrationMembership regisMember = (RegistrationMembership) request.getSession().getAttribute("RegistrationMembership");

            if (regisMember != null) {
                int memId = Integer.parseInt(request.getParameter("memId"));
                
                MembershipRepository msr = new MembershipRepository();
                RegistrationMembershipRepository regis = new RegistrationMembershipRepository();
                
                Membership mb = msr.detail(memId);
                int status = 2;
                boolean isActive = true;
                total = Float.parseFloat(request.getParameter("total"));
                int discount = 0;
                boolean regisStatus = false;
                String dateStart = request.getParameter("startDate")+ " 00:00:00";
                String dateEnd = request.getParameter("endDate")+ " 00:00:00";
                
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd' 'HH:mm:ss");
                
                LocalDateTime dateStartS = LocalDateTime.parse(dateStart, formatter);
                LocalDateTime  dateEndS = LocalDateTime.parse(dateEnd, formatter);
                System.out.println("dateS"+dateStartS);
                System.out.println("dateE"+dateEndS);
                //(Membership membership, Account account, int status, boolean isActive, float value, int discount, Date date, String ordercode, String method, Date paymentDate)
                orderMem = new BillMembership(mb, acc, status, isActive, total, discount, date, orderCode, method);
                //(Membership membership, Account account, Date registrationDate, Date expirationDate, boolean registrationtatus)
                rm = new RegistrationMembership(mb, acc, regisStatus, dateStartS, dateEndS);
                BillMembershipRepository billMemRepo = new BillMembershipRepository();
                billMemRepo.add(orderMem);
                regis.add(rm);
            } else {
                int courseId = Integer.parseInt(request.getParameter("id"));
                CourseRepository cr = new CourseRepository();
                Course c = cr.detail(courseId);

                total = Float.parseFloat(request.getParameter("total"));
                int discount = 0;
                String sDiscount = request.getParameter("discountTotal");
                if (!sDiscount.isEmpty()) {
                    discount = Integer.parseInt(sDiscount);
                }

                int status = 2;
                boolean isActive = true;

                System.out.println("date" + date);
                order = new Bill(c, acc, status, isActive, total, discount, date, orderCode, method);
                BillRepository billRepo = new BillRepository();
                billRepo.add(order);

                //Bill bill = billRepo.getCourseIdByOrdercode(orderCode);
//            System.out.println(billRepo);
                int courseScheduleID = Integer.parseInt(request.getParameter("course_scheduleId"));
//            System.out.println(courseId);
                CourseScheduleRepository csr = new CourseScheduleRepository();
                //           System.out.println(csr);
                CourseSchedule cs = csr.detailByScheduleID(courseScheduleID);
//            System.out.println(cs);
                int course_status = 0;
                boolean regis_status = true;
                RegistrationCourse regis = new RegistrationCourse(acc, c, date, date, cs, course_status, regis_status);
                RegistrationCourseRepository regisRepo = new RegistrationCourseRepository();
//            regisRepo.addRegistration(regis);
                int lastInsertId = regisRepo.addRegis(regis);
                String duration = request.getParameter("duration");
                String startTime = request.getParameter("startTime");

                System.out.println("asv" + lastInsertId);
                System.out.println("asss" + regis);

                String schedule = cs.getDateOfWeek();
                System.out.println("schedule" + schedule);

                String inputDayOfWeek = schedule; // Lấy từ FE hoặc DB => Day of week

                String inputDateTime = startTime + " 00:00:00"; // Lấy từ FE hoặc DB => start date

                int inputDuration = Integer.parseInt(duration); // Lấy từ FE hoặc DB => duration

                DayOfWeek[] allDateOfWeek = DayOfWeek.values();
                System.out.println("range day" + Arrays.toString(allDateOfWeek));

                String[] parts = inputDayOfWeek.split(",");

                int[] numbers = new int[parts.length];

                for (int i = 0; i < parts.length; i++) {
                    numbers[i] = Integer.parseInt(parts[i]);
                }

                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd' 'HH:mm:ss");

                LocalDateTime dateTime = LocalDateTime.parse(inputDateTime, formatter);

                LocalDate startDate = dateTime.toLocalDate();

                int temp = 1;
                LocalDate firstDate = null;
                LocalDate lastDate = startDate;
                boolean firstDateFound = false;
                while (temp <= inputDuration) {
                    DayOfWeek dayOfWeek = startDate.getDayOfWeek();
                    for (int number : numbers) {
                        if (allDateOfWeek[number] == dayOfWeek) {//fix
                            System.out.println("Day: " + startDate);
                            //Call repository save to DB:
                            int regisId = lastInsertId;
                            Time startTime1 = cs.getStartTime();
                            Time endTime = cs.getEndTime();
                            Date classDate = Date.valueOf(startDate);
                            int statusClass = 1;
                            ClassScheduleRepository scr = new ClassScheduleRepository();
                            //public ClassSchedule(Date date, Time startTime, Time endTime, int status, int regisId)
                            ClassSchedule cse = new ClassSchedule(classDate, startTime1, endTime, statusClass, regisId);
                            scr.addClassSchedule(cse);
                            //.....
                            //End.
                            temp++;
                            if (!firstDateFound) {
                                firstDate = startDate;
                                firstDateFound = true;
                            }
                        }
                    }
//                startDate = startDate.plusDays(1);
//                lastDate = startDate; // Cập nhật ngày cuối cùng trong vòng lặp
//                startDate = startDate.plusDays(1);
                    lastDate = startDate; // Cập nhật ngày cuối cùng trong vòng lặp
                    startDate = startDate.plusDays(1);
                }
                int regisId = lastInsertId;
                Date firstDateSql = Date.valueOf(firstDate);
                Date lastDateSql = Date.valueOf(lastDate);
                System.out.println(firstDateSql);
                System.out.println(lastDateSql);
                regisRepo.updateDateRegisAndDateEnd(firstDateSql, lastDateSql, regisId);
            }

//            url = SUCCESS;
            if (method.equals("STUDIO")) {
                regisMember = (RegistrationMembership) request.getSession().getAttribute("RegistrationMembership");

                if (regisMember != null) {
                    int memId = Integer.parseInt(request.getParameter("memId"));
                    
                }
                url = PENDING_CHECKOUT;
                int courseId = Integer.parseInt(request.getParameter("id"));
                CourseRepository cr = new CourseRepository();
                Course c = cr.detail(courseId);
                int status = 2;
                boolean isActive = true;
                total = Float.parseFloat(request.getParameter("total"));
                int discount = 0;
                String sDiscount = request.getParameter("discountTotal");
                if (!sDiscount.isEmpty()) {
                    discount = Integer.parseInt(sDiscount);
                }
                order = new Bill(c, acc, status, isActive, total, discount, date, orderCode, method);
                HttpSession session = request.getSession();
                session.setAttribute("bill", order);
                request.getRequestDispatcher(url).forward(request, response);
                System.out.println(url);
            } else {
                long totalVnPay = (long) (total * 100);
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
        long amount = price * 23520;
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
