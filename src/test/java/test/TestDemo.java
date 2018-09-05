package test;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.druid.pool.DruidDataSource;

public class TestDemo {
	@Test
	public void testPool() {
	ApplicationContext ctx=
	new ClassPathXmlApplicationContext("applicationContext.xml");
	DruidDataSource dataSource=(DruidDataSource)ctx.getBean("dataSource");
	System.out.println(dataSource);
	Assert.assertNotEquals(dataSource, null);
	}
}
