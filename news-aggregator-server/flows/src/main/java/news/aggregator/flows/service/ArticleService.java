package news.aggregator.flows.service;

import news.aggregator.flows.model.Article;
import news.aggregator.flows.model.Member;
import news.aggregator.flows.repository.ArticleRepository;
import news.aggregator.flows.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

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
        return this.repository.findAll();
    } //todo test purposes only

}
