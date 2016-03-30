package com.eleme.mapper.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.eleme.mapper.TestMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class TestSelect {
  
  @Inject
  private TestMapper testMapper;
  
  @Test
  public void getCount(){
     int selectCount = testMapper.selectCount();
     System.out.println(selectCount);
  }
 
}
