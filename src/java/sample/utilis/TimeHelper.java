/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utilis;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

/**
 *
 * @author kysik
 */
public class TimeHelper {

    public static Date getEndOfDay(Date date) {
        LocalDateTime localDateTime = dateToLocalDateTime(date);
        LocalDateTime endOfDay = localDateTime.with(LocalDateTime.MAX);
        return localDateTimeToDate(endOfDay);
    }

    public static Date getStartOfDay(Date date) {
        LocalDateTime localDateTime = dateToLocalDateTime(date);
        // LocalDateTime startOfDay = localDateTime.with(LocalTime.MIN);
        LocalDateTime startOfDay = localDateTime.with(LocalDateTime.MIN);
        return localDateTimeToDate(startOfDay);
    }

    private static Date localDateTimeToDate(LocalDateTime day) {
//        return Date.from(startOfDay.atZone(ZoneId.systemDefault()).toInstant());
        return new Date(day.atZone(ZoneId.systemDefault()).toEpochSecond());
    }

    private static LocalDateTime dateToLocalDateTime(Date date) {
        return LocalDateTime.ofInstant(Instant.now().ofEpochMilli(date.getTime()), ZoneId.systemDefault());
    }
}
