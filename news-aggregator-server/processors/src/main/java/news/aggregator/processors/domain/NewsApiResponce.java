package news.aggregator.processors.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class NewsApiResponse {

    @JsonProperty("articles")
    private List<NewsApiArticle> articles;

    public List<NewsApiArticle> getArticles() {
        return articles;
    }

    public void setArticles(List<NewsApiArticle> articles) {
        this.articles = articles;
    }

}
