package com.coi.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DackleOrders {

	private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "gsm")
    private Double gsm;

    @Column(name = "partyName")
    private String partyName;

    @Column(name = "width")
    private double width;
    
    @Column(name = "length")
    private double length;

    @Column(name = "orderQty")
    private Double orderQty;

    @Column(name = "priority")
    private Integer priority;

    @Column(name = "papertype")
    private Integer papertype;
    
    @Column(name = "ordDate")
    private Date ordDate ;
    
    
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getGsm() {
        return gsm;
    }

    public void setGsm(Double gsm) {
        this.gsm = gsm;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public Double getQuantity() {
        return orderQty;
    }

    public void setQuantity(Double quantity) {
        this.orderQty = quantity;
    }

	public double getWidth() {
		return width;
	}

	public void setWidth(double width) {
		this.width = width;
	}

	public double getLength() {
		return length;
	}

	public void setLength(double length) {
		this.length = length;
	}

	public Double getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(Double orderQty) {
		this.orderQty = orderQty;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Integer getPapertype() {
		return papertype;
	}

	public void setPapertype(Integer papertype) {
		this.papertype = papertype;
	}

	public Date getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}
	
}