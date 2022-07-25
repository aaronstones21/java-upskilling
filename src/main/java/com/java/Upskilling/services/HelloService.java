package com.java.Upskilling.services;

import org.springframework.stereotype.Service;

import com.java.Upskilling.models.HelloModel;
import com.java.Upskilling.repositories.HelloRepository;

@Service
public class HelloService {

    private HelloRepository helloRepository = new HelloRepository();

    public HelloModel get(String id) {
        return helloRepository.get(id);
    }
}
