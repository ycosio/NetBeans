
import java.io.*;
import java.net.*;
import java.util.Random;
import java.util.Scanner;

public class Cliente {

    static Random rnd = new Random();
    static String vector = "0123456789abcdef"; //antes clave
    static String claveA = "AAAAAAAAAAAAAAAA"; //antes llaveA
    static String claveAB;
    static EncriptacionAES aes2;
    static String msgout;
    static String msgin;

    public static void main(String[] args) {
        try {
            //Iniciar socket
            Socket socket = new Socket("localhost", 8080);
            //Aceptar y enviar información
            BufferedReader entrada = new BufferedReader(
                    new InputStreamReader(socket.getInputStream()));
            PrintWriter salida = new PrintWriter(socket.getOutputStream(), true);
            //Enviar cadena de conexión de nodos
            msgout = "A,B," + Integer.toString(rnd.nextInt(100));
            salida.println(msgout);
            System.out.println("Enviando cadena:" + msgout);

            //Recibiendo primera cadena encriptada
            System.out.println("Cadena de conexión recibida del servidor: ");
            String datos = entrada.readLine();
            String sg[]; // = new String[3];//Nounce,Usurio2,KEY,InformaciónCifrada

            //Desencriptando primer mensaje
            EncriptacionAES aes = new EncriptacionAES(vector, claveA);
            byte[] encriptadoBytes = aes.converteByte(datos);
            String textoDesencriptado = aes.desencripta(encriptadoBytes);
            System.out.println("Cadena desencriptada: " + textoDesencriptado);
            sg = textoDesencriptado.split(",");
            claveAB = sg[2];
            msgout = sg[3];

//          while((datos = entrada.readLine()) != null) {
//              System.out.println(datos);
//          }           
            entrada.close();
            socket.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
        }
        //-------------------CONEXION CON B-------------------------//
        try {
            System.out.println("Intentado conexión con B");
            //Iniciar socket
            Socket socketB = new Socket("localhost", 8081);
            //Aceptar y enviar información
            BufferedReader entradaB = new BufferedReader(
                    new InputStreamReader(socketB.getInputStream()));
            PrintWriter salidaB = new PrintWriter(socketB.getOutputStream(), true);

            //Enviar cadena de conexión de nodo B
            EncriptacionAES aesB = new EncriptacionAES(vector, claveAB);

            salidaB.println(msgout);
            System.out.println("Enviando cadena de conexión: " + msgout);

            //Recibiendo Respuesta Nounce de B
            msgin = entradaB.readLine();
            System.out.println("Mensaje recibido del ClienteB: " + msgin);
            
            //Desencriptando primer mensaje
            byte[] encriptadoBytesB = aesB.converteByte(msgin);
            String textoDesencriptadoB = aesB.desencripta(encriptadoBytesB);
            System.out.println("Texto de cliente B: " + textoDesencriptadoB);

            //Respuesta al clienteB
            int nounceB = Integer.parseInt(textoDesencriptadoB);
            nounceB --;
            encriptadoBytesB = aesB.encripta(Integer.toString(nounceB));
            msgout = aesB.convierteHex(encriptadoBytesB);
            System.out.println("Respuesta encriptada: " + msgout);
            salidaB.println(msgout);
            String entradaTeclado;
            Scanner entradaEscaner = new Scanner (System.in); //Creación de un objeto Scanner;
            
            while (true) {
                msgin = entradaB.readLine();
                System.out.println("MENSAJE DE B :" + msgin);
                
                System.out.println("RESPUESTA: \n");
                entradaTeclado = entradaEscaner.nextLine();
                salidaB.println(entradaTeclado);
                System.out.println("-------------");
            }

        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
        }
    }
}
