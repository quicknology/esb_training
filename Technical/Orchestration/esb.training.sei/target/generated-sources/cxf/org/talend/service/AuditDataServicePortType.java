package org.talend.service;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.bind.annotation.XmlSeeAlso;

/**
 * This class was generated by Apache CXF 2.5.0
 * 2014-02-27T10:45:22.731-05:00
 * Generated source version: 2.5.0
 * 
 */
@WebService(targetNamespace = "http://www.talend.org/service/", name = "AuditDataServicePortType")
@XmlSeeAlso({ObjectFactory.class})
@SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
public interface AuditDataServicePortType {

    @WebResult(name = "AuditResponse", targetNamespace = "http://www.talend.org/service/", partName = "parameters")
    @WebMethod(operationName = "Audit", action = "http://www.talend.org/service/Audit")
    public AuditResponse audit(
        @WebParam(partName = "parameters", name = "AuditRequest", targetNamespace = "http://www.talend.org/service/")
        AuditRequest parameters
    );
}