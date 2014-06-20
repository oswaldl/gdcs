package com.zy.vo

class ShowResultController {

    def index() { 
		redirect(action: "show", params: [username:'mike'])
	}
	
	def show(){
		def username=params.username
		User user=User.findByUsername(username)
		def illnesses=SNPRelation.findAllByUser(user).collect {
			it.illness
		}.toSet()
		Map map=new HashMap<Illness, List>()
		illnesses.each {illness->
			def genes=SNPRelation.findAllByUserAndIllness(user,illness).collect {
				it.gene
			}
			map.put(illness, genes);
		}
		[user:user,illnesses:illnesses,map:map,initialValue:params.myeditor]
	}
	
	def showIllnessByGene(){
		Gene gene=Gene.get(params.id)
		def illnesses=SNPRelation.findAllByGene(gene).collect {
			it.illness
		}.toSet()
		[gene:gene,illnesses:illnesses]
	}
	
	def editDesc(){
		Illness illness=Illness.get(params.illnessId)
		[illness:illness,username:params.username]
	}
	
	def saveDesc(){
		Illness illness=Illness.get(params.illnessId)
		illness.description=params.description
		illness.save(failOnError:true)
		redirect(action: "show", params: [username:params.username])
	}
//
}
