package filters

class AuthSecurityFilters {

    def springSecurityService

    def filters = {
        all(controller:'login'/*, action:'*'*/, invert:true) {
            before = {
				def user=springSecurityService.getCurrentUser()
				if(!user){
					// Anonymous
					//redirect之前，记录targetURI的值
					//def targetURI = request.forwardURI - request.contextPath
					//forward(controller:'login',params: [targetURI: targetURI])
					//println targetURI
					forward(controller:'login',params: params)
					return false;// return false to interrupt
				}else{
					// Logged in
				}
				return true;
            }
            after = { Map model ->
				//println "i wanna see the model"

            }
            afterView = { Exception e ->

            }
        }
    }
}
