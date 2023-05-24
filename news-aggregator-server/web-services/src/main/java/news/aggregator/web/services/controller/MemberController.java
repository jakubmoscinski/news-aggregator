package news.aggregator.web.services.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import news.aggregator.flows.model.Article;
import news.aggregator.flows.model.Member;
import news.aggregator.flows.service.ArticleService;
import news.aggregator.flows.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.Collections;
import java.util.Comparator;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/member")
@Tag(name = "Member resource", description = "Member controller")
public class MemberController {
    private final MemberService memberService;
    private final ArticleService articleService;

    @Autowired
    public MemberController(@Qualifier("memberService") final MemberService memberService,
                            @Qualifier("articleService") final ArticleService articleService) {
        this.memberService = memberService;
        this.articleService = articleService;
    }

    @Operation(summary = "Authenticate")
    @GetMapping(value = "/authenticate/{username}/{password}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public final Mono<Boolean> authenticate(
            @PathVariable("username") @Parameter(description = "Specifies username", required = true) final String username,
            @PathVariable("password") @Parameter(description = "Specifies password", required = true) final String password) {
        return Mono.justOrEmpty(this.memberService.authenticate(username, password));
    }

    @Operation(summary = "Create user")
    @GetMapping(value = "/new-user/{first-name}/{last-name}/{username}/{password}", produces = { MediaType.APPLICATION_JSON_VALUE } )
    public Mono<Member> create(
            @PathVariable("first-name") @Parameter(description = "Specifies first name", required = true) final String firstName,
            @PathVariable("last-name") @Parameter(description = "Specifies last name", required = true) final String lastName,
            @PathVariable("username") @Parameter(description = "Specifies username", required = true) final String username,
            @PathVariable("password") @Parameter(description = "Specifies password", required = true) final String password
    ) {
        return Mono.justOrEmpty(this.memberService.saveMember(new Member(firstName, lastName, username, password)));
    }

    @Operation(summary = "Add favourite")
    @GetMapping(value = "/add-favorite/{username}/{article-id}", produces = { MediaType.APPLICATION_JSON_VALUE } )
    public Mono<Member> addFavourite(@PathVariable("username") @Parameter(description = "Specifies user name", required = true) final String username,
                                     @PathVariable("article-id") @Parameter(description = "Specifies aricle id", required = true) final long articleId) {
        final Optional<Article> articleOptional = this.articleService.findArticleById(articleId);
        final Optional<Member> memberOptional = this.memberService.findMember(username);

        if (articleOptional.isPresent() && memberOptional.isPresent()) {
            final Member member = memberOptional.get();

            if(member.getArticles().stream().anyMatch(a -> a.getId().equals(articleId))) {
                member.getArticles().remove(articleOptional.get());
            } else {
                member.getArticles().add(articleOptional.get());
            }

            return Mono.justOrEmpty(this.memberService.saveMember(member));
        }

        return Mono.empty();
    }

    @Operation(summary = "Is favorite")
    @GetMapping(value = "/is-favorite/{username}/{article-id}", produces = { MediaType.APPLICATION_JSON_VALUE } )
    public Mono<Boolean> isFavourite(@PathVariable("username") @Parameter(description = "Specifies user name", required = true) final String username,
                                      @PathVariable("article-id") @Parameter(description = "Specifies aricle id", required = true) final Long articleId) {
        final Optional<Member> memberOptional = this.memberService.findMember(username);

        if (memberOptional.isPresent()) {
            return Mono.just(memberOptional.get().getArticles().stream().anyMatch(a -> a.getId().equals(articleId)));
        } else {
            return Mono.just(Boolean.FALSE);
        }
    }

    @Operation(summary = "List bookmarked service")
    @GetMapping(value = "/bookmarks/{username}", produces = { MediaType.APPLICATION_JSON_VALUE } )
    public Flux<Article> listBookmarkedArticles(@PathVariable("username") @Parameter(description = "Specifies user name", required = true) final String username) {
        Optional<Member> optionalMember = this.memberService.findMember(username);

        if(optionalMember.isPresent()) {
            return Flux.fromIterable(optionalMember.get().getArticles().stream().sorted(Comparator.comparing(Article::getId).reversed()).collect(Collectors.toList()));
        }

        return Flux.fromIterable(Collections.EMPTY_LIST);
    }

}
