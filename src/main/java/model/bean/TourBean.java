package model.bean;

public class TourBean {
    private int id;
    private String name;
    private String description;
    private double price;
    private String startDate;
    private int capacity;      // Tổng số chỗ
    private int bookedCount;   // Số chỗ đã đặt (Tính toán từ DB)
    private String imageURL;

    public TourBean() {}

    public TourBean(int id, String name, String description, double price, String startDate, int capacity, int bookedCount,String imageURL) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.startDate = startDate;
        this.capacity = capacity;
        this.bookedCount = bookedCount;
        this.imageURL = imageURL;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }
    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }
    public int getBookedCount() { return bookedCount; }
    public void setBookedCount(int bookedCount) { this.bookedCount = bookedCount; }
    
    // Helper để tính số chỗ còn lại
    public int getAvailableSlots() {
        return capacity - bookedCount;
    }

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
}