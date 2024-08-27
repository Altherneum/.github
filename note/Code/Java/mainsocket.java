import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;

public class mainsocket {
    public static void main(String[] args) throws IOException {
        String address = "google.fr";

        int port = 80;
        int timeout = 5000;

        long currentTime = System.currentTimeMillis();
        Socket socket = new Socket();
        try {
            socket.connect(new InetSocketAddress(address, port), timeout);
        } catch (IOException exception) {
            exception.printStackTrace();
        } finally {
            currentTime = System.currentTimeMillis() - currentTime;
            System.out.println(address + ":" + port + " " + currentTime + "ms");
            socket.close();
        }
    }
}