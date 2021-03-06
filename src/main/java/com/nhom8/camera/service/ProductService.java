package com.nhom8.camera.service;

import com.nhom8.camera.entity.Product;
import com.nhom8.camera.model.request.CreateProductRequest;
import com.nhom8.camera.model.request.UpdateProductRequest;
import com.nhom8.camera.model.response.ProductResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService {
    Product getSingleProductById(Long id);

    List<Product> getListProduct(int limit, int offset);

    List<Product> getListProductByBrandId(Long id, int limit, int offset);

    int getCount();

    List<Product> search(String searchValue, int limit, int offset);

    void createProduct(CreateProductRequest createProductRequest, String productImage, String createBy);

    void updateProduct(Product product, UpdateProductRequest updateProductRequest, String productImage, String updateBy, Long id);

    boolean deleteProduct(Product product);

    boolean productNameValid(String productName);
}
