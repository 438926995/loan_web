package com.eleme.service.product;

import java.util.List;

import com.eleme.domain.product.MFinanceProduct;

/**
 * 产品相关的service
 * @author huwenwen
 *
 */
public interface IProductService {
  
  List<MFinanceProduct> getProductInfo();
  
}
