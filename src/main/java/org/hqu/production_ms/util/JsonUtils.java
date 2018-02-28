package org.hqu.production_ms.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hqu.production_ms.domain.OrderItem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 自定义响应结构
 */
public class JsonUtils {

	private static final Logger logger = LoggerFactory.getLogger(JsonUtils.class);

    // 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    /**
     * 将对象转换成json字符串。
     * <p>Title: pojoToJson</p>
     * <p>Description: </p>
     * @param data
     * @return
     */
    public static String objectToJson(Object data) {
    	try {
			String string = MAPPER.writeValueAsString(data);
			return string;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
    	return null;
    }
    
    /**
     * 将json结果集转化为对象
     * 
     * @param jsonData json数据
     * @param clazz 对象中的object类型
     * @return
     */
    public static <T> T jsonToPojo(String jsonData, Class<T> beanType) {
        try {
            T t = MAPPER.readValue(jsonData, beanType);
            return t;
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return null;
    }
    
    /**
     * 将json数据转换成pojo对象list
     * <p>Title: jsonToList</p>
     * <p>Description: </p>
     * @param jsonData
     * @param beanType
     * @return
     */
    public static <T>List<T> jsonToList(String jsonData, Class<T> beanType) {
    	JavaType javaType = MAPPER.getTypeFactory().constructParametricType(List.class, beanType);
    	try {
    		List<T> list = MAPPER.readValue(jsonData, javaType);
    		return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return null;
    }
    
    public static List<OrderItem> getOrderItems(String orderList) {
    	logger.info("OrderList is: " + orderList);
		String[] items = orderList.split(",");
		int length = items.length;
		List<OrderItem> productsList = new ArrayList<>();
		OrderItem item = null;
		for (int i = 0; i < length; i++) {			
			if (i % 4 == 0) {
				item = new OrderItem();
				item.setProductId(items[i]);				
			} else if (i % 4 == 1) {
				item.setUnit(items[i]);
			} else if (i % 4 == 2) {
				item.setQuantity(Integer.parseInt(items[i]));
			} else {
				item.setUnitPrice(new BigDecimal(items[i]));
				productsList.add(item);
			}
		}

		return productsList;
	}
    
}
