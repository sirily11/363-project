import java.awt.event.WindowEvent
import java.io.BufferedReader
import java.io.IOException
import java.io.InputStreamReader
import java.util.jar.JarEntry
import java.awt.event.WindowEvent.WINDOW_CLOSING
import javax.swing.*
import javax.swing.JScrollBar




fun main(args: Array<String>) {
    val instructions = "Enter 1 to start/close the mysql \n" +
                       "Enter 2 to start jsp/close server \n" +
                       "Enter 3 to down\n" +
                       "Enter 4 to run the import script"
    if(!System.getProperty("user.dir").contains("363-project")){
        JOptionPane.showMessageDialog(null,"Please put this file under the project folder")
    }else{
        val frame = JFrame("Dialog")
        val label = JTextArea(10,JLabel.CENTER)
        val button = JButton("Close")
        frame.defaultCloseOperation = JFrame.EXIT_ON_CLOSE

        frame.add(label)
        frame.setSize(1200, 400)
        frame.setLocationRelativeTo(null)
        val sp = JScrollPane(label)
        frame.add(sp)

        var run = true
            var selection = ""
            if(!frame.isVisible){
                selection = JOptionPane.showInputDialog(instructions)
            }
            when(selection){
                "1" -> {
                    val pb = ProcessBuilder("docker-compose","up","mysql")
                    pb.redirectErrorStream(true)
                    try{
                        val process = pb.start()
                        val inputStreamReader = BufferedReader(InputStreamReader(process.inputStream))
                        while (inputStreamReader.readLine() != null){
                            frame.isVisible = true // Display the frame
                            if(inputStreamReader.readLine().isNotBlank()){
                                label.text += inputStreamReader.readLine() + "\n"
                            }
                            val vertical = sp.verticalScrollBar
                            vertical.value = vertical.maximum
                        }
                        frame.isVisible = false

                    } catch (e : IOException){
                        JOptionPane.showMessageDialog(null,e.message)
                    }
                }
                "2" -> {
                    val pb = ProcessBuilder("docker-compose","up","jsp")
                    pb.redirectErrorStream(true)
                    try{
                        val process = pb.start()
                        val inputStreamReader = BufferedReader(InputStreamReader(process.inputStream))
                        while (inputStreamReader.readLine() != null){
                            frame.isVisible = true // Display the frame
                            if(inputStreamReader.readLine().isNotBlank()){
                                label.text += inputStreamReader.readLine() + "\n"
                            }
                            val vertical = sp.verticalScrollBar
                            vertical.value = vertical.maximum
                        }
                        frame.isVisible = false
                    } catch (e : IOException){
                        JOptionPane.showMessageDialog(null,e.message)
                    }
                }
                "3" -> {
                    val pb = ProcessBuilder("docker-compose","down")
                    pb.redirectErrorStream(true)
                    try{
                        val process = pb.start()
                        val inputStreamReader = BufferedReader(InputStreamReader(process.inputStream))
                        while (inputStreamReader.readLine() != null){
                            frame.isVisible = true // Display the frame
                            if(inputStreamReader.readLine().isNotBlank()){
                                label.text += inputStreamReader.readLine() + "\n"
                            }
                            val vertical = sp.verticalScrollBar
                            vertical.value = vertical.maximum
                        }
                        frame.isVisible = false
                    } catch (e : IOException){
                        JOptionPane.showMessageDialog(null,e.message)
                    }
                }

                "4" -> {
                    val pb = ProcessBuilder("docker-compose","run","import_data")
                    pb.redirectErrorStream(true)
                    try{
                        val process = pb.start()
                        val inputStreamReader = BufferedReader(InputStreamReader(process.inputStream))
                        while (inputStreamReader.readLine() != null){
                            frame.isVisible = true // Display the frame
                            if(inputStreamReader.readLine().isNotBlank()){
                                label.text += inputStreamReader.readLine() + "\n"
                            }
                            val vertical = sp.verticalScrollBar
                            vertical.value = vertical.maximum
                        }
                        frame.isVisible = false
                    } catch (e : IOException){
                        JOptionPane.showMessageDialog(null,e.message)
                    }
                }
                "5" -> {
                    frame.isVisible = true // Display the frame
                }
                else -> {
                    System.exit(1)

            }
        }
    }
}