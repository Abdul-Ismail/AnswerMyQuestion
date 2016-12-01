/* this is the code i wrote to recieve the answer from another laptop, I didnt use it in this program as i came up with another solutoon
but I thought I would add for marking purposes */

import java.net.*;
import java.io.*;

class MySocket extends Thread {
   public String received;
   private ServerSocket serverSocket;
   
   public MySocket(int port) throws IOException {
      serverSocket = new ServerSocket(port); //server takign information in
      serverSocket.setSoTimeout(0); //how long we want to wait for a connection 
   }

   public void run() {
      while(true) {
         try {
            //println("Waiting for client on port " + 
            //   serverSocket.getLocalPort() + "...");
            Socket server = serverSocket.accept(); //Execution will hand here until new connection is made.
            
            //System.out.println("Just connected to " + server.getRemoteSocketAddress());
            DataInputStream in = new DataInputStream(server.getInputStream());
            
            received = in.readUTF();
            //println(received);
            //AI.derp = received;
            //DataOutputStream out = new DataOutputStream(server.getOutputStream());
            //out.writeUTF("Thank you for connecting to " + server.getLocalSocketAddress()
            //   + "\nGoodbye!");
            server.close();
            
         }catch(SocketTimeoutException s) {
            System.out.println("Socket timed out!");
            break;
         }catch(IOException e) {
            e.printStackTrace();
            break;
         }
      }
   }
}