package com.java.Upskilling.repositories;

import com.java.Upskilling.models.HelloModel;

public class HelloRepository {
    public HelloModel get(String id) {
        HelloModel helloModel = new HelloModel();

        helloModel.setAge(id);
        helloModel.setName("Jenna Stones");

        return helloModel;
    }
}
