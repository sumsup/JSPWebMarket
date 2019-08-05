package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	private static ProductRepository instance = new ProductRepository();
	// 싱글턴으로 이용하기 위해 static으로 변수를 선언함.
	
	// form Object를 이용해서 새로운 제품을 제품 배열인 listOfProducts에 추가.
	public void addProduct(Product product) {
		
		listOfProducts.add(product);
	}
	
	// 제품 인스턴스를 반환. static으로 싱글턴.
	public static ProductRepository getInstance() {
		return instance;
	}
	
	// 제품 정보를 등록.
	public ProductRepository() {
		
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Retina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.jpg");
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS display, 5rd Generation Intel Core processors");
		notebook.setManufacturer("LG");
		notebook.setCategory("GRAM Book");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.jpg");
				
		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, OctaCore processor");
		tablet.setCategory("Galaxy Tab");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.jpg");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		
	}
	
	public ArrayList<Product> getAllProducts() {
		
		return listOfProducts;
		
	}
	
	// Id 값에 해당하는 Product 객체를 반환.
	public Product getProductById(String productId) {
		
		Product productById = null;
		
		for (int i = 0; i < listOfProducts.size(); i++) { // 리스트에서 product를 검색.
			
			Product product = listOfProducts.get(i); // 하나씩.
			
			// id 값과 일치하는 product를 찾으면
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				
				productById = product; // 프로덕트를 대입.
				break;
				
			}
			
		}
		
		return productById;
		
	}

}