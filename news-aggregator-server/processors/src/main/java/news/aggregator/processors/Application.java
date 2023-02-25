package news.aggregator.processors;

import news.aggregator.flows.model.Member;
import news.aggregator.flows.repository.MemberRepository;
import news.aggregator.flows.service.MemberService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@EnableJpaRepositories(basePackageClasses = MemberRepository.class)
@EntityScan(basePackageClasses = Member.class)
@PropertySource({ "classpath:application.properties" })
@SpringBootApplication(scanBasePackageClasses = { MemberService.class, Member.class })
public class Application {

    public static void main(final String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
