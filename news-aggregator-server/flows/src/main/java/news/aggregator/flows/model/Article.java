package news.aggregator.flows.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sun.istack.NotNull;
import news.aggregator.flows.model.support.ArticleSource;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "article")
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    @Column(name = "author", nullable = false)
    private String author;

    @NotNull
    @Column(name = "source", nullable = false)
    private String source;

    @NotNull
    @Column(name = "title", nullable = false)
    private String title;

    @Lob
    @NotNull
    @Column(name = "url", nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String url;

    @NotNull
    @Column(name = "publication_day", nullable = false)
    private LocalDate publicationDay;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public LocalDate getPublicationDay() {
        return publicationDay;
    }

    public void setPublicationDay(LocalDate publicationDay) {
        this.publicationDay = publicationDay;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

}




//    @NotNull
//    @Column(name="source", nullable = false)
//    @Enumerated(EnumType.STRING)
//    private ArticleSource source;
//
//    @Lob
//    @Column(name = "content")
//    @JsonFormat(shape = JsonFormat.Shape.STRING)
//    private String content;

//TODO relation to members - likes/favorites etc
