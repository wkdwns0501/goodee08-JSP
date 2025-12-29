package ch04.com.dao;

public class GuGuDan {
    public String process(int dan) {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 9; i++) {
            sb.append(dan)
              .append(" x ")
              .append(i)
              .append(" = ")
              .append(dan * i)
              .append("<br>");
        }
        return sb.toString();
    }
}
