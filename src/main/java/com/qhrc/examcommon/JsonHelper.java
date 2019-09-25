package com.qhrc.examcommon;

import java.util.HashMap;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class JsonHelper {
	public static HashMap<String, String> JsonStrToHashMap(String jsonStr){
		JSONArray jsonArray = JSONArray.parseArray(jsonStr);
        HashMap<String, String> hashMap = new HashMap<String, String>();
        for(int i=0; i < jsonArray.size(); i++){
            JSONObject jsonObj = jsonArray.getJSONObject(i);
            hashMap.put(jsonObj.getString("name"), jsonObj.getString("value"));
        }
        return hashMap;
	}
}
