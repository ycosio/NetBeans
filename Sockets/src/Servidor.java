import java.io.*;
import java.net.*;
import java.util.Random;

public class Servidor {

    public static void main(String[] args) {
        String vector = "0123456789abcdef"; //antes clave
        String claveA = "AAAAAAAAAAAAAAAA"; //antes llaveA
        String claveB = "BBBBBBBBBBBBBBBB"; //antes llaveB
        String llaveAB;
        Random rnd = new Random();

        try {
            //Iniciar Servidor
            ServerSocket socketServidor = new ServerSocket(8080);
            //Aceptar conexiones
            Socket socket = socketServidor.accept();
            //Nueva conexión, entrada y salida de datos
            System.out.println("Nueva conexión.");
            BufferedReader entrada = new BufferedReader(
                    new InputStreamReader(socket.getInputStream()));
            PrintWriter salida = new PrintWriter(socket.getOutputStream(), true);

            //Primer mensaje NO encriptado
            String msgin = entrada.readLine();
            System.out.println(msgin);
            String sg[]= new String[2]; //USUARIO1,USUARIO2,Nounce
                sg = msgin.split(",");

            llaveAB = "" + rnd.nextLong(); //Se genera una vector numerica aleatoria de longitud 16
                if (llaveAB.length() > 16) {
                    llaveAB = llaveAB.substring(llaveAB.length() - 16);
                    System.out.println("LlaveAB generada: " + llaveAB);
                }
                            
            //Respuesta encriptada del servidor
            System.out.println("Enviando datos al cliente: ");
            
            //Encriptación de mensaje de B
            EncriptacionAES aesb = new EncriptacionAES(vector, claveB);
            byte[] mensajeB = aesb.encripta(llaveAB + "," + sg[0]);
            String encriptadoHexaB = aesb.convierteHex(mensajeB);
            System.out.println("Mensaje B encriptado: " + mensajeB);
            //Encriptación de mensaje de A + Mensaje encriptado de B
            EncriptacionAES aes = new EncriptacionAES(vector, claveA);
            byte[] textoEncriptado = aes.encripta(sg[2] + "," + sg[1] + "," + llaveAB + "," + encriptadoHexaB);
            String encriptadoHexa = aes.convierteHex(textoEncriptado);
            System.out.println("Texto encriptado en hexadecimal: " + encriptadoHexa);

            //Envio del mensaje Encriptado
            salida.print(encriptadoHexa);

            //Finalizar sesion
            salida.close();
            socket.close();
            socketServidor.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
        }
    }
}
