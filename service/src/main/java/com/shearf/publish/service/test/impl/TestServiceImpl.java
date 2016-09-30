package com.shearf.publish.service.test.impl;

import com.shearf.publish.service.test.TestService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by xiahaihu2009@gmail on 16/8/30.
 */
@Service
public class TestServiceImpl implements TestService {

    private Map<String, String> map = new HashMap<>();

    @Override
    public Map<String, String> setMap(String key, String value) {
        map.put(key, value);
        return map;
    }

    @Override
    public String getMapValue(String key) {
        return map.get(key);
    }
}
