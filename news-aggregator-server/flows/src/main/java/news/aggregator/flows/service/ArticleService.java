package news.aggregator.flows.service;

import news.aggregator.flows.model.Article;
import news.aggregator.flows.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Qualifier("memberService")
public class ArticleService {

    private final ArticleRepository repository;

    @Autowired
    public ArticleService(final ArticleRepository repository) {
        this.repository = repository;
    }

    public Article saveArticle(final Article article) {
        return this.repository.save(article);
    }

    public List<Article> findArticles() {
        return this.repository.findArticles(PageRequest.of(0,25));
    }

    public Optional<Article> findArticleById(final long id) { return this.repository.findArticleById(id); }

    public void dropTableContent() {
        this.repository.deleteAll();
    }

}
