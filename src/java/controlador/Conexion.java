/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author SERGI
 */
public class Conexion {
    
    //i could elaborate this, some users with different privilegies
    public static String user="userdb";
    private String pass="123";
    private String dbName="Login";
    public Connection con;
    private String connection_url="jdbc:mysql://localhost/"+dbName;
    
    public Conexion(){
        try{
            //CREATE USER 'userdb'@localhost' identified by '123'
            //GRAN ALL PRIVILEGIES ..
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(connection_url,user,pass);
            //hay varias excepciones..
        }catch(ClassNotFoundException | SQLException e){
                System.err.println(e);
        }    
    }
    //mejorar
    public Connection getConnection(){
        return con;
    }
    /*
    //i think this main could be removed
    public static void main (String args[]){
        
        Conexion con = new Conexion();
    
    }*/
}
