package com.yc.mogujie.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.mogujie.entity.Product;
import com.yc.mogujie.mapper.ProductMapper;
import com.yc.mogujie.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<Product> findAllProduct() {
		return productMapper.findAllProduct();
	}

}
