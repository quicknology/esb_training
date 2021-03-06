package org.talend.service;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
import javax.xml.ws.Service;

/**
 * This class was generated by Apache CXF 2.5.0
 * 2014-02-27T10:45:22.831-05:00
 * Generated source version: 2.5.0
 * 
 */
@WebServiceClient(name = "AuditDataService", 
                  wsdlLocation = "file:/c:/Talend/Technical/Orchestration/esb.training.sei/src/main/resources/WEB-INF/WSDL/AuditDataService.wsdl",
                  targetNamespace = "http://www.talend.org/service/") 
public class AuditDataService extends Service {

    public final static URL WSDL_LOCATION;

    public final static QName SERVICE = new QName("http://www.talend.org/service/", "AuditDataService");
    public final static QName AuditDataServicePort = new QName("http://www.talend.org/service/", "AuditDataServicePort");
    static {
        URL url = null;
        try {
            url = new URL("file:/c:/Talend/Technical/Orchestration/esb.training.sei/src/main/resources/WEB-INF/WSDL/AuditDataService.wsdl");
        } catch (MalformedURLException e) {
            java.util.logging.Logger.getLogger(AuditDataService.class.getName())
                .log(java.util.logging.Level.INFO, 
                     "Can not initialize the default wsdl from {0}", "file:/c:/Talend/Technical/Orchestration/esb.training.sei/src/main/resources/WEB-INF/WSDL/AuditDataService.wsdl");
        }
        WSDL_LOCATION = url;
    }

    public AuditDataService(URL wsdlLocation) {
        super(wsdlLocation, SERVICE);
    }

    public AuditDataService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public AuditDataService() {
        super(WSDL_LOCATION, SERVICE);
    }
    
    //This constructor requires JAX-WS API 2.2. You will need to endorse the 2.2
    //API jar or re-run wsdl2java with "-frontend jaxws21" to generate JAX-WS 2.1
    //compliant code instead.
    public AuditDataService(WebServiceFeature ... features) {
        super(WSDL_LOCATION, SERVICE, features);
    }

    //This constructor requires JAX-WS API 2.2. You will need to endorse the 2.2
    //API jar or re-run wsdl2java with "-frontend jaxws21" to generate JAX-WS 2.1
    //compliant code instead.
    public AuditDataService(URL wsdlLocation, WebServiceFeature ... features) {
        super(wsdlLocation, SERVICE, features);
    }

    //This constructor requires JAX-WS API 2.2. You will need to endorse the 2.2
    //API jar or re-run wsdl2java with "-frontend jaxws21" to generate JAX-WS 2.1
    //compliant code instead.
    public AuditDataService(URL wsdlLocation, QName serviceName, WebServiceFeature ... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     *
     * @return
     *     returns AuditDataServicePortType
     */
    @WebEndpoint(name = "AuditDataServicePort")
    public AuditDataServicePortType getAuditDataServicePort() {
        return super.getPort(AuditDataServicePort, AuditDataServicePortType.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns AuditDataServicePortType
     */
    @WebEndpoint(name = "AuditDataServicePort")
    public AuditDataServicePortType getAuditDataServicePort(WebServiceFeature... features) {
        return super.getPort(AuditDataServicePort, AuditDataServicePortType.class, features);
    }

}
