package com.util;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Http {

    public JSONObject get(String url) throws IOException, ParseException {
        JSONParser parser = new JSONParser();
        HttpGet request = new HttpGet(url);
        String result = new String();
        try (
                CloseableHttpClient httpClient = HttpClients.createDefault();
                CloseableHttpResponse response = httpClient.execute(request))
        {
            HttpEntity entity = response.getEntity();
            if(entity != null) {
                result = EntityUtils.toString(entity);
            }
        }
        JSONObject response = (JSONObject) parser.parse(result);
        return response;
    }

}