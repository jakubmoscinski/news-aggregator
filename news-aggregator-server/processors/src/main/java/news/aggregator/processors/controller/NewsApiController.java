package news.aggregator.processors.controller;

import news.aggregator.processors.domain.NewsApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

@Component
@Qualifier("newsApiController")
public class NewsApiController extends WebController {
    private final String token;
    private final String requestPart;
    private final String country;

    @Autowired
    protected NewsApiController(@Value("${news-api.url}") final String url,
                                @Value("${news-api.token}") final String token,
                                @Value("${news-api.request.part}") final String requestPart,
                                @Value("${news-api.country}") final String country) {
        super(url);
        this.token = token;
        this.requestPart = requestPart;
        this.country = country;
    }

    public NewsApiResponse getNews() {
        final Mono<NewsApiResponse> mono = client.get().uri(builder -> builder.path(this.requestPart)
                .queryParam("country", this.country)    //TODO countries to enum
                .queryParam("apiKey", this.token)
                .build()
        )
        .accept(MediaType.APPLICATION_JSON)
        .retrieve()
        .bodyToMono(NewsApiResponse.class);

        return mono.block();
    }

}
