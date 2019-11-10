import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {

    public static void main(String[] args) {
        Tradutor tradutor = new Tradutor();
        String buffer = null;
        int arg1, arg2, result;
        try {
            try (FileReader fr = new FileReader(args[1])) {
                BufferedReader br = new BufferedReader(fr);

                while ((buffer = br.readLine()) != null) {
                    String[] op = buffer.split(" ");
                    switch (op[0]) {
                        case "param":
                            arg1 = Integer.valueOf(op[1]);
                            tradutor.param(arg1);
                            break;
                        case "procend":
                            tradutor.procEnd();
                            break;
                        case "procbegin":
                            arg1 = Integer.valueOf(op[1]);
                            tradutor.procBegin(arg1);
                            break;
                        case ":=":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            tradutor.atrib(arg1, arg2);
                            break;
                        case "call":
                            arg1 = Integer.valueOf(op[1]);
                            tradutor.call(arg1);
                            break;
                        case "=":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            result = Integer.valueOf(op[3]);
                            tradutor.igual(arg1, arg2, result);
                            break;
                        case "goto":
                            arg1 = Integer.valueOf(op[1]);
                            tradutor.ggoto(arg1);
                            break;
                        case "+":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            result = Integer.valueOf(op[3]);
                            tradutor.mais(arg1, arg2, result);
                            break;
                        case "/":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            result = Integer.valueOf(op[3]);
                            tradutor.div(arg1, arg2, result);
                            break;
                        case "*":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            result = Integer.valueOf(op[3]);
                            tradutor.vezes(arg1, arg2, result);
                            break;
                        case "-":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            result = Integer.valueOf(op[3]);
                            tradutor.menos(arg1, arg2, result);
                            break;
                        case "or":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            result = Integer.valueOf(op[3]);
                            tradutor.ou(arg1, arg2, result);
                            break;
                        case "and":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            result = Integer.valueOf(op[3]);
                            tradutor.e(arg1, arg2, result);
                            break;
                        case "not":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            tradutor.nega(arg1, arg2);
                            break;
                        case "progend":
                            tradutor.progEnd();
                            break;
                        case "progbegin":
                            tradutor.instProgBegin();
                            break;
                        case "gotrue":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            tradutor.goTrue(arg1, arg2);
                            break;
                        case "writechar":
                            arg1 = Integer.valueOf(op[1]);
                            arg2 = Integer.valueOf(op[2]);
                            tradutor.writeChar(arg1, arg2);
                            break;
                        case "readint":
                            arg1 = Integer.valueOf(op[1]);
                            tradutor.readInt(arg1);
                            break;
                        case "writeint":
                            arg1 = Integer.valueOf(op[1]);
                            tradutor.writeInt(arg1);
                            break;
                        default:
                            System.out.println("ERROR: " + buffer + " não é uma instrução válida.");
                            break;
                    }
                }

                br.close();
            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}