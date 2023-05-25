package news.aggregator.processors.test;

import news.aggregator.flows.model.Article;
import news.aggregator.processors.Application;
import news.aggregator.processors.controller.NewsApiController;
import news.aggregator.processors.domain.NewsApiResponse;
import news.aggregator.processors.processor.NewsApiProcessor;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Objects;

/**
 * This unit tests examines the correctness of NewsApiScheduler's methods
 */

@SpringBootTest(classes = { Application.class })
@TestMethodOrder(MethodOrderer.MethodName.class)
public class NewsApiSchedulerTest {

    private final NewsApiController controller;
    private final NewsApiProcessor processor;

    @Autowired
    public NewsApiSchedulerTest(@Qualifier("newsApiController") final NewsApiController controller,
                                @Qualifier("newsApiProcessor") final NewsApiProcessor processor) {
        this.controller = controller;
        this.processor = processor;
    }

    /**
     * Test if the sequence of: fetching, processing, persisting leads to at least one saved entry
     * (Assuming the 3rd part API returns at least one news in response)
     */
    @Test
    void test01schedule() {
        final NewsApiResponse response = this.controller.getNews();
        assert Objects.nonNull(response);
        assert response.getArticles().size() > 0;

        final List<Article> articles = this.processor.apply(response);
        assert articles.size() > 0;
    }

}
