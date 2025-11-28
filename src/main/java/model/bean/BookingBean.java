package model.bean;

public class BookingBean {
    private int id;
    private int tourId;
    private int customerId;
    private String bookingDate;
    private String status;
    
    // Các trường hiển thị thêm (để Admin xem thống kê)
    private String tourName;
    private double tourPrice;
    private String customerName;
    private String customerPhone;

    public BookingBean() {}

    public BookingBean(int id, int tourId, int customerId, String bookingDate, String status) {
        this.id = id;
        this.tourId = tourId;
        this.customerId = customerId;
        this.bookingDate = bookingDate;
        this.status = status;
    }

    // Getters và Setters gốc
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getTourId() { return tourId; }
    public void setTourId(int tourId) { this.tourId = tourId; }
    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    public String getBookingDate() { return bookingDate; }
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    // Getters và Setters mở rộng (cho việc hiển thị)
    public String getTourName() { return tourName; }
    public void setTourName(String tourName) { this.tourName = tourName; }
    public double getTourPrice() { return tourPrice; }
    public void setTourPrice(double tourPrice) { this.tourPrice = tourPrice; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public String getCustomerPhone() { return customerPhone; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }
}