package com.day2;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ContextListenerEx implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("리스너 시작해따~");
    }
  
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("리스너 끝나따~");
    }
}