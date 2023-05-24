package news.aggregator.processors.test;

import news.aggregator.flows.model.Member;
import news.aggregator.flows.service.MemberService;
import news.aggregator.processors.Application;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Collections;
import java.util.Objects;
import java.util.Optional;

@SpringBootTest(classes = { Application.class })
@TestMethodOrder(MethodOrderer.MethodName.class)
public class MemberServiceTest {

    private final MemberService service;

    @Autowired
    public MemberServiceTest(@Qualifier("memberService") final MemberService service) {
        this.service = service;
    }

    @Test
    void test01SaveMember() {
        this.service.dropTableContent();

        final Member member = new Member();
        member.setFirstName("First name");
        member.setLastName("Last name");
        member.setUsername("Username");
        member.setPassword("Password");
        member.setArticles(Collections.emptySet());

        final Member savedMember = this.service.saveMember(member);

        assert Objects.nonNull(savedMember);
        assert member.getUsername().equals(savedMember.getUsername());
        assert member.getFirstName().equals(savedMember.getFirstName());
        assert member.getLastName().equals(savedMember.getLastName());
        assert member.getPassword().equals(savedMember.getPassword());
        assert member.getArticles().size() == 0;
    }

    @Test
    void test02FindMember() {
        final Optional<Member> member = this.service.findMember("Username");
        assert member.isPresent();
    }

    @Test
    void test03Authenticate() {
        assert this.service.authenticate("Username", "Password");
        assert !this.service.authenticate("Username", "Invalid_password");
    }

}
