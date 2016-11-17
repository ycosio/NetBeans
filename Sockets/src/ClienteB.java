
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author Francisco Ucol
 */
public class ClienteB {

    static Socket socket;
    static Random rnd = new Random();
    static String msgin = "";
    static String vector = "0123456789abcdef"; //antes clave
    static String claveAB; // antes llaveAB
    static String claveB = "BBBBBBBBBBBBBBBB"; //antes llaveB
    static Boolean Conect = false;
    static EncriptacionAES aes;
    static EncriptacionAES aesab;
    static BufferedReader entrada;
    static PrintWriter salida;
    static int nounce;
    public ClienteB(Socket socket) {
        this.socket = socket;
    }

    public static void main(String[] args) {
        try {
            //Iniciar Servidor
            ServerSocket socketServidor = new ServerSocket(8081);
            //Aceptar conexiones
            socket = socketServidor.accept();
            //Nueva conexión, entrada y salida de datos
            System.out.println("Nueva conexión.");
            entrada = new BufferedReader(
                    new InputStreamReader(socket.getInputStream()));
            salida = new PrintWriter(socket.getOutputStream(), true);
            
            //Recibiendo el primer mensaje
            msgin = entrada.readLine();
            System.out.println("Mensaje encriptado recibido: " + msgin);
            //Desencriptando el primer mensaje
            aes = new EncriptacionAES(vector, claveB);
            byte[] encriptadoBytes = aes.converteByte(msgin);
            String info = aes.desencripta(encriptadoBytes);
            System.out.println("Mensaje desencriptado recibido: " + info);
            
            //Procesando mensaje
            String sg[]; //Key, User
            sg = info.split(",");
            claveAB = sg[0];
            
            //Enviando Respuesta (NOUNCE)
            aesab = new EncriptacionAES(vector, claveAB);
            nounce = rnd.nextInt(100);
            System.out.println("Nounce a enviar:" + nounce);
            
            byte[] textoEncriptado = aesab.encripta(Integer.toString(nounce));
            String encriptadoHexa = aesab.convierteHex(textoEncriptado);
            info = encriptadoHexa;
            salida.println(info);
            System.out.println("Nounce encriptado: " + info);
            
            //Procesando Respuesta al NOUNCE
            msgin = entrada.readLine();
            encriptadoBytes = aesab.converteByte(msgin);
            msgin = aesab.desencripta(encriptadoBytes);
            System.out.println("Respuesta del cliente A: " + msgin);
            
            if(Integer.parseInt(msgin) == (nounce-1)) {
                Conect = true;
                System.out.println("Conexion chat establecida");
            }
            System.out.println("MENSAJE: \n");
            
            Scanner entradaEscaner = new Scanner (System.in); //Creación de un objeto Scanner;
            String entradaTeclado;
            
            entradaTeclado = entradaEscaner.nextLine ();
                salida.println(entradaTeclado);
            while (Conect == true) {
                msgin = entrada.readLine();
                System.out.println("MENSAJE DE A: " + msgin);
                
                System.out.println("Respuesta: \n");
                entradaTeclado = entradaEscaner.nextLine ();
                salida.println(entradaTeclado);
                System.out.println("-------------");
    //                socket = socketServidor.accept();
//                System.out.println("Esperando un nuevo mensaje...");
//                new Thread((Runnable) new ClienteB(socket)).start();
            }
            
            System.out.println("Finalizo la conexión");
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
        }

    }

    public void run() {
        try {
            Scanner entradaEscaner = new Scanner (System.in); //Creación de un objeto Scanner
            String entradaTeclado = entradaEscaner.nextLine ();
            salida.println(entradaTeclado);
            System.out.println("Mensaje enviado: " + entradaTeclado);
            
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            System.out.println("La regaste en el run");
        }
    }
}
