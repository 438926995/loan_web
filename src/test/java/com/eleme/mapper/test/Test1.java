package com.eleme.mapper.test;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Test1 {
  
  public static void main(String[] args) {
    String resource = "dbconf.xml";
    InputStream in = Test1.class.getClassLoader().getResourceAsStream(resource);
    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(in);
    SqlSession session = ssf.openSession();
    String statement = "com.eleme.mapper.TestMapper.selectCount";
    Integer count = session.selectOne(statement, 1);
    System.out.println(count);
  }

}
