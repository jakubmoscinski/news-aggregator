package news.aggregator.processors.controller;

import org.springframework.web.reactive.function.client.WebClient;

import javax.net.ssl.SSLException;

public abstract class WebController {
//    private static final int MAX_IN_MEMORY_SIZE = 2_097_152; // 2MB

    protected final WebClient client;

    protected WebController(final String baseUrl) {
        this.client = WebClient.create(baseUrl);
    }

}
