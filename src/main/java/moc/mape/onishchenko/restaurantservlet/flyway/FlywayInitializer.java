package moc.mape.onishchenko.restaurantservlet.flyway;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.FlywayException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class FlywayInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        boolean migrateError = false;
        try {
            String url = System.getProperty("JDBC_DATABASE_URL");
            String user = System.getProperty("JDBC_DATABASE_USERNAME");
            String password = System.getProperty("JDBC_DATABASE_PASSWORD");

            Flyway flyway = Flyway.configure()
                    .dataSource(url, user, password)
                    .load();
            flyway.migrate();
        } catch (FlywayException e) {
            migrateError = true;
            System.out.println("Flyway migrate with errors: " + e.getMessage());
        }

        servletContextEvent.getServletContext()
                .setAttribute("flywayMigrateError", migrateError);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
