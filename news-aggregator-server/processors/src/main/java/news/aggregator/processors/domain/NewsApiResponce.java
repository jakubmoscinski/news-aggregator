package news.aggregator.processors.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class NewsApiResponce {

    @JsonProperty("articles")
    private List<NewsApiArticle> articles;

//    private String title;

    public List<NewsApiArticle> getArticles() {
        return articles;
    }

    public void setArticles(List<NewsApiArticle> articles) {
        this.articles = articles;
    }

//    public String getTitle() {
//        return title;
//    }

//    public void setTitle(String title) {
//        this.title = title;
//    }

}
