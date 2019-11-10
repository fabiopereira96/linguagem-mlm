import assembly.Instrucoes;

import static assembly.Registradores.*;

public class Tradutor {

    private int numArgs = 0;

    public void procEnd() {
        System.out.println(Instrucoes.RETURN + " 0 0 " + numArgs);
    }

    public void procBegin(int arg1) {
        this.numArgs = 0;
    }

    public void atrib(int arg1, int arg2) {
        System.out.println(Instrucoes.LOAD + " " + ST  + " 1 ");
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 1");
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + arg2);
    }

    public void param(int arg1){
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); // LOAD(1) arg1[ST]
        this.numArgs++;
    }

    public void call(int arg1) {
        System.out.println(Instrucoes.LOAD + " " + ST + " " + " 1 " + arg1);
        System.out.println(Instrucoes.CALLI + " 0 0 0");
    }

    public void igual(int arg1, int arg2, int result) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); //LOAD(1) arg1[ST]
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg2); //LOAD(1) arg2[ST]
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 17"); // CALL(0) 17[PB]
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + result);// STORE [ST]
    }

    public void ggoto(int arg1) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); //LOAD(1) arg1[ST]
        System.out.println(Instrucoes.JUMPI + " 0 0 0"); // JUMPI
    }

    public void mais(int arg1, int arg2, int result) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); //LOAD(1) arg1[ST]
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg2); //LOAD(1) arg2[ST]
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 8 "); // CALL(0) 8[PB]
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + result);// STORE [ST]
    }


    public void vezes(int arg1, int arg2, int result) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); //LOAD(1) arg1[ST]
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg2); //LOAD(1) arg2[ST]
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 10 "); // CALL(0) 10[PB]
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + result);// STORE [ST]

    }

    public void menos(int arg1, int arg2, int result) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); //LOAD(1) arg1[ST]
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg2); //LOAD(1) arg2[ST]
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 9 "); // CALL(0) 9[PB]
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + result);// STORE [ST]
    }

    public void div(int arg1, int arg2, int result) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); //LOAD(1) arg1[ST]
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg2); //LOAD(1) arg2[ST]
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 11 "); // CALL(0) 11[PB]
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + result);// STORE [ST]
    }

    public void ou(int arg1, int arg2, int result) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); //LOAD(1) arg1[ST]
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg2); //LOAD(1) arg2[ST]
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 3 "); // CALL(0) 3[PB]
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + result);// STORE [ST]
    }

    public void e(int arg1, int arg2, int result) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); //LOAD(1) arg1[ST]
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg2); //LOAD(1) arg2[ST]
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 3 "); // CALL(0) 3[PB]
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + result);// STORE [ST]
    }

    public void nega(int arg1, int arg2) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); //LOAD(1) arg1[ST]
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 2 "); // CALL(0) 2[PB]
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + arg2); //STORE(1) arg2[ST]
    }

    public void progEnd() {
        System.out.println(Instrucoes.HALT + " 0 0 0"); // HALT
    }

    public void instProgBegin() {}

    public void goTrue(int arg1, int arg2) {
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg2); //LOAD(1) arg2[ST]
        System.out.println(Instrucoes.JUMPIF + " " + CB + " 1 " + arg1); //JUMPIF(1) arg1[CB]
    }

    public void writeChar(int arg1, int arg2) {
        int i = 0;
        System.out.println(Instrucoes.LOAD + " " + ST + " 1 " + arg1); // LOAD(1) arg1[ST]
        while (i < arg2) {
            System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 22"); // CALL(0) 22[PB]
            System.out.println(Instrucoes.LOADL + " 0 0 1"); // LOADL 1
            System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 14"); // CALL(0) 14[PB]
            i++;
        }
    }

    public void readInt(int arg1) {
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 25"); // CALL(0) 25[PB]
        System.out.println(Instrucoes.STORE + " " + ST + " 1 " + arg1); // STORE(1) arg1[ST]
    }

    public void writeInt(int arg1) {
        System.out.println(Instrucoes.LOAD + " " + ST + " " + arg1); // LOAD(1) arg1[ST]
        System.out.println(Instrucoes.CALL + " " + PB + " " + CB + " 26"); // CALL(0) 26[PB]
    }

}
