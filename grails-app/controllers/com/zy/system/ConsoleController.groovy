package com.zy.system

import com.zy.auth.User;

class ConsoleController {
	def springSecurityService
    def index() {
		User user=springSecurityService.getCurrentUser()
		if(!user.isAdmin){
			redirect(controller:"showResult",action:"index")
			return 
		}
	}
}
