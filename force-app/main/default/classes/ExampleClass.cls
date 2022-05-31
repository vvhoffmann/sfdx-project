public with sharing class ExampleClass {
    public static Integer myValue = 0;  //Class Member variable
    public static String myString = ''; //Class Member variable

    public static Integer getCalculatedValue () {
        myValue = myValue+10;
        return myValue;
    }

    public static void helloWorld(){
        System.debug('Hello');
    }
}
