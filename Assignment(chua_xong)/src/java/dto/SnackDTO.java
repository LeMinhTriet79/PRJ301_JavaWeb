/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author frost
 */
public class SnackDTO {
    private String snackId;
    private String pictute;
    private String name;
    private String region;
    private String unit;
    private int price;
    
    public SnackDTO(){
        
    }

    public SnackDTO(String snackId, String pictute, String name, String region, String unit, int price) {
        this.snackId = snackId;
        this.pictute = pictute;
        this.name = name;
        this.region = region;
        this.unit = unit;
        this.price = price;
    }

    public String getSnackId() {
        return snackId;
    }

    public void setSnackId(String snackId) {
        this.snackId = snackId;
    }

    public String getPictute() {
        return pictute;
    }

    public void setPictute(String pictute) {
        this.pictute = pictute;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return snackId + ", " + pictute + ", " + name + ", " + region + ", " + unit + ", " + price;
    }
    
}
