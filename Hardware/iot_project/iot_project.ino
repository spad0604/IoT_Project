#include <WiFi.h>
#include <DHT11.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>

// Thông tin WiFi
const char* ssid = "Pad 2022";
const char* password = "06042004";

// Thông tin MQTT
const char* mqtt_server = "42.118.110.157";
const int mqtt_port = 1883;
const char* mqttTopic = "esp32/led";
unsigned long long timeMillis;
WiFiClient espClient;
PubSubClient client(espClient);

//Khai báo cảm biến DHT11 ở chân 13
DHT11 dht11(13);

double temperature, humidity;

// Kết nối WiFi
void setup_wifi() {
  delay(10);
  Serial.println("Kết nối WiFi...");
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi đã kết nối");
  Serial.print("Địa chỉ IP: ");
  Serial.println(WiFi.localIP());
}

// Kết nối MQTT server
void reconnect() {
  while (!client.connected()) {
    Serial.print("Đang kết nối MQTT...");
    if (client.connect("esp32_client")) {  // Dùng 1 client duy nhất
      Serial.println("Kết nối thành công!");
      client.subscribe("esp32_pub");  // Đăng ký nhận tin nhắn từ topic
    } else {
      Serial.print("Kết nối thất bại, mã lỗi: ");
      Serial.print(client.state());
      Serial.println(" Thử lại sau 5 giây...");
      delay(5000);
    }
  }
}

// Gửi dữ liệu (publish)
void sendMessage(int led1, int led2, double temperature, double humidity) {
  char message[200];
  sprintf(message, "{\"deviceId\": 1, \"account\": \"giapbacvan\", \"led1\": %d, \"led2\": %d, \"humidity\": %.2f, \"temperature\": %.2f}",
          led1, led2, humidity, temperature);

  client.publish(mqttTopic, message);
}

// Callback khi nhận tin nhắn
void callback(char* topic, byte* payload, unsigned int length) {

  char message[length + 1];
  for (int i = 0; i < length; i++) {
    message[i] = (char)payload[i];
  }
  message[length] = '\0';  // Đảm bảo chuỗi kết thúc đúng

  // Phân tích chuỗi JSON
  StaticJsonDocument<200> doc;
  DeserializationError error = deserializeJson(doc, message);

  if (error) {
    Serial.print("Không thể phân tích JSON: ");
    Serial.println(error.f_str());
    return;
  }

  // Trích xuất các giá trị từ JSON
  int deviceId = doc["deviceId"];
  int led1 = doc["led1"];
  int led2 = doc["led2"];

  if (deviceId == 1) {
    ledController(led1, led2);
  }
}

void ledController(int led1, int led2) {
  digitalWrite(2, led1);
}

void readData() {
  int result = dht11.readTemperatureHumidity(temperature, humidity);

  if (result == 0) {
    Serial.print("Temperature: ");
    Serial.print(temperature);
    Serial.print(" °C\tHumidity: ");
    Serial.print(humidity);
    Serial.println(" %");
  } else {
    // Print error message based on the error code.
    Serial.println(DHT11::getErrorString(result));
  }
}

void setup() {
  timeMillis = millis();
  Serial.begin(115200);
  setup_wifi();
  pinMode(2, OUTPUT);
  client.setServer(mqtt_server, mqtt_port);
  client.setCallback(callback);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();  // Đảm bảo cả việc gửi và nhận tin nhắn

  // Gửi dữ liệu mỗi 5 phút (publish)
  if (millis() - timeMillis > 300000) {
    readData();
    sendMessage(2, 2, temperature, humidity);  // Gửi dữ liệu
    timeMillis = millis();
  }
}

//Quy ước, nếu giá trị led1 và led2 = 2 thì là message để update dữ liệu thời tiết còn không thì là update trạng thái đèn
