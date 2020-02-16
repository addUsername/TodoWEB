package controlador;

/**
 *
 * @author SERGI
 */
public class Sesion {
    //i need an object to put in the second parametrer of setAttribute, so here it is.
    //Sesion should check if the visitor is logged in or not, if not
    //xxx.jsp should redirect to index.jsp
    
    public Boolean logged = false;
    public Consultas consulta;
    private String updateTxt;
    private String Pkey;
    public Boolean superUser=false;
    
    public Sesion(){
    }
    public void setLogged(){
        logged = true;
    }  
    public Boolean getLogged (){
        return logged;
    }
    public void logOut(){
        logged = false;
    }
    public Boolean updateState(String id, String newState){
        return consulta.updateState(id, newState);
    }
    public  Object[] getTable(){
        return this.consulta.getTable();
    }
    public void setAccesToAvoidFutureNon_StaticShit(Consultas consulta){
        //IDK, some spaguetti code i cant remember whyyy
        this.consulta=consulta;
    }
    public void addTodo(String query,String description){
        
        String id = this.consulta.getId();
        String name = this.consulta.getUser();
        String addquery = Cloud.createFile(id,description,query,name);
        query+=",'"+addquery+"')";
        
        this.consulta.addTodo(query);     
        
    }
    public Boolean deleteTodo(String id){
        
        return this.consulta.deleteTodo(id);
    }
    
    
    public String getUser(){
        return this.consulta.getUser();
    }
    public void setUpdateText(String newText){
        System.out.println("TEXT UPDATED");
        this.updateTxt=newText;
    }
    public String getUpdateText(){
        return this.updateTxt;
    }
    public void setID(String id){
        this.Pkey=id;
    }
    public String getID(){
        return this.Pkey;
    }
    public void setSuperUser(String name){
        //aqui y asi añadimos los superusers
        if (name.toLowerCase().equals("sergio")) this.superUser=true;
        if (name.toLowerCase().equals("gol")) this.superUser=true;
        
    }
    public String[] getUpdateList(){
        return Cloud.getUpdateList();
    }
    public String shouldHide(){
        return (superUser)?"":"hidden";
    }
    public String shouldHide(String s){
        
        switch(s){
            case "borrar_ID":
                return "";
            case "actualizar_ST":
                return "";                
            default:
                return "hidden";
        }
    }
    public String shouldDisable(){
        return (superUser)?"":"disabled";
    }
    
           
    //not neccesary anymore!!
    @Override
    public String toString(){
        return (logged)? "true":"false";
    }
}
