package application;
	
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;


public class Main extends Application {
	@Override
	public void start(Stage primaryStage) { 
		try {
			Parent root = FXMLLoader.load(getClass().getResource("/Interfaces/Accueil.fxml"));
			Scene scene = new Scene(root);
			primaryStage.setScene(scene);

			Image Appicon= new Image(getClass().getResourceAsStream("/Images/ProjeQtor.png"));
			primaryStage.getIcons().add(Appicon);
			primaryStage.show();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
