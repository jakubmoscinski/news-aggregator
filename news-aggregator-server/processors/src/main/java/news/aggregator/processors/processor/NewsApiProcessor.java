package news.aggregator.processors.processor;

import news.aggregator.flows.model.Article;
import news.aggregator.processors.domain.NewsApiResponse;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

@Component
public class NewsApiProcessor implements Function<NewsApiResponse, List<Article>> {

    @Override
    public List<Article> apply(final NewsApiResponse domain) {
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
