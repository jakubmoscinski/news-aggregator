package news.aggregator.flows.service;

import news.aggregator.flows.model.Member;
import news.aggregator.flows.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Qualifier("memberService")
public class MemberService {

    private final MemberRepository repository;

    @Autowired
    public MemberService(@Qualifier("memberRepository") final MemberRepository repository) {
        this.repository = repository;
    }

    public Member saveMember(final Member member) {
        return this.repository.save(member);
    }

    public List<Member> findMembers() {
        return this.repository.findAll();
    }

}
