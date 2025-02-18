package com.example.proyecto_final_base_japyld.SistemaJapyld.ModelsJ.DaosJ;

import com.example.proyecto_final_base_japyld.BaseDao;
import com.example.proyecto_final_base_japyld.BeansGenerales.JuegosCompradosReservados;
import com.example.proyecto_final_base_japyld.BeansGenerales.Personas;
import com.example.proyecto_final_base_japyld.UsuarioJapyld.ModelsJ.DtoJ.InfoVentaDto;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class CorreoDao extends BaseDao {

    public void correo(String correoDestino , String asunto, String contenido){
        String correo = "japyld.6@gmail.com";
        String contra = "ulctzppylyslvagd";


        Properties p ;
        p = new Properties();
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.setProperty("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        p.setProperty("mail.smtp.port", "587");
        p.setProperty("mail.smtp.user",correo);
        p.setProperty("mail.smtp.auth", "true");
        Session s = Session.getDefaultInstance(p);
        try{
            MimeMessage mensaje = new MimeMessage(s);
            mensaje.setFrom(new InternetAddress(correo));
            mensaje.setRecipient(Message.RecipientType.TO, new InternetAddress(correoDestino));
            mensaje.setSubject(asunto);
            mensaje.setText(contenido);
            mensaje.setText(contenido);
            Transport mTransport = s.getTransport("smtp");
            mTransport.connect(correo, contra);
            mTransport.sendMessage(mensaje, mensaje.getRecipients(Message.RecipientType.TO));
            mTransport.close();

        } catch (MessagingException ex) {
            ex.printStackTrace();
        }

    }

    public String getEmail(int idPersona) {
        String sql = "SELECT correo FROM personas WHERE idPersona = " + idPersona;
        String emailDirection = null;

        try(Connection connection = this.getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            if (rs.next()) {
                emailDirection = rs.getString(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return emailDirection;
    }

    public void sendChangeOfferEmail(InfoVentaDto require) {
        String asunto = "Cambio de oferta";
        String contenido =
                "Le informamos lo siguiente:\n\n" +
                "El usuario " + require.getUserName() + " modificó el precio de su oferta en el juego " + require.getGameName() + ".\n" +
                "La información del precio actualizado la puede ver en el registro de ofertas:\n" +
                "   N° de oferta = " + require.getOfferId() + "\n\n" +
                "Gracias por su atención,\n" +
                "Japyld Solutions";

        //Se envia el correo
        this.correo(this.getEmail(require.getIdAdmin()), asunto, contenido);
    }

    public void sendNewOfferEmail(Personas usuario, int idAdmin) {
        String asunto = "Nueva oferta";
        String contenido =
                "Una nueva oferta fue publicada a su cargo por parte del usuario " + usuario.getNombre() + " " + usuario.getApellido() + ".\n" +
                "Los detalles de la oferta lo puede observar en su página de ofertas.\n\n" +
                "Gracias por su atención,\n" +
                "Japyld Solutions";
        //Se envia el correo
        this.correo(this.getEmail(idAdmin), asunto, contenido);
    }

    public void sendGameReservationEmail(JuegosCompradosReservados infoCompra) {
        PersonaDao personaDao = new PersonaDao();//Para obtener los datos del usuario
        SistemaDao sistemaDao = new SistemaDao();//Para obtener los datos de la compra
        Personas usuario = personaDao.obtenerPersona(infoCompra.getUsuario().getIdPersona());
        String asunto = "Nueva reserva de juego";
        String contenido =
                "Estimado(a) administrador(a):\n\n" +
                "Le informamos que se le ha asignado una nueva reserva con los siguientes detalles:\n\n" +
                "   Usuario: " + usuario.getNombre() + " " + usuario.getApellido() + "\n" +
                "   Juego: " + sistemaDao.obtenerNombreJuego(infoCompra.getJuego().getIdJuegos()) + "\n" +
                "   Consola: " + sistemaDao.obtenerNombreConsola(infoCompra.getConsola().getIdConsola()) + "\n" +
                "   Precio de la compra: " + infoCompra.getPrecio_compra() + "\n" +
                "   Dirección de entrega: " +  infoCompra.getDireccion_compra() + "\n" +
                "   Fecha de compra: " + infoCompra.getFechaCompraJuego() + "\n\n" +
                "Gracias por su atención,\n" +
                "Japyld Solutions";
        //Se envia el correo
        this.correo(this.getEmail(infoCompra.getAdministrador().getIdPersona()), asunto, contenido);
    }

}
