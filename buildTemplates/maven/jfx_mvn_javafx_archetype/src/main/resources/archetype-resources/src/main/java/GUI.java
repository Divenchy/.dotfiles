package org._12team12;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class GUI extends Application {
    
    Stage window;

    public static void main(String[] args) {
        launch(args);
    }


    // Example of a login screen
    @Override
    public void start(Stage primaryStage) throws Exception {
        window = primaryStage;
        window.setTitle("WEOWINDOW");


        Scene scene = new Scene(vBox);
        window.setScene(scene);
        window.show();
    }

}

