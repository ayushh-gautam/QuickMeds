class MyApi {
  static String baseUrl = "https://qm.shellcode.cloud";
  static String apiKey = 'RGVlcGFrS3-VzaHdhaGE5Mzk5MzY5ODU0-QWxoblBvb2ph';

  static Map<String, String> getHeaders = {
    'accept': 'application/json',
    'X-Authorization': 'RGVlcGFrS3-VzaHdhaGE5Mzk5MzY5ODU0-QWxoblBvb2ph',
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE2NzQ1Mzg1LCJleHAiOjE3NDgzMDI5ODV9.5wRlYbaliLtMW57h7YCASiJZsESXS1Ouo6i48zuIyTI",
    // "Authorization":
    //     "Bearer ${await PreferenceManager.get().getAccessToken()}"
    // !Uncomment this line later on
  };

  static Map<String, String> postHeaders = {
    'Content-Type': 'application/json',
    'X-Authorization': 'RGVlcGFrS3-VzaHdhaGE5Mzk5MzY5ODU0-QWxoblBvb2ph',
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE2NzQ1Mzg1LCJleHAiOjE3NDgzMDI5ODV9.5wRlYbaliLtMW57h7YCASiJZsESXS1Ouo6i48zuIyTI",
    // "Authorization":
    //     "Bearer ${await PreferenceManager.get().getAccessToken()}"
    // !Uncomment this line later on
  };
}
