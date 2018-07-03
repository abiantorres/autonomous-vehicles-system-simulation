package es.ull.autonomous_vehicles_system_simulation.high_level_simulation.gui;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.ScrollPaneConstants;

public class TextAreaLogProgram extends JFrame {

	private static final long serialVersionUID = 1L;

    private JTextArea textArea;
     
    public class CustomOutputStream extends OutputStream {
        private JTextArea textArea;
         
        public CustomOutputStream(JTextArea textArea) {
            this.textArea = textArea;
        }
         
        @Override
        public void write(int b) throws IOException {
            // redirects data to the text area
            textArea.append(String.valueOf((char)b));
            // scrolls the text area to the end of data
            textArea.setCaretPosition(textArea.getDocument().getLength());
        }
    }
     
    public TextAreaLogProgram() {
        super("Logs");
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        textArea = new JTextArea(100, 100);
        textArea.setEditable(false);
        PrintStream printStream = new PrintStream(new CustomOutputStream(textArea));
         
        // re-assigns standard output stream and error output stream
        System.setOut(printStream);
        System.setErr(printStream);
        JScrollPane tmp = new JScrollPane(textArea);
        tmp.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        add(tmp);
         
       // setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(1200, 750);
        setLocationRelativeTo(null);    // centers on screen
    }
     
} 