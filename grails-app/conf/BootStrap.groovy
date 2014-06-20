import com.zy.vo.Gene
import com.zy.vo.Illness;
import com.zy.vo.SNPRelation;
import com.zy.vo.User;

class BootStrap {

    def init = { servletContext ->
		Illness illness=new Illness(name:"心房颤动",description:"心房纤维性颤动的特点是心脏内的混乱电信号引起上心室颤动（心房）。");
		illness.save(failOnError:true)
		Gene gene=new Gene(name:"rs10757278(A;A)",description1:"0.78x reduced risk for Coronary Heart Disease.",description2:"0.77x reduced risk for Brain Aneurysm and Abdominal Aortic Aneurysm.");
		gene.save(failOnError:true)
		User user=new User(username:"mike",password:"mike");
		user.save(failOnError:true)
		SNPRelation relation=new SNPRelation(user:user,gene:gene,illness:illness);
		relation.save(failOnError:true)
		
    }
    def destroy = {
    }
}
