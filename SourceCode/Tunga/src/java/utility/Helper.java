/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.prefs.Preferences;
import org.ini4j.Ini;
import org.ini4j.IniPreferences;

/**
 *
 * @author MyPC
 */
public class Helper {

    public static String baseUrl() {
        Preferences pref = readConfig("app");
        return pref.get("baseurl", null);
    }

    public static String currency(float number) {
        Locale locale = Locale.US;
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
        return numberFormat.format(number);
    }

    public static Preferences readConfig(String node) {
        Preferences pref = null;
        try {
            Ini ini = new Ini(new File(appPath() + "config/main.ini"));
            java.util.prefs.Preferences prefs = new IniPreferences(ini);
            pref = prefs.node(node);
        } catch (IOException ex) {
            Logger.getLogger(Helper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pref;
    }

    public static String appPath() {
        String reponsePath = "";
        try {
            String path = Helper.class.getResource("").getPath();
            String fullPath = URLDecoder.decode(path, "UTF-8");
            String pathArr[] = fullPath.split("/WEB-INF/classes");
            fullPath = pathArr[0];
            reponsePath = new File(fullPath).getPath() + File.separatorChar;
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(Helper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reponsePath;
    }
}
