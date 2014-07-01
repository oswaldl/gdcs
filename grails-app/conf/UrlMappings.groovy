class UrlMappings {

	static mappings = {
		
		"/$ctrl/js/$script" (controller:"AppDispatcher")
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"ShowResult",action:"index")
		"500"(view:'/error')
	}
}
