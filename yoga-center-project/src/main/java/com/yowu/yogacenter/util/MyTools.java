/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yowu.yogacenter.util;

import java.io.File;

/**
 *
 * @author ACER
 */
public class MyTools {
    public static void deleteFile(String filePath){
        File f = new File(filePath);
        if(f.exists()){
            f.delete();
        }
    }
}
