# ktor-new-relic

This project is a backend web application built with the **Ktor** framework in Kotlin. The application exposes two simple RESTful endpoints and is instrumented with **New Relic's APM and Infrastructure agents** to provide comprehensive monitoring.

---

## 🚀 Features
  * **Kotlin & Ktor**: A modern backend built with Kotlin and its Ktor framework.
  * **Gradle**: A build system for dependency management and project automation.
  * **Docker & Docker Compose**: Containerization of the application and the two New Relic agents for easy deployment.
  * **New Relic APM Agent**: Automatic instrumentation with the Java Agent to monitor transaction performance, logs, errors, and latency.
  * **New Relic Infrastructure Agent**: The Infrastructure Agent monitors the health of the container and host, including CPU, memory, and disk usage.
  * **Makefile**: Automation of common tasks like building and running the project.

---

## 🛠️ Prerequisites

Make sure you have the following software installed on your system:

  * **Java Development Kit (JDK) 21**
  * **Docker & Docker Compose**
  * **Git**

---

## 🏁 Getting Started

Follow these steps to get the project up and running on your local machine.

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/sergicanet9/ktor-new-relic.git
    cd ktor-new-relic
    ```

2.  **Configure New Relic:**
    Create a file named `.env` in the root of the project and add your New Relic license key.

    ```bash
    # New Relic License Key for Java Agent (APM)
    NEW_RELIC_LICENSE_KEY="your_license_key_here"

    # New Relic License Key for Infrastructure Agent
    NRIA_LICENSE_KEY="your_license_key_here"
    ```

3.  **Build and run the application:**
    The `Makefile` will handle building the Docker image, running `docker-compose`, and starting the Ktor server along with both New Relic agents.

    ```bash
    make run
    ```

    The application will be available at `http://localhost:8080`.

---

## 📦 API Endpoints

| Method | Endpoint | Description |
| :----- | :------- | :---------- |
| `GET`  | `/`           | Returns a simple message to verify the server is running. |
| `GET`  | `/report` | A simple route that simulates a transaction. Great for testing the New Relic instrumentation. |

---

## 📈 Monitoring with New Relic

This project is fully instrumented with two key New Relic agents:

  * **New Relic Java Agent (APM)**: Monitors the application itself, collecting data on web transactions, external service calls, logs and errors.
  * **New Relic Infrastructure Agent**: Monitors the underlying host and Docker container, providing visibility into resource usage like CPU and memory.

After running `make run` and making a few requests to the API endpoints, you'll be able to see the data in your New Relic account.