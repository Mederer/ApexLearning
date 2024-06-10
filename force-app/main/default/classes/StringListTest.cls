public class StringListTest {
    public static List<String> generateStringList(Integer numStrings) {
        String[] results = new List<String>();
        for (Integer i = 0; i < numStrings; i++) {
            results.add('Test ' + i);
        }
        return results;
    }
}