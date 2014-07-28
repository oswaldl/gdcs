import com.zy.auth.User
import com.zy.vo.Gene
import com.zy.vo.Illness
import com.zy.vo.IllnessCat
import com.zy.vo.RiskRank
import com.zy.vo.SNPRelation

class BootStrap {
	def springSecurityService
    def init = { servletContext ->
		IllnessCat illnessCat=new IllnessCat(name:"默认分类");
		illnessCat.save(failOnError:true)
		RiskRank riskRank=new RiskRank(high:5,low:-5);
		riskRank.save(failOnError:true)
		
		Illness illness=new Illness(name:"心房颤动",averageRisk:"0.2",illnessCat:illnessCat,description:"心房纤维性颤动的特点是心脏内的混乱电信号引起上心室颤动（心房）。");
		illness.save(failOnError:true)
//		Gene gene=new Gene(name:"rs10757278(A;A)",repute:"good",description1:"0.78x reduced risk for Coronary Heart Disease.",description2:"0.77x reduced risk for Brain Aneurysm and Abdominal Aortic Aneurysm.");
//		gene.save(failOnError:true)
		def user = User.findByUsername('mike') ?: new User(
			username: 'mike',
			chineseName: '迈克',
			password: 'mike',
			enabled: true).save(failOnError: true)
		def admin = User.findByUsername('admin') ?: new User(
			username: 'admin',
			chineseName: '管理员',
			password: 'admin',
			isAdmin: true,
			enabled: true).save(failOnError: true)
//		SNPRelation relation=new SNPRelation(user:user,gene:gene,illness:illness,oddRatio:"1.9");
//		relation.save(failOnError:true)
		
    }
    def destroy = {
    }
}
