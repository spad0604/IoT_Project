#include <WiFi.h>
#include <PubSubClient.h>

// Thông tin WiFi
const char* ssid = "Pixel 4XL";
const char* password = "06042004";

// Thông tin MQTT
const char* mqtt_server = "192.168.14.141"; 
const int mqtt_port = 1883; 
const char* mqttTopic = "esp32_pub"; 
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
    // Thử kết nối
    if (client.connect("ESP32_Client")) {
      Serial.println("Kết nối thành công!");
      // Đăng ký topic (subscribe)
      client.subscribe("esp32_client");
    } else {
      Serial.print("Kết nối thất bại, mã lỗi: ");
      Serial.print(client.state());
      Serial.println(" Thử lại sau 5 giây...");
      delay(5000);
    }
  }
}

void sendMessage(int led1, int led2, double temperature, double humidity) {
    char message[200]; 
    sprintf(message, "{\"deviceId\": 1, \"account\": \"giapbacvan\", \"led1\": %d, \"led2\": %d, \"humidity\": %.2f, \"temperature\": %.2f}",
            led1, led2, humidity, temperature);

    client.publish("esp32/led", message);
}


void callback(char* mqttTopic, byte* payload, unsigned int length) {
  Serial.print("Message arrived on topic: ");
  Serial.print(mqttTopic);
  Serial.print(". Message: ");
  
  // In payload nhận được
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
}

void setup() {
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, mqtt_port);
  client.setCallback(callback);
}


void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();
  // Gửi dữ liệu (publish) đến topic
  sendMessage(0, 0, 0.0, 0.0);
  delay(2000);
}
