# Importing necessary libraries for MQTT and data handling
import paho.mqtt.client as mqtt
import json
import time

# Constants for MQTT Broker configuration
BROKER = "mqtt.example.com"  # Replace with your MQTT Broker address
TOPIC = "energy/meter/data"  # MQTT topic for publishing energy data
METER_ID = "meter_001"       # Unique identifier for the smart meter

# Function to simulate energy data generation for a smart meter
def generate_energy_data():
    """
    Simulates energy production and consumption data for an IoT smart meter.
    This data mimics real-world energy transactions for blockchain integration.
    Returns:
        dict: A dictionary containing simulated energy data.
    """
    return {
        "meter_id": METER_ID,                            # Unique identifier for the meter
        "timestamp": int(time.time()),                  # Current timestamp
        "energy_consumed": round(10 + (5 * time.time() % 1), 2),  # Simulated energy consumed (in kWh)
        "energy_produced": round(8 + (4 * time.time() % 1), 2),    # Simulated energy produced (in kWh)
    }

# Callback function for successful MQTT connection
def on_connect(client, userdata, flags, rc):
    """
    Callback triggered upon successful connection to the MQTT broker.
    Args:
        client: The MQTT client instance.
        userdata: User-defined data of any type.
        flags: Response flags sent by the broker.
        rc: The connection result code.
    """
    if rc == 0:
        print("Successfully connected to the MQTT Broker!")
    else:
        print(f"Connection failed with return code {rc}.")

# Function to publish energy data to the MQTT broker
def publish_energy_data():
    """
    Connects to an MQTT broker, generates simulated energy data, 
    and publishes it to the specified topic at regular intervals.
    """
    # Initialize the MQTT client
    client = mqtt.Client()
    client.on_connect = on_connect  # Assign the on_connect callback

    # Connect to the MQTT broker
    try:
        client.connect(BROKER, 1883, 60)  # Default port for MQTT is 1883
        print("Connecting to MQTT broker...")
    except Exception as e:
        print(f"Error connecting to MQTT broker: {e}")
        return

    # Start the client loop in the background to handle network traffic
    client.loop_start()

    # Continuous data publishing loop
    try:
        while True:
            # Generate simulated energy data
            data = generate_energy_data()

            # Convert the data dictionary to a JSON string
            payload = json.dumps(data)

            # Publish the JSON payload to the specified MQTT topic
            result = client.publish(TOPIC, payload)

            # Check if the message was published successfully
            status = result[0]
            if status == 0:
                print(f"Data successfully published: {payload}")
            else:
                print(f"Failed to publish data to topic {TOPIC}")

            # Delay for 5 seconds before sending the next data packet
            time.sleep(5)

    except KeyboardInterrupt:
        # Graceful exit on keyboard interruption (Ctrl+C)
        print("Stopping data publishing...")
        client.loop_stop()
        client.disconnect()

if __name__ == "__main__":
    # Entry point of the script
    publish_energy_data()
