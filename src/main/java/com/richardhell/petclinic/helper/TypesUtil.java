package com.richardhell.petclinic.helper;

import org.apache.commons.lang3.StringUtils;

public class TypesUtil {

    public static Long getDefaultLong(Object objValue) {
        if (objValue instanceof java.lang.Long) {
            return (Long) objValue;
        }
        try {
            if (objValue != null && StringUtils.isNotBlank(objValue.toString()) && !objValue.toString().equals("null")) {
                return Long.valueOf(objValue.toString());
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }

}
