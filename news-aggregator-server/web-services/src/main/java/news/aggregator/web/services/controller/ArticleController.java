package news.aggregator.web.services.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import news.aggregator.flows.model.Article;
import news.aggregator.flows.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

/**
 * Detailed documentation and test methods: http://localhost:8080/news-aggregator/swagger-ui/index.html
 */

@RestController
@RequestMapping("/article")
@Tag(name = "Article resource", description = "Article controller")
public class ArticleController {
    private final ArticleService service;

    @Autowired
    public ArticleController(@Qualifier("articleService") final ArticleService service) {
        this.service = service;
    }

    @Operation(summary = "List articles")
    @GetMapping(value = "/list", produces = { MediaType.APPLICATION_JSON_VALUE } )
    public Flux<Article> listArticles() {
        return Flux.fromIterable(this.service.findArticles());
    }

}
