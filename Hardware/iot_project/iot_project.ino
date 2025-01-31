#include <WiFi.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>

// Thông tin WiFi
const char* ssid = "Pad 2022";
const char* password = "06042004";

// Thông tin MQTT
const char* mqtt_server = "192.168.216.141"; 
const int mqtt_port = 1883; 
const char* mqttTopic = "esp32/led"; 
unsigned long long timeMillis;
WiFiClient espClient;
PubSubClient client(espClient);

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
    if (client.connect("esp32_client")) { // Dùng 1 client duy nhất
      Serial.println("Kết nối thành công!");
      client.subscribe("esp32_pub"); // Đăng ký nhận tin nhắn từ topic
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
  Serial.print("Message arrived on topic: ");
  Serial.print(topic);
  Serial.print(". Message: ");
  
  // Chuyển đổi payload thành chuỗi
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
  double humidity = doc["humidity"];
  double temperature = doc["temperature"];

  // In kết quả ra Serial Monitor
  Serial.print("deviceId: ");
  Serial.println(deviceId); 
  Serial.print("led1: ");
  Serial.println(led1);
  Serial.print("led2: ");
  Serial.println(led2);
  Serial.print("humidity: ");
  Serial.println(humidity);
  Serial.print("temperature: ");
  Serial.println(temperature);
}


void setup() {
  timeMillis = millis();
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, mqtt_port);
  client.setCallback(callback);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop(); // Đảm bảo cả việc gửi và nhận tin nhắn

  // Gửi dữ liệu mỗi 5 giây (publish)
  if (millis() - timeMillis > 5000) {
    sendMessage(0, 0, 0.0, 0.0); // Gửi dữ liệu
    timeMillis = millis();
  }
}
