package org.hqu.production_ms.domain.vo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hqu.production_ms.domain.Custom;
import org.hqu.production_ms.domain.OrderItem;
import org.hqu.production_ms.domain.Product;

public class COrderVO {
    private String orderId;

    private Date orderDate;

    private Date requestDate;

    private String note;   

    private String image;

    private String file;

    private Integer status;
    
    private Custom custom;

    private Product product;

    private BigDecimal totalMoney;
    
    private Byte paymentType;
    
	private Boolean delivery;
    
    public Boolean getDelivery() {
        return delivery==null?false:delivery;
    }

    public void setDelivery(Boolean delivery) {
        this.delivery = delivery;
    }
    
    public Byte getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(Byte paymentType) {
		this.paymentType = paymentType;
	}

	public Custom getCustom() {
		return custom;
	}

	public void setCustom(Custom custom) {
		this.custom = custom;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	private String customId;


    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
    
    public BigDecimal getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(BigDecimal totalMoney) {
		this.totalMoney = totalMoney;
	}

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file == null ? null : file.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

	public String getCustomId() {
		return customId;
	}

	public void setCustomId(String customId) {
		this.customId = customId;
	}


	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}


}