/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class DBHelpler implements Serializable {

    public static Connection makeConnection() throws ClassNotFoundException, SQLException {
        //1. Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create url connection string ==> DB Address
        String url = "jdbc:sqlserver://localhost:1433;"
                + "user=sa;password=12345;databaseName=YogaCenterDB;encrypt=false";
        //3. Open Connection 
        Connection con = DriverManager.getConnection(url, "sa", "12345");

        return con;
    }
}
