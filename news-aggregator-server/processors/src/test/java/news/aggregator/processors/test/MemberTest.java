package news.aggregator.processors.test;

import news.aggregator.flows.model.Member;
import news.aggregator.flows.service.MemberService;
import news.aggregator.processors.Application;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = { Application.class })
public class MemberTest {

    private final MemberService sevice;

    @Autowired
    public MemberTest(@Qualifier("memberService") final MemberService service) {
        this.sevice = service;
    }

    @Test
    void testService() {
        final Member member = new Member();
        member.setFirstName("First");
        member.setLastName("Last");

        this.sevice.saveMember(member);

        assert(this.sevice.findMembers().size() == 1);
    }

}
