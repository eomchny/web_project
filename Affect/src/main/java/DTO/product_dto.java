package DTO;

public class product_dto {
	private String category;
	private int productNumber;
	private String productName;
	private int productPrice;
	private String productThumbnail;
	private String productIntro;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(int productNumber) {
		this.productNumber = productNumber;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductThumbnail() {
		return productThumbnail;
	}

	public void setProductThumbnail(String productThumbnail) {
		this.productThumbnail = productThumbnail;
	}

	public String getProductIntro() {
		return productIntro;
	}

	public void setProductIntro(String productIntro) {
		this.productIntro = productIntro;
	}

}
