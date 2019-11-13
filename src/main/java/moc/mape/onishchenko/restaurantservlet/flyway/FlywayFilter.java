package moc.mape.onishchenko.restaurantservlet.flyway;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName="flywayFilter")
public class FlywayFilter implements Filter {
    private boolean initErrors = false;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Object flywayMigrateError = filterConfig.getServletContext().getAttribute("flywayMigrateError");
        this.initErrors = flywayMigrateError != null && (boolean) flywayMigrateError;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if (initErrors) {
            HttpServletResponse res = (HttpServletResponse) servletResponse;
            res.setStatus(503);
            return;
        }

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
