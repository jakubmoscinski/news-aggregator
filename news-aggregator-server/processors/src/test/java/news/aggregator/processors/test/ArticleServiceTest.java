package news.aggregator.processors.test;

import news.aggregator.flows.model.Article;
import news.aggregator.flows.service.ArticleService;
import news.aggregator.processors.Application;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

/**
 * This unit tests examines the correctness of ArticleService's methods
 */

@SpringBootTest(classes = { Application.class })
@TestMethodOrder(MethodOrderer.MethodName.class)
public class ArticleServiceTest {

    private final ArticleService service;

    @Autowired
    public ArticleServiceTest(@Qualifier("articleService") final ArticleService service) {
        this.service = service;
    }

    /**
     * Test if Article can be saved keeping all its fields
     */
    @Test
    void test01SaveArticle() {
        this.service.dropTableContent();

        final Article article = new Article();
        article.setAuthor("Author");
        article.setSource("Source");
        article.setTitle("Title");
        article.setUrl("Url");
        article.setPublicationDay(LocalDate.now());

        final Article savedArticle = this.service.saveArticle(article);

        assert Objects.nonNull(savedArticle);

        assert article.getAuthor().equals(savedArticle.getAuthor());
        assert article.getSource().equals(savedArticle.getSource());
        assert article.getTitle().equals(savedArticle.getTitle());
        assert article.getUrl().equals(savedArticle.getUrl());
        assert article.getPublicationDay().equals(savedArticle.getPublicationDay());
    }

    /**
     * Test if list of articles can be fetched successfully
     */
    @Test
    void test02FindArticles() {
        final List<Article> articles = this.service.findArticles();

        assert articles.size() > 0;
    }

    /**
     * Test if an article of a given id can be fetched successfully
     */
    @Test
    void test03FindArticleById() {
        final List<Article> articles = this.service.findArticles();

        if (articles.size() > 0) {
            final Article article = articles.get(0);

            assert Objects.nonNull(this.service.findArticleById(article.getId()));
        } else {
            assert false;
        }

    }

}
