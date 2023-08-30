/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.ventas.vo;

/**
 *
 * @author nlast
 */
public class JsonResponse {
    private String success;
    private String numerodocumento;
    private String tipodocumento;
    private String mensajeFinal;

    public JsonResponse(String success, String numerodocumento, String tipodocumento, String mensajeFinal) {
        this.success = success;
        this.numerodocumento = numerodocumento;
        this.tipodocumento = tipodocumento;
        this.mensajeFinal = mensajeFinal;
    }

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public String getNumerodocumento() {
        return numerodocumento;
    }

    public void setNumerodocumento(String numerodocumento) {
        this.numerodocumento = numerodocumento;
    }

    public String getTipodocumento() {
        return tipodocumento;
    }

    public void setTipodocumento(String tipodocumento) {
        this.tipodocumento = tipodocumento;
    }

    public String getMensajeFinal() {
        return mensajeFinal;
    }

    public void setMensajeFinal(String mensajeFinal) {
        this.mensajeFinal = mensajeFinal;
    }
    
    
}
