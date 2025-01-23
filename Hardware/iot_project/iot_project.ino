#include <WiFi.h>
#include <PubSubClient.h>

// Thông tin WiFi
const char* ssid = "Tên_WiFi";
const char* password = "Mật_khẩu_WiFi";

// Thông tin MQTT
const char* mqtt_server = "Địa_chỉ_IP_MQTT_broker";
const int mqtt_port = 1883; // Cổng mặc định cho MQTT (không mã hóa)
const char* mqtt_user = "Tên_đăng_nhập"; // (Nếu có)
const char* mqtt_password = "Mật_khẩu";  // (Nếu có)

WiFiClient espClient;
PubSubClient client(espClient);

// Hàm callback xử lý tin nhắn từ server MQTT
void callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Nhận tin nhắn từ topic: ");
  Serial.println(topic);
  Serial.print("Nội dung: ");
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println();
}

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
    if (client.connect("ESP32_Client", mqtt_user, mqtt_password)) {
      Serial.println("Kết nối thành công!");
      // Đăng ký topic (subscribe)
      client.subscribe("topic_test");
    } else {
      Serial.print("Kết nối thất bại, mã lỗi: ");
      Serial.print(client.state());
      Serial.println(" Thử lại sau 5 giây...");
      delay(5000);
    }
  }
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
  client.publish("topic_test", "Hello từ ESP32");
  delay(2000);
}
