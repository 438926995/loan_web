# loan_web
springmvc + maven + mybatis + jsp

遇到的问题：
1.项目加入jackson 相关包导致无法读取jackson 和spring相关的包
2.配置项目welcome输入根目录404
3.idea中对应xml等文件不能自动发布到target目录下,导致找不到对应的xml方法
报org.apache.ibatis.binding.BindingException Invalid bound statement (not found)

问题解决方法:
1.jackson包引入需要commons相关包
3.pom.xml 中加入
<resource>
    <directory>src/main/java</directory>
    <filtering>true</filtering>
    <includes>
        <include>**/*.properties</include>
        <include>**/*.xml</include>
        <include>**/*.etpl</include>
    </includes>
</resource>
