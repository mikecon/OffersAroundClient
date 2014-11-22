
package gr.teicm.offersaroundclient.model.bean;

import gr.teicm.offersaroundws.services.Offerstemp;
import gr.teicm.offersaroundws.services.OfferstempWS_Service;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.xml.ws.WebServiceRef;

@ManagedBean
@SessionScoped
public class OfferBean {
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8086/OffersAround/OfferstempWS.wsdl")
    private OfferstempWS_Service service;

    private Integer businessId;
    private String businessName;
    private float latitude;
    private float longitude;
    private String offer;

    public Integer getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Integer businessId) {
        this.businessId = businessId;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public String getOffer() {
        return offer;
    }

    public void setOffer(String offer) {
        this.offer = offer;
    }
    
    public OfferBean() {
    }
    
    public String saveOff(){
        String msj = insertOffer(businessId, businessName, latitude, longitude, offer);
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO,msj,"...");
        FacesContext.getCurrentInstance().addMessage(null,msg);
        cleanForm();
        return "management";
    }    
    
    public String searchOff(){
        String msj = searchOffer(businessId);
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, msj, "...");
        FacesContext.getCurrentInstance().addMessage(null, msg);
        cleanForm();
        return "management";
    }    
    
    public void cleanForm(){
        this.businessId = 0;
        this.businessName = "";
        this.latitude = 0;
        this.longitude = 0;
        this.offer = "";
    }
    
    public List<Offerstemp> getListOff(){
        List<Offerstemp> list = allOffers();
        return list;
    }
    
    private static String searchOffer(int businessId){
        gr.teicm.offersaroundws.services.OfferstempWS_Service service = new gr.teicm.offersaroundws.services.OfferstempWS_Service();
        gr.teicm.offersaroundws.services.OfferstempWS port = service.getOfferstempWSPort();
        return port.searchOffer(businessId);
    }
    
    private static List<Offerstemp> allOffers(){
        gr.teicm.offersaroundws.services.OfferstempWS_Service service = new gr.teicm.offersaroundws.services.OfferstempWS_Service();
        gr.teicm.offersaroundws.services.OfferstempWS port = service.getOfferstempWSPort();
        return port.allOffers();
    }

    
    private static String insertOffer(int businessId, String businessName,float latitude,float longitude,String offer){
        gr.teicm.offersaroundws.services.OfferstempWS_Service service = new gr.teicm.offersaroundws.services.OfferstempWS_Service();
        gr.teicm.offersaroundws.services.OfferstempWS port = service.getOfferstempWSPort();
        return port.insertOffer(businessId, businessName, latitude, longitude, offer);
    }

}
