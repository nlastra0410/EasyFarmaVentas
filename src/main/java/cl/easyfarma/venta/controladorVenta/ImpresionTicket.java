/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.easyfarma.venta.controladorVenta;

import br.com.adilson.util.Extenso;
import br.com.adilson.util.PrinterMatrix;
import cl.easyfarma.ventas.dao.Ventas;
import cl.easyfarma.ventas.vo.DatosVenta;
import cl.easyfarma.ventas.vo.ProductoVenta;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttribute;
import javax.print.attribute.PrintRequestAttributeSet;
import cl.easyfarma.ventas.vo.ProductoVenta;
import cl.easyfarma.ventas.vo.clienteVO;

/**
 *
 * @author nlast
 */
public class ImpresionTicket {
    public String impresionTicket(Integer numeroDoc){
        
        try{
            Ventas productoVentaDAO = new Ventas();
            List<ProductoVenta> productos = productoVentaDAO.obtenerProductosPorNumeroDocumento(numeroDoc);
            ProductoVenta usuVendedor = productoVentaDAO.obtenerUsuarioVendedorPorNumeroDocumento(numeroDoc);
            clienteVO Cliente = productoVentaDAO.obtenerClientePorNumeroDocumento(numeroDoc);
            PrinterMatrix printer = new PrinterMatrix();
                String numeroFactura = String.valueOf(numeroDoc);
                String nombreVendedor = usuVendedor.getUsuario();
                String nombreCliente = "";
                 
                if (Cliente != null) {
                    if (Cliente.getNombre() != null) {
                        nombreCliente = Cliente.getNombre() + " " + Cliente.getRut();
                    } else {
                        nombreCliente = "Cliente no disponible";
                    }
                } else {
                    nombreCliente = "Cliente no disponible"; // Manejar caso de cliente nulo
                }
                
                Date fechaActual = new Date();
                // Definir el formato deseado
                SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                // Formatear la fecha actual
                String fechaFormateada = formato.format(fechaActual);
                // Obtener la hora actual
                Date horaActual = new Date();
                // Definir el formato deseado
                SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm:ss");
                // Formatear la hora actual
                String horaFormateada = formatoHora.format(horaActual);
            Extenso e = new Extenso();
                e.setNumber(101.85); //
                System.out.println("DATOS FACTURA ");
                System.out.println("nombreCliente "+nombreCliente);
                System.out.println("nombreVendedor "+nombreVendedor);
              
                //tamaño linea  y columna tamaño hoja impresion
                printer.setOutSize(30, 58);
                
                printer.printCharAtCol(1, 1, 58, "=");
                //linea inicio, linea fin, col inicio, col fin,
                printer.printTextWrap(1, 2, 8, 58, "FACTURA DE VENTA " +numeroFactura);
                //printer.printTextWrap(2, 3, 1, 58, "-------------------------------");
                printer.printTextWrap(2, 3, 1, 58, "Fecha Emision "+fechaFormateada);
                printer.printTextWrap(3, 3, 1, 58, "Hora Emision "+horaFormateada);
                printer.printTextWrap(4, 3, 1, 58, "Vendedor "+nombreVendedor);
                printer.printTextWrap(5, 3, 1, 58, ""+nombreCliente);               
                printer.printCharAtCol(6, 1, 58, "=");
                int i = 6;
                int x = 3;
                int total = 0;
                for(ProductoVenta prod : productos){
                    if(prod.getRutCliente()!=null){
                      printer.printTextWrap(i, x, 1, 58, prod.getProducto()+" Cant "+prod.getCantidad()+" $"+prod.getPrecioEasyPlus());   
                      total = prod.getTotalfinaleasy();
                    }else{
                      printer.printTextWrap(i, x, 1, 58, prod.getProducto()+" Cant "+prod.getCantidad()+" $"+prod.getPrecio());   
                      total = prod.getTotalfinal();
                    }  
                    i++;
                    x++;
                }
                
                printer.printTextWrap(i+1, x+1, 1, 58, "Total ======================"+total);   
                printer.toFile("C:\\Users\\nlast\\OneDrive\\Documentos\\NetBeansProjects\\EasyFarmaVentas\\Impresion.txt");
                FileInputStream inputStream = null ;
                try {
                    inputStream = new FileInputStream("Impresion.txt");
                } catch (FileNotFoundException ex) {
                    ex.printStackTrace();
                }
                
                if(inputStream == null)return null;
                
                DocFlavor docFormat = DocFlavor.INPUT_STREAM.AUTOSENSE;
                Doc document = new SimpleDoc(inputStream, docFormat, null);
                
                PrintRequestAttributeSet attributeSet = new HashPrintRequestAttributeSet();
                PrintService defaultPrintService = PrintServiceLookup.lookupDefaultPrintService();
                
                if(defaultPrintService!=null){
                    DocPrintJob printJob = defaultPrintService.createPrintJob();
                    try{
                       printJob.print(document, attributeSet);
                    }catch(Exception exc){
                        System.err.println("Error "+exc.toString());
                    }
                }else{
                    System.err.println("No Hay un impresora instalada");
                }
        }catch(Exception ex){
            System.out.println("cl.easyfarma.venta.controladorVenta.ImpresionTicket.impresionTicket()");
            System.out.println("Error "+ex.getMessage());
        }
          return "";  
                
                
        
    }
    
    
    
    
}
