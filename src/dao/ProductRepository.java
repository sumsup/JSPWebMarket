package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	public ProductRepository() {
		
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Retina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS display, 5rd Generation Intel Core processors");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
				
		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, OctaCore processor");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		
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