package com.shearf.publish.service.test;

import java.util.Map;

/**
 * Created by xiahaihu2009@gmail on 16/8/30.
 */
public interface TestService {

    Map<String, String> setMap(String key, String value);

    String getMapValue(String key);

}
