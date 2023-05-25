package news.aggregator.flows.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sun.istack.NotNull;

import javax.persistence.*;
import java.time.LocalDate;

/**
 * Representation of 'article' table and its columns
 */

@Entity
@Table(name = "article")
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "author")
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

    @ManyToOne()
    private Member member;

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

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

}
