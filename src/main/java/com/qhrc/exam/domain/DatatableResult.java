package com.qhrc.exam.domain;

import java.util.List;

public class DatatableResult<T> {
	private List<T> aaData;  
	private int iTotalDisplayRecords; 
	private int iTotalRecords; 
	private int sEcho;
	
	public List<T> getAaData() {
		return aaData;
	}
	public void setAaData(List<T> aaData) {
		this.aaData = aaData;
	}
	public int getITotalDisplayRecords() {
		return iTotalDisplayRecords;
	}
	public void setITotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}
	public int getITotalRecords() {
		return iTotalRecords;
	}
	public void setITotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}
	public int getSEcho() {
		return sEcho;
	}
	public void setSEcho(int sEcho) {
		this.sEcho = sEcho;
	}
	
}
