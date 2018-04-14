package org.hqu.production_ms.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.Size;

public class COrder {

	@Size(max=40, message="{id.length.error}")
	private String orderId;

    private Date orderDate;

    private Date requestDate;
    
    @Size(max=5000, message="{note.length.error}")
    private String note;

    private BigDecimal totalMoney;
    
    private String orderList;  

	private String image;

    private String file;

    private Integer status;
    
    private Byte paymentType;

	private Boolean delivery;
    
    public Boolean getDelivery() {
        return delivery;
    }

    public void setDelivery(Boolean delivery) {
        this.delivery = delivery;
    }
    
    @Size(max=40, message="{id.length.error}")
    private String customId;




    public String getOrderList() {
		return orderList;
	}

	public void setOrderList(String orderList) {
		this.orderList = orderList;
	}

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
	
    public Byte getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Byte paymentType) {
        this.paymentType = paymentType;
    }

}