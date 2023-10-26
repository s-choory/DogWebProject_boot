package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("Goods")
public class GoodsDTO {
	
	private int PRODUCTID;
    private String Category;
    private String PRODUCTNAME;
    private String Content;
    private int Price;
    private String Image;
    private int STOCKQUANTITY;
//    private String gCode;
//    private String gCategory;
//    private String gName;
//    private String gContent;
//    private int gPrice;
//    private String gImage;
	public GoodsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public GoodsDTO(int pRODUCTID) {
	super();
	PRODUCTID = pRODUCTID;
	}

	public GoodsDTO(int pRODUCTID, String category, String pRODUCTNAME, String content, int price, String image,
			int sTOCKQUANTITY) {
		super();
		PRODUCTID = pRODUCTID;
		Category = category;
		PRODUCTNAME = pRODUCTNAME;
		Content = content;
		Price = price;
		Image = image;
		STOCKQUANTITY = sTOCKQUANTITY;
	}
	public int getPRODUCTID() {
		return PRODUCTID;
	}
	public void setPRODUCTID(int pRODUCTID) {
		PRODUCTID = pRODUCTID;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public String getPRODUCTNAME() {
		return PRODUCTNAME;
	}
	public void setPRODUCTNAME(String pRODUCTNAME) {
		PRODUCTNAME = pRODUCTNAME;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public int getSTOCKQUANTITY() {
		return STOCKQUANTITY;
	}
	public void setSTOCKQUANTITY(int sTOCKQUANTITY) {
		STOCKQUANTITY = sTOCKQUANTITY;
	}
	@Override
	public String toString() {
		return "GoodsDTO [PRODUCTID=" + PRODUCTID + ", Category=" + Category + ", PRODUCTNAME=" + PRODUCTNAME
				+ ", Content=" + Content + ", Price=" + Price + ", Image=" + Image + ", STOCKQUANTITY=" + STOCKQUANTITY
				+ "]";
	}

   
    
    
}
