package news.aggregator.web.services.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import news.aggregator.flows.model.Member;
import news.aggregator.flows.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

@RestController
@RequestMapping("/member")
@Tag(name = "Member resource", description = "Member controller")
public class MemberController {
    private final MemberService service;

    @Autowired
    public MemberController(@Qualifier("memberService") final MemberService service) {
        this.service = service;
    }

    @Operation(summary = "List members")
    @GetMapping(value = "/list", produces = { MediaType.APPLICATION_JSON_VALUE} )
    public Flux<Member> list() {
        return Flux.fromIterable(this.service.findMembers());
    }

}
