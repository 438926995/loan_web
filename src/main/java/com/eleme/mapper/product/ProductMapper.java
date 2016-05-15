package com.eleme.mapper.product;

import java.util.List;

import com.eleme.domain.product.MFinanceProduct;
import com.eleme.domain.product.ProductRule;

public interface ProductMapper {
  
  public List<MFinanceProduct> selectProductList();
  
  public List<ProductRule> selectProductRuleByFpId(Integer fpId);
  
  public MFinanceProduct getProductInfoByFpId(Integer fpId);

}
