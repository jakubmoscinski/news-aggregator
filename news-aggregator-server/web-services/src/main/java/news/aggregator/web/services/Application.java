package news.aggregator.web.services;

import news.aggregator.flows.model.Member;
import news.aggregator.flows.repository.MemberRepository;
import news.aggregator.flows.service.MemberService;
import news.aggregator.web.services.controller.MemberController;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@EntityScan(basePackageClasses = Member.class)
@EnableJpaRepositories(basePackageClasses = MemberRepository.class) //todo may not be needed in future
@SpringBootApplication(scanBasePackageClasses = { Member.class, /*MemberRepository.class, */MemberService.class, MemberController.class})
public class Application extends SpringBootServletInitializer {

}
