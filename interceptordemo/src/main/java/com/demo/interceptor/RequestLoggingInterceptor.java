// http://www.mastertheboss.com/jboss-frameworks/resteasy/resteasy-interceptors-tutorial?start=1

package com.demo.interceptor;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.jboss.resteasy.annotations.interception.ServerInterceptor;
import org.jboss.resteasy.core.ResourceMethod;
import org.jboss.resteasy.core.ServerResponse;
import org.jboss.resteasy.spi.Failure;
import org.jboss.resteasy.spi.HttpRequest;
import org.jboss.resteasy.spi.interception.PostProcessInterceptor;
import org.jboss.resteasy.spi.interception.PreProcessInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import javax.ws.rs.ext.Provider;

@Provider
@ServerInterceptor
public class RequestLoggingInterceptor implements PreProcessInterceptor, PostProcessInterceptor {

    @Context
    HttpServletRequest servletRequest;

    public ServerResponse preProcess(HttpRequest request, ResourceMethod resourceMethod)
            throws Failure, WebApplicationException {
        String me = "RequestLoggingInterceptor.preProcess()";
        System.out.println(me + " servletRequest: " + ToStringBuilder.reflectionToString(servletRequest, ToStringStyle.MULTI_LINE_STYLE));
        System.out.println(me + " request: " + ToStringBuilder.reflectionToString(request, ToStringStyle.MULTI_LINE_STYLE));
        System.out.println(me + " resourceMethod: " + ToStringBuilder.reflectionToString(resourceMethod, ToStringStyle.MULTI_LINE_STYLE));

        return null;
    }

    @Override
    public void postProcess(ServerResponse serverResponse) {
        String me = "RequestLoggingInterceptor.postProcess()";
        System.out.println(me + " servletRequest: " + ToStringBuilder.reflectionToString(servletRequest, ToStringStyle.MULTI_LINE_STYLE));
        System.out.println(me + " serverResponse: " + ToStringBuilder.reflectionToString(serverResponse, ToStringStyle.MULTI_LINE_STYLE));
    }
}
