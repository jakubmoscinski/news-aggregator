package news.aggregator.processors.scheduler;

import news.aggregator.flows.model.Article;
import news.aggregator.flows.service.ArticleService;
import news.aggregator.processors.controller.NewsApiController;
import news.aggregator.processors.domain.NewsApiResponse;
import news.aggregator.processors.processor.NewsApiProcessor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

@Component
@Qualifier("newsApiScheduler")
public class NewsApiScheduler {
    private static final Logger LOG = LoggerFactory.getLogger(NewsApiScheduler.class);

    private final NewsApiController controller;
    private final NewsApiProcessor processor;
    private final ArticleService service;

    @Autowired
    public NewsApiScheduler(@Qualifier("newsApiController") final NewsApiController controller,
                            @Qualifier("newsApiProcessor") final NewsApiProcessor processor,
                            @Qualifier("articleService") final ArticleService service) {
        this.controller = controller;
        this.processor = processor;
        this.service = service;
    }

//    @PostConstruct
    @Scheduled(cron = "0 0 23 * * ?")
    public void schedule() {
        LOG.info("Fetching data from News API started");

        final NewsApiResponse response = this.controller.getNews();
        final List<Article> articles = this.processor.apply(response);

        articles.forEach(this.service::saveArticle);    //todo Write better

        LOG.info("Fetching data from News API completed");
    }


}
