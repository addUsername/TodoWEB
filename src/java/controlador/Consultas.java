package controlador;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SERGI
 */
public class Consultas extends Conexion {
    //i really dont know why not just implement Conexion methods here.. looks pretty btw.
    
    private ResultSet RS=null;
    private Statement query=null;
    private int userId;
    
   
    public boolean autentificacion(String user, String pass){
        
        try {
            
            query = con.createStatement();
            RS=query.executeQuery("SELECT id FROM login2 where user ='"+user+"' AND pass = md5('"+pass+"')");
            
            //return RS.absolute(1) ?????????
            if (RS.absolute(1)){
                userId=RS.getInt("id");
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public Object[] getTable(){
        
        List <String> tableList = new ArrayList <String>();
        
        try {
            //this comment is ok if the superuser asign diferents task to different people
            //RS=query.executeQuery("SELECT PKey, project, language, state, description FROM todo where id_user="+this.userId+";");
            RS=query.executeQuery("SELECT PKey, project, language, state, description FROM todo where id_user = "+this.userId+";");
            
            //OJOO lista multidimensionall NAAHH
            //conocemos la longitud de la row asiq una lista de String[]
            
            int j=0;
            //iterator
            while(RS.next()){
                
                String cols="";
                for(int i = 0; i<5 ;i++){
                    cols+= RS.getString(i+1)+",";
                }
                j++;
                tableList.add(cols);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        }
        //more iterator
        Iterator it =tableList.iterator();
        return tableList.toArray();
        
    }
    
    public void addTodo(String row){       
        
        //now we will add the user id
        row= "("+userId+","+row;
        try {
            query = con.createStatement();
            query.executeUpdate("INSERT INTO todo (id_user,language,project,state,description) VALUES "+row+";");
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("INSERT INTO todo (id_user,language,project,state,description) VALUES "+row+"; FAILED");
        }
    }
    
    public String getId(){
        //pedira la ultima row y de ahi saca el id xq es auto_increment y este metodo se ejecuta segun se submit la tarea
        String id ="";
        try {
            query = con.createStatement();
            RS=query.executeQuery("SELECT PKey FROM todo ORDER BY PKey DESC LIMIT 1;");
            while(RS.next()) id=RS.getString(1);
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SELECT PKey FROM todo ORDER BY PKey DESC LIMIT 1; FAILED");
        }
        return id;
    }
    
    public String getUser(){
        
        String toReturn="NULL";
        try {
            query = con.createStatement();
            RS=query.executeQuery("SELECT user FROM login2 WHERE ID="+userId+";");
            while(RS.next()) toReturn=RS.getString(1);
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return toReturn;    
        
    }
    
    public Boolean deleteTodo(String id){
        try {
            query = con.createStatement();
            System.out.println("aqui llegamos?");
            int i = query.executeUpdate("DELETE FROM todo where PKey = "+id+";");
            System.out.println("i = "+i+"\n lineas borradas");
            System.out.println(Cloud.deleteFile(id));
            
            //comprobar esto..
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("DELETE FROM todo where PKey = "+id+"; FAILED");
        }
        
        return false;
    }
    
    public Boolean updateState(String id, String newState){
        try {
            query = con.createStatement();
            System.out.println("aqui llegamos?");
            int i = query.executeUpdate("UPDATE todo SET state ="+newState+" where PKey = "+id+";");
            System.out.println("i = "+i+"\n actualizadas");
            System.out.println(Cloud.deleteFile(id));
            //comprobar esto..
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Consultas.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("UPDATE todo SET state ="+newState+" where PKey = "+id+";FAILED");
        }
        
        return false;
    }
    
    /*
    I use the main method to rapid-test the functions above
    public static void main (String args[]){
        
        Consultas co = new Consultas();
        System.out.println(co.autentificacion("Sergio","asdf"));
    }*/
}
