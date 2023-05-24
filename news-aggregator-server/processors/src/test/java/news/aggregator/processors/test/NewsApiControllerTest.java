package news.aggregator.processors.test;

import news.aggregator.processors.Application;
import news.aggregator.processors.controller.NewsApiController;
import news.aggregator.processors.domain.NewsApiArticle;
import news.aggregator.processors.domain.NewsApiResponse;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Objects;

@SpringBootTest(classes = { Application.class })
@TestMethodOrder(MethodOrderer.MethodName.class)
public class NewsApiControllerTest {
    private final NewsApiController controller;

    @Autowired
    public NewsApiControllerTest(@Qualifier("newsApiController") final NewsApiController controller) {
        this.controller = controller;
    }

    @Test
    void test01getNews() {
        final NewsApiResponse newsResponse = this.controller.getNews();

        assert Objects.nonNull(newsResponse);

        final List<NewsApiArticle> articles = newsResponse.getArticles();
        assert articles.size() > 0;
    }

}
