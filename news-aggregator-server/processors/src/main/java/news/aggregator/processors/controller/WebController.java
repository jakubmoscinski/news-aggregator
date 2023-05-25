package news.aggregator.processors.controller;

import org.springframework.web.reactive.function.client.WebClient;

/**
 * Web controller base class
 */
public abstract class WebController {
    protected final WebClient client;

    protected WebController(final String baseUrl) {
        this.client = WebClient.create(baseUrl);
    }

}
