import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class EncriptacionAES {
    private final String vector;
    private final String clave;
    
    private Cipher cifrador;
    private SecretKeySpec llave;
    
    public EncriptacionAES(String vector, String clave) throws Exception {
        this.vector = vector;
        this.clave = clave;
        cifrador = Cipher.getInstance("AES/CBC/PKCS5Padding", "SunJCE");
        llave = new SecretKeySpec(clave.getBytes("UTF-8"), "AES");
    }
    
    public byte[] encripta(String textoPlano) throws Exception {
        cifrador.init(Cipher.ENCRYPT_MODE, llave, new IvParameterSpec(vector.getBytes("UTF-8")));
        
        return cifrador.doFinal(textoPlano.getBytes("UTF-8"));
    }
    
    public String desencripta(byte[] textoCifrado) throws Exception {
        cifrador.init(Cipher.DECRYPT_MODE, llave, new IvParameterSpec(vector.getBytes("UTF-8")));
        
        return new String(cifrador.doFinal(textoCifrado), "UTF-8");
    }
    
    public String convierteHex(byte[] datos) throws Exception {
        StringBuilder constructor = new StringBuilder();
        for(byte b : datos) {
            constructor.append(String.format("%02X", b));
        }
        
        return constructor.toString();
    }
    
    public byte[] converteByte(String datos) throws Exception {
        int tamano = datos.length();
        byte[] constructor = new byte[tamano / 2];
        
        for(int indice = 0; indice < tamano; indice += 2) {
            constructor[indice / 2] = (byte)((Character.digit(datos.charAt(indice), 16) << 4) + Character.digit(datos.charAt(indice + 1), 16));
        }
        
        return constructor;
    }    
    
}