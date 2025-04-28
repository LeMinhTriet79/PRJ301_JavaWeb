/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Administrator
 */
public class ToppingDTO {
    private int ToppingID;
    private String ToppingName;
    private double price ;

    public ToppingDTO() {
    }

    public ToppingDTO(int ToppingID, String ToppingName, double price) {
        this.ToppingID = ToppingID;
        this.ToppingName = ToppingName;
        this.price = price;
    }

    public int getToppingID() {
        return ToppingID;
    }

    public void setToppingID(int ToppingID) {
        this.ToppingID = ToppingID;
    }

    public String getToppingName() {
        return ToppingName;
    }

    public void setToppingName(String ToppingName) {
        this.ToppingName = ToppingName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
