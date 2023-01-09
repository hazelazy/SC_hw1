package org.apache.dubbo.springboot.demo;

import java.util.concurrent.CompletableFuture;

public interface PeopleService {
    String sayHello(String name);

    default CompletableFuture<String> sayHelloAsync(String name) {
        return CompletableFuture.completedFuture(sayHello(name));
    }

}

