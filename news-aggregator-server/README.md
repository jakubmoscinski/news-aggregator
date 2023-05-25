Before running the system please do:
 * Install PostgreSQL
   * Create new database named: news_aggregator
   * Create new user/role named: news_aggregator_manager
   * Set user/role password to: 1a6gew3PPvIoP12Z
   *Alternatively modify properties in application.properties (news-aggregator-server/processors/src/main/resources/application.properties)
 * Install tomcat9 server
 
 
* Running the system
   * processors.jar
     * news-aggregator-server/processors/target/processors.jar
     * processors.jar is file - You can run this with your JVM - Alternatively for test purposes please use your IDE by running:
       news-aggregator-server/processors/src/main/java/news/aggregator/processors/Application.java

   * news-aggregator-api.war
     * news-aggregator-server/web-services/target/news-aggregator-api.war
     * news-aggregator-api.war - Please deploy this file on your tomcat server by placing it into tomcat webapps folder


 * The API can be accessed and tested with Swagger UI:
   http://localhost:8080/news-aggregator/swagger-ui/index.html


 * If you wish to rebuild the project please go to the news-aggregator-server root directory and perform:
   * mvn clean install -DskipTests (without tests)
   * mvn clean install (include tests)

