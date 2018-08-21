package com.needmall.common.util;

import java.util.UUID;

public class Util {
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
