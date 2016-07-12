package com.obob.support.db;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * DAO update 返回0时抛出runtime异常
 * 
 * @author peng.liu
 * 2015年11月17日 下午6:03:20
 */
@Documented
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface NoRowAffectException {

}
