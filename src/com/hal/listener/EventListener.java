package com.hal.listener;

public interface EventListener<T> {
	boolean exists(String text);
	T selectData(String text);
}
