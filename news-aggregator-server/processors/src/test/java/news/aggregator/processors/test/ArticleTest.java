package news.aggregator.processors.test;

import news.aggregator.flows.model.Article;
import news.aggregator.flows.model.support.ArticleSource;
import news.aggregator.flows.service.ArticleService;
import news.aggregator.processors.Application;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = { Application.class })
public class ArticleTest {

    private final ArticleService sevice;

    @Autowired
    public ArticleTest(@Qualifier("articleService") final ArticleService service) {
        this.sevice = service;
    }

    @Test
    void testService() {
        final Article article = new Article();
        article.setSource(ArticleSource.EXAMPLE_SOURCE_1);
        article.setContent("Lorem ipsum dolor sit amet.Aut laborum iste sed quae pariatur et minus repudiandae id possimus placeat aut ipsam quia eos odit perferendis eos dicta libero? Qui iusto voluptatem qui cupiditate esse vel adipisci iure in obcaecati ratione est fuga dolore eos soluta magni.");

        this.sevice.saveArticle(article);

        assert(this.sevice.findArticles().size() == 1);
    }

}
