package PersonalGameLibraryManager.src;

import java.io.Serializable;
import java.lang.Double;
import java.time.LocalDate;
import java.util.List;

public class Game implements Serializable {
    // constants
    public static final List<String> ATTRIBUTES = List.of(
        "TITLE",
        "PLATFORM",
        "PRICE",
        "DATE",
        "TYPE",
        "IS_CLEARED",
        "DURATION",
        "RATING",
        "NOTE",
        "COVER_PATH",
        "COUNTDOWN",
        "IS_HIDDEN"
    );
    public static final int ATTRIBUTE_NUM = ATTRIBUTES.size();

    private String _title;
    private String _platform;
    private double _price;
    private LocalDate _date;
    private String _type;
    private boolean _isCleared;
    private double _duration;
    private double _rating;
    private String _note;
    private String _coverPath;
    private int _countdown;
    private boolean _isHidden;

    public Game() {
        _title = "";
        _platform = "";
        _price = 0.0;
        _date = LocalDate.now();
        _type = "";
        _isCleared = false;
        _duration = 0.0;
        _rating = 0.0;
        _note = "";
        _coverPath = "";
        _countdown = Integer.MAX_VALUE;
        _isHidden = false;
    }

    public Game(String[] row) {
        _title = row[0];
        _platform = row[1];
        _price = validPrice(Double.parseDouble(row[2]));
        _date = validLocalDate(LocalDate.parse(row[3]));
        _type = row[4];
        _isCleared = validIsCleared(row[5]);
        _duration = Double.parseDouble(row[6]);
        _rating = validRating(Double.parseDouble(row[7]));
        _note = row[8];
        _coverPath = row[9];
        _countdown = validCountdown(Integer.parseInt(row[10]));
        _isHidden = row[11].equals("y");
    }

    // validation functions
    private double validPrice(double price) {
        if (price < 0.0) {
            throw new IllegalArgumentException("价格不能为负数，当前价格：" + price);
        }
        return price; 
    }

    private LocalDate validLocalDate(LocalDate date) {
        LocalDate today = LocalDate.now();
        if (date.isAfter(today)) {
            throw new IllegalArgumentException("日期不能是未来，当前日期：" + date);
        }
        return date;
    }

    private boolean validIsCleared(String option) {
        if (!option.equals("y") && !option.equals("n")) {
            throw new IllegalArgumentException("对于“是否已通关”只能回答 y/n，当前回答：" + option);
        }
        return option.equals("y");
    }

    private double validRating(double rating) {
        if (rating < 0.0 || rating > 10.0) {
            throw new IllegalArgumentException("评分范围超出 0-10 的范围，当前评分：" + rating);
        }
        return rating;
    }

    private int validCountdown(int countdown) {
        if (countdown < 0) {
            throw new IllegalArgumentException("倒计时不得为负数，当前倒计时：" + countdown);
        }
        return countdown;
    }

    // setters
    public void addDuration(double delta) {
        _duration += delta;
    }

    public void setTitle(String title) {
        _title = title;
    }

    public void setPlatform(String platform) {
        _platform = platform;
    }

    public void setPrice(double price) {
        _price = validPrice(price);
    }

    public void setDate(LocalDate date) {
        _date = validLocalDate(date);
    }

    public void setType(String type) {
        _type = type;
    }

    public void setIsCleared(String option) {
        _isCleared = validIsCleared(option);
    }

    public void setDuration(double duration) {
        _duration = duration;
    }

    public void setRating(double rating) {
        _rating = validRating(rating);
    }

    public void setNote(String note) {
        _note = note;
    }

    public void setCoverPath(String coverPath) {
        _coverPath = coverPath;
    }

    public void setCountdown(int countdown) {
        _countdown = countdown;
    }

    public void setHiddenStatus(boolean isHidden) {
        _isHidden = isHidden;
    }

    // getters
    public String getTitle() {
        return _title;
    }

    public String getPlatform() {
        return _platform;
    }

    public String getType() {
        return _type;
    }

    public LocalDate getDate() {
        return _date;
    }

    public boolean getIsCleared() {
        return _isCleared;
    }

    public double getPrice() {
        return _price;
    }

    public double getDuration() {
        return _duration;
    }

    public double getRating() {
        return _rating;
    }

    public String getNote() {
        return _note;
    }

    public String getCoverPath() {
        return _coverPath;
    }

    public int getCountdown() {
        return _countdown;
    }

    public String[] getAttributes() {
        return new String[] {
            _title,
            _platform,
            String.valueOf(_price),
            _date.toString(),
            _type,
            (_isCleared) ? "y" : "n",
            String.valueOf(_duration),
            String.valueOf(_rating),
            _note,
            _coverPath,
            String.valueOf(_countdown),
            (_isHidden) ? "y" : "n",
        };
    }

    public boolean getHiddenStatus() {
        return _isHidden;
    }

    public String getCSVString() {
        return String.join(",", getAttributes());
    }
}
