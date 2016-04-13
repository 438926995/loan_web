package com.eleme.service.product.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.eleme.domain.product.MFinanceProduct;
import com.eleme.mapper.product.ProductMapper;
import com.eleme.service.product.IProductService;

@Service
public class ProductServiceImpl implements IProductService {
  
  @Inject
  private ProductMapper productMapper;
  
  @Override
  public List<MFinanceProduct> getProductInfo() {
    List<MFinanceProduct> productList = productMapper.selectProductList();
    for(MFinanceProduct pro : productList){
      pro.setProductRuleList(productMapper.selectProductRuleByFpId(pro.getFpId()));
    }
    return productList;
  }

}
