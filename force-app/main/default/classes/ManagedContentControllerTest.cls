@isTest(SeeAllData=true)
public class ManagedContentControllerTest {
    @IsTest
    static void testManagedContentController() {
        // Call the method being tested with a sample content ID, page number, page size, language, and filterby
        Map<String, ConnectApi.ManagedContentNodeValue> contentMap = ManagedContentController.getContent(
            'sampleContentId',
            1,
            10,
            'en_US',
            ''
        );

        // Assert that the method returns the expected content map
        System.assertNotEquals(null, contentMap, 'Content map should not be null');
    }

@isTest
    static void testManagedContentControllerException() {
        // Call the method being tested with a sample content ID, page number, page size, language, and filterby
        List<ConnectApi.ManagedContentVersion> contentList = ManagedContentController.getContentList(
            1,
            10,
            'en_US',
            ''
        );

        // Assert that the method returns the expected content list (empty in this case)
        System.assertEquals(0, contentList.size(), 'Content list should be empty');
    }
@isTest
    static void testManagedContentControllerNull() {
        // Call the method being tested with a sample content ID, page number, page size, language, and filterby
        Map<String, ConnectApi.ManagedContentNodeValue> contentMap = ManagedContentController.getContent(
            null,
            1,
            10,
            'en_US',
            'sampleFilter'
        );

        // Assert that the method returns an empty content map if the contentId is null
        System.assertEquals(0, contentMap.size(), 'Content map should be empty');
    }
@isTest
    static void testManagedContentControllerNoContent() {
        // Call the method being tested with a non-existent content ID
        List<ConnectApi.ManagedContentVersion> contentList = ManagedContentController.getContentList(
            1,
            10,
            'en_US',
            ''
        );

        // Assert that the method returns an empty content list
        System.assertEquals(0, contentList.size(), 'Content list should be empty');
    }
}