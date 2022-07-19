package com.java.Upskilling.services;

import org.springframework.stereotype.Service;

import com.java.Upskilling.models.HelloModel;
import com.java.Upskilling.repositories.HelloRepository;

@Service
public class HelloService {
    public HelloModel get(String id) {
        HelloRepository helloRepository = new HelloRepository();
        return helloRepository.get(id);
    }
}
