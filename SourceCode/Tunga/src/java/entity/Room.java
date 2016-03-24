/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import model.TableModel;

/**
 *
 * @author Hoangha.FPT
 */
public class Room {

    private int id;
    private String name;
    private boolean type;

    public Room(int id, String name, boolean type) {
        this.id = id;
        this.name = name;
        this.type = type;
    }

    public Room(String name, boolean type) {
        this.name = name;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean getType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public List<Table> getTables() {
        return TableModel.findAll("roomId = " + this.id);
    }

    public List<Table> getFreeTables(Book book) throws ParseException {
        String datetime = book.getDate() + " " + book.getTime();
        DateFormat df = DateFormat.getDateInstance(DateFormat.DEFAULT, Locale.US);
        Date date = df.parse(datetime);
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return TableModel.findAll();
        //TODO cần thực hiện việc join bảng và search trong vòng 6 tiếng
    }
}
