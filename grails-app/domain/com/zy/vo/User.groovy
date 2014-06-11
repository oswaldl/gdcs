package com.zy.vo

class User {
	
	String username
	String password

    static constraints = {
		username blank: false, unique: true
		password blank: false
    }
}
