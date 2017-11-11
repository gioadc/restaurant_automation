/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import common.StastisticsDAO;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import sample.RES_OrderDetail.RES_OrderDetailDTO;

/**
 *
 * @author kysik
 */
public class ManagerAction {
    private String start;
    private String end;
    private String date;
    private Map data;
    private ArrayList<RES_OrderDetailDTO> listOrderDetail;
    private HashMap<String, String> dwString;
    
    
    public ManagerAction() {
    }
    
    public String execute() throws Exception {
        
        dwString = new HashMap<>();
        dwString.put("1", "Sunday");
        dwString.put("2", "Monday");
        dwString.put("3", "Tuesday");
        dwString.put("4", "Wednesday");
        dwString.put("5", "Thurday");
        dwString.put("6", "Friday");
        dwString.put("7", "Saturday");
        
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        
        if (start == null || start.trim().length() == 0) {
            cal.setTime(new Date());
            cal.set(Calendar.HOUR_OF_DAY, 0);
            cal.set(Calendar.MINUTE, 0);
            cal.set(Calendar.SECOND, 0);
            cal.add(Calendar.DAY_OF_MONTH, -1);
//            Date date = TimeHelper.getStartOfDay(cal.getTime());
            start = sdf.format(cal.getTime());
        } else {
            cal.setTime(sdf.parse(start));
        }
        long startDate = cal.getTimeInMillis();
        
        if (end == null || end.trim().length() == 0) {
            cal.setTime(new Date());
            cal.set(Calendar.HOUR_OF_DAY, 23);
            cal.set(Calendar.MINUTE, 59);
            cal.set(Calendar.SECOND, 59);
            cal.add(Calendar.DAY_OF_MONTH, -1);
//            Date date = TimeHelper.getEndOfDay(cal.getTime());
            end = sdf.format(cal.getTime());
        } else {
            cal.setTime(sdf.parse(end));
        }
        long endDate = cal.getTimeInMillis();
        
        Timestamp startTimestamp = new Timestamp(startDate);
        Timestamp endTimestamp = new Timestamp(endDate);
        StastisticsDAO dao = new StastisticsDAO();
        data = dao.getStastisticInTimeRange(startTimestamp, endTimestamp);
        listOrderDetail = dao.getFoodsInTimeRange(startTimestamp, endTimestamp);
        
        System.out.println("Data: " + data);
        
        return "success";
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Map getData() {
        return data;
    }

    public void setData(Map data) {
        this.data = data;
    }

    public ArrayList<RES_OrderDetailDTO> getListOrderDetail() {
        return listOrderDetail;
    }

    public void setListOrderDetail(ArrayList<RES_OrderDetailDTO> listOrderDetail) {
        this.listOrderDetail = listOrderDetail;
    }

    public HashMap<String, String> getDwString() {
        return dwString;
    }
    
}
