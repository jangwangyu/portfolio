package com.portfolio.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.portfolio.DAO.MemberDAO;
import com.portfolio.VO.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class JUnitTest {
    @Inject
    private MemberDAO dao;
    
    @Test
    public void testConnection() throws Exception {
    	MemberVO userVO = new MemberVO();
    	
    	userVO.setMember_id("user");
    	userVO.setPasswd("user");
    	userVO.setName("user");
    	userVO.setEmail("user");
    	
    	dao.register(userVO);
        
    }
    
  
}
