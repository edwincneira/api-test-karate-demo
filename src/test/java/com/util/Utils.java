package com.util;

import java.util.Map;

public class Utils {

    private String data;

    public Utils() {

    }

    public Boolean contain(String message, String character) {
        if(message.contains(character)){
            return true;
        } else {
            return false;
        }
    }
}
