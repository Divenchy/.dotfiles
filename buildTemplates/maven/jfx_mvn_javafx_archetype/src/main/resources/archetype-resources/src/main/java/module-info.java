module org._12team12 {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;

    opens org._12team12 to javafx.fxml;
    exports org._12team12;
}

