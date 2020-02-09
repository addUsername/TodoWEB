package controlador;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Cloud {
    
    
    public static String createFile (String id,String home_JSP_description,String query,String name){
        
        
        
        //File file = new File("Files\\Description-"+id+".txt");
        
        try {
        
            File folder = new File("c:\\Files");        
            folder.mkdir();
            String folderPath = folder.getAbsolutePath();
            
            File file =new File(folderPath+"\\Descripcion-"+id+".txt");
            
            if(file.exists()? file.delete(): file.createNewFile())System.out.println("###### ARCHIVO CREADO");
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date(System.currentTimeMillis());
            
            BufferedWriter writer = new BufferedWriter(new FileWriter(file,true));
            writer.append("\nPROJECT: "+query.split(",")[1]+"\nUSER: "+name+"\n"+date+"\n\n\n");
            writer.append(home_JSP_description);
            writer.append("\n\n#BRING WITH (L)#");
            writer.close();
            return "http://localhost:8080/Login2/Indetail.jsp?id="+id;
            
            
        } catch (IOException ex) {
            Logger.getLogger(Cloud.class.getName()).log(Level.SEVERE, null, ex);
            return "'everything went wrong')";
        }
        
        
    }
    private static String download(String id){
        String toReturn="http://localhost:8080/Login2/";
        try {
            //first we generate the download file from our d:/Files/ dir, generate de name and the copy to server root path
            int random = (int)(Math.random()*1000);
            File dir = new File("Files\\"+random);
            dir.mkdir();
            File fileOld = new File("C:\\Files\\Descripcion-"+id+".txt");
            File fileNew = new File("C:\\Users\\SERGI\\Documents\\Login2\\WEB\\"+random+"Descripcion-"+id+".txt");
            // fileNew.createNewFile();
           
            Files.copy(fileOld.toPath(), fileNew.toPath());
            if(fileNew.exists()){System.out.println("el archivo se ha escrito huahahah");}
            toReturn +=random+"Descripcion-"+id+".txt";
            
        } catch (IOException ex) {
            Logger.getLogger(Cloud.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("DOWNLOAD DOENT WORRRK");
        }
        return toReturn;
    }
    public static String waitForIt(String id){
                
        String toReturn = download(id);
        
        try {
            //añadimos una pausa, porque el link se genera( y envia) antes que el archivo aparezca en la carpeta dee projecto.. y hay que recargar dos veces (no creo que sea esto) PUES SI ERA
            Thread.sleep(2000);
        } catch (InterruptedException ex) {
            Logger.getLogger(Cloud.class.getName()).log(Level.SEVERE, null, ex);
        }
        return toReturn;
    }
    public static String modify(String id,String newTxt){
        
        File fileNew=null;
        try {
            //By clicking modify someone make request text area input
            //gettin file
            
            fileNew= new File("c:\\Files\\Descripcion-"+id+"-UPDATE.txt");
            
            if(fileNew.exists()) fileNew.delete(); 
            fileNew.createNewFile();
            FileWriter fw = new FileWriter (fileNew);
            fw.write(newTxt);
            fw.close();            
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Cloud.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Cloud.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ((fileNew.exists() && fileNew.length()>4)?"c:\\Files\\Descripcion-"+id+"-UPDATE.txt":null);
    }
    public static String[] getUpdateList(){
        
        //tendria que haberlo pensado unos dias antes y almacenar una columna Boolean (se puede?? 0 o 1 ya lo se) en la tabla Login2 e yap
        //ya que haciendo como ahora no le doy tanto uso al nombre del archivo como deberia.. pero bueh.. eficiencia a parte
        
        File dir = new File ("C:\\Files");
        ArrayList <String> updateList=new ArrayList<>();
        for(String s: dir.list()){
            if(s.matches(("^.*UPDATE.txt"))) updateList.add(s);        
        }
        //return updateList.toArray();
        
        //Vale esta linea es importante, copia un array a otro de la clase que le digas (magia¿?),
        //en este caso va de Object a String, el segundo paramatro es la length del nuevo array.
        //mucho mejor asi
        //Obra de arte, pero necesito solo los nombres lel
        //return Arrays.copyOf(updateList.toArray(), updateList.size(), String[].class) ;
        String[] stringArray=Arrays.copyOf(updateList.toArray(), updateList.size(), String[].class) ;
        String[] toReturn = new String[stringArray.length];
        int i=0;
        for(String s:stringArray){
            toReturn[i]= s.split("Descripcion-")[1].split(".tx")[0];
            System.out.println(toReturn[i]);
            i++;
        }
        return toReturn;
    }
    public static Boolean modifyOriginal(String id){
        
        //en ppio borra el archivo original
        FileWriter fw = null;
        Boolean toReturn = false; 
        try {
            //esto es otra cagada (lo mismo para todas las funciones) NO! NUNCA! EN LA VIDA! SE MANEJA UN DIRECTORIO ASI
            // NO CUESTA NADA ALMACENARLO EN UNA VARIALE Y TE SALVA LA VIDA, AHORA A VER COMO LO CAMBIO (tp lo necesito lel..)
            File fileOld = new File("C:\\Files\\Descripcion-"+id+".txt");
            fw = new FileWriter (fileOld,true);
            
            File fileUpdate = new File("C:\\Files\\Descripcion-"+id+"-UPDATE.txt");
            Scanner sc = new Scanner(fileUpdate);
            
            String updateText ="";
            while(sc.hasNextLine())updateText+=sc.nextLine()+"\n";
            fw.write(updateText);
            return true;
            
        } catch (IOException ex) {
            
            Logger.getLogger(Cloud.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fw.close();
            } catch (IOException ex) {
                Logger.getLogger(Cloud.class.getName()).log(Level.SEVERE, null, ex);
            }
           
        }
        return toReturn;
    }
    
    
    
    /*
    public static void main(String args[]){
        
        //va de putisima madre
        System.out.println(modify("26","No jodas que funciona esto"));
    }*/
}