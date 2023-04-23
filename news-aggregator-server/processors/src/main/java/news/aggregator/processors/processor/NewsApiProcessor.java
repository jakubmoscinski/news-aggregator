package news.aggregator.processors.processor;

import news.aggregator.flows.model.Article;
import news.aggregator.processors.domain.NewsApiResponce;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

@Component
public class NewsApiProcessor implements Function<NewsApiResponce, List<Article>> {

    @Override
    public List<Article> apply(final NewsApiResponce domain) {
        final List<Article> articles = new ArrayList();

        domain.getArticles().forEach(domainArticle -> {
            final Article article = new Article();

            article.setSource(domainArticle.getSource().getName());
            article.setAuthor(domainArticle.getAuthor());
            article.setTitle(domainArticle.getTitle());
            article.setUrl(domainArticle.getUrl());
            article.setPublicationDay(domainArticle.getPublishedAt().toLocalDate());

            articles.add(article);
        });

        return articles;
    }

}
