public class RunAuteczkoBatch {
    public static void Run(){
        Id batchJobId = Database.executeBatch(new AuteczkoBatch());
    }
}