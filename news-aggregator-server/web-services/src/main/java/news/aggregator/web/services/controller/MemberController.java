package news.aggregator.web.services.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import news.aggregator.flows.model.Member;
import news.aggregator.flows.model.UserAuthentication;
import news.aggregator.flows.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;

@RestController
@RequestMapping("/member")
@Tag(name = "Member resource", description = "Member controller")
public class MemberController {
    private static final Logger LOG = LoggerFactory.getLogger(MemberController.class);

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

    @Operation(summary = "Authenticate")
    @PostMapping(value = "/authenticate", produces = {MediaType.APPLICATION_JSON_VALUE})
    public void authenticate(@RequestBody final UserAuthentication authentication) {
        LOG.info("Authentication request");
    }

}
