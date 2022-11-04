package com.meaningfarm.mall;
import java.sql.Connection;
import java.sql.DriverManager;
 
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class OracleConnectionTest {
    //�α��� ���� ���� ����
    private static final Logger logger=
            LoggerFactory.getLogger(OracleConnectionTest.class);
    private static final String DRIVER
    ="oracle.jdbc.driver.OracleDriver";
    //���Ṯ�ڿ� jdbc:oracle:thin:@ȣ��Ʈ:��Ʈ:sid
    private static final String URL
    ="jdbc:oracle:thin:@localhost:1521:orcl11";
    private static final String USER="MEANINGFARM";//���̵�
    private static final String PW="tiger";//
    
    @Test//Junit�� �׽�Ʈ�ϴ� �޼ҵ�
    public void test() throws ClassNotFoundException {
        Class.forName(DRIVER);//jdbc ����̹� �ε�
        
        //��ȣ�ȿ� ���ҽ� �ڵ� ���� 
        try(Connection conn=DriverManager.getConnection(URL, USER, PW)){
            logger.info("����Ŭ�� ����Ǿ����ϴ�");
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
 
}
 