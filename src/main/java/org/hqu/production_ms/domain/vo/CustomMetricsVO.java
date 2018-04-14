package org.hqu.production_ms.domain.vo;

import java.math.BigDecimal;

public class CustomMetricsVO {

	private BigDecimal sumOfMoney;

	private int monthName;

	private int year;

	private String productId;

	private String customName;

	private int quantity;

	public BigDecimal getSumOfMoney() {
		return sumOfMoney;
	}

	public void setSumOfMoney(BigDecimal sumOfMoney) {
		this.sumOfMoney = sumOfMoney;
	}

	public int getMonthName() {
		return monthName;
	}

	public void setMonthName(int monthName) {
		this.monthName = monthName;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getCustomName() {
		return customName;
	}

	public void setCustomName(String customame) {
		this.customName = customame;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
