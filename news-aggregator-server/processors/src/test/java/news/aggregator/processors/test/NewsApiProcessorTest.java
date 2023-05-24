package news.aggregator.processors.test;

import news.aggregator.flows.model.Article;
import news.aggregator.processors.Application;
import news.aggregator.processors.domain.NewsApiArticle;
import news.aggregator.processors.domain.NewsApiResponse;
import news.aggregator.processors.domain.NewsApiSource;
import news.aggregator.processors.processor.NewsApiProcessor;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest(classes = { Application.class })
@TestMethodOrder(MethodOrderer.MethodName.class)
public class NewsApiProcessorTest {
    private final NewsApiProcessor processor;

    @Autowired
    public NewsApiProcessorTest(@Qualifier("newsApiProcessor") final NewsApiProcessor processor) {
        this.processor = processor;
    }

    @Test
    void test01apply() {
        final NewsApiSource source = new NewsApiSource();
        source.setName("source_name");

        final NewsApiArticle newsApiArticle = new NewsApiArticle();
        newsApiArticle.setTitle("title");
        newsApiArticle.setAuthor("author");
        newsApiArticle.setSource(source);
        newsApiArticle.setPublishedAt(ZonedDateTime.now());
        newsApiArticle.setUrl("url");

        final List<NewsApiArticle> newsApiArticles = new ArrayList<>();
        newsApiArticles.add(newsApiArticle);

        final NewsApiResponse domain = new NewsApiResponse();
        domain.setArticles(newsApiArticles);

        final List<Article> processedArticles = this.processor.apply(domain);

        assert processedArticles.size() == 1;
        final Article processedArticle = processedArticles.get(0);

        assert processedArticle.getAuthor().equals(newsApiArticle.getAuthor());
        assert processedArticle.getTitle().equals(newsApiArticle.getTitle());
        assert processedArticle.getSource().equals(newsApiArticle.getSource().getName());
        assert processedArticle.getPublicationDay().equals(newsApiArticle.getPublishedAt().toLocalDate());
        assert processedArticle.getUrl().equals(newsApiArticle.getUrl());
    }

}
