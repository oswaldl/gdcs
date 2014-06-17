package com.zy.vo

class ShowResultController {

    def index() { }
	
	def show(){
		User user=User.findByUsername(params.username)
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
		[user:user,illnesses:illnesses,map:map]
	}
	
	def showIllnessByGene(){
		Gene gene=Gene.get(params.id)
		def illnesses=SNPRelation.findAllByGene(Gene).collect {
			it.illness
		}.toSet()
		[gene:gene,illnesses:illnesses]
	}
	
	def show
	
	
}
