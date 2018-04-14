package org.hqu.production_ms.domain.vo;

import java.math.BigDecimal;

public class OrderMetricsVO {
	
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

	private BigDecimal sumOfMoney;
	
	private int monthName;
	
	private int year;

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

}
