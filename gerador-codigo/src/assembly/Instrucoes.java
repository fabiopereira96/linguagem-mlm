package assembly;

public interface Instrucoes {
    int LOAD   = 0;
    int LOADL  = 3;
    int STORE  = 4;
    int CALL   = 6;
    int CALLI  = 7;
    int RETURN = 8;
    int JUMPI  = 12;
    int JUMPIF = 13;
    int HALT   = 14;
}
