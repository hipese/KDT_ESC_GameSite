package dto;

import java.sql.Date;

public class WeekCounts {
    private Date date;
    private int value;

    public WeekCounts() {
        // 기본 생성자
    }

    public WeekCounts(Date date, int value) {
        this.date = date;
        this.value = value;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
