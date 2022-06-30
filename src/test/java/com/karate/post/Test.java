package com.karate.post;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

public class Test {

    @org.junit.jupiter.api.Test
    void testAll() {
        Results results = Runner.parallel(getClass(), 5);
    }
}
