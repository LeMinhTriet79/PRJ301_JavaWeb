package DTO;

public class ProductDTO {
    private int productID;
    private String productName;
    private String image;
    private double price;
    private int categoryID; // Chỉ lưu ID của danh mục

    public ProductDTO() {
    }

    public ProductDTO(int productID, String productName, String image, double price, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.categoryID = categoryID;
    }

    // Getter và Setter
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
}
