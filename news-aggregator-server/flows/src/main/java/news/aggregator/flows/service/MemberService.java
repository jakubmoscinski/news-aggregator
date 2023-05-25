package news.aggregator.flows.service;

import news.aggregator.flows.model.Member;
import news.aggregator.flows.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * Wrapper for MemberRepository - provides additional business logic. Persistence layer access point
 */

@Service
@Qualifier("memberService")
public class MemberService {

    private final MemberRepository repository;

    @Autowired
    public MemberService(final MemberRepository repository) {
        this.repository = repository;
    }

    public Member saveMember(final Member member) {
        return this.repository.save(member);
    }

    public Optional<Member> findMember(final String username) { return this.repository.getMemberByUsername(username); }

    /**
     * @param username Username text value
     * @param password Password text value
     * @return Value telling if user with a given id and password does exist
     */
    public boolean authenticate(final String username, final String password) {
        final Optional<Member> member = this.repository.getMemberByUsername(username);

        return member.map(value -> value.getPassword().equals(password)).orElse(false);
    }

    /**
     * Test purpose only
     */
    public void dropTableContent() {
        this.repository.deleteAll();
    }

}
