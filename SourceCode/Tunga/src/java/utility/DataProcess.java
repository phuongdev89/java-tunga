/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.prefs.Preferences;
import org.ini4j.Ini;
import org.ini4j.IniPreferences;

/**
 *
 * @author notte
 */
public class DataProcess {

    public Connection getConnection() {
        Connection conn = null;
        try {
            Preferences database = this.readConfig("database");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://" + database.get("dbhost", null) + ":" + database.get("dbport", null) + ";databaseName=" + database.get("dbbname", null);
            conn = DriverManager.getConnection(url, database.get("dbuser", null), database.get("dbpass", null));
        } catch (ClassNotFoundException | SQLException ex) {
            return conn;
        }
        return conn;
    }

    public Preferences readConfig(String node) {
        Preferences pref = null;
        try {
            Ini ini = new Ini(new File(this.appPath() + "config/main.ini"));
            java.util.prefs.Preferences prefs = new IniPreferences(ini);
            pref = prefs.node(node);
        } catch (IOException ex) {
            return pref;
        }
        return pref;
    }

    public String appPath() {
        String reponsePath = "";
        try {
            String path = this.getClass().getClassLoader().getResource("").getPath();
            String fullPath = URLDecoder.decode(path, "UTF-8");
            String pathArr[] = fullPath.split("/WEB-INF/classes");
            fullPath = pathArr[0];
            reponsePath = new File(fullPath).getPath() + File.separatorChar;
        } catch (UnsupportedEncodingException ex) {
            return reponsePath;
        }
        return reponsePath;
    }
}