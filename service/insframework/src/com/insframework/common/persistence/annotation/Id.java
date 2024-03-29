package com.insframework.common.persistence.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.insframework.common.persistence.constant.SQL_CONSTANT.ID_STRATEGY;



@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Id {
	
	ID_STRATEGY strategy() default ID_STRATEGY.UUID;
	
}
