package com.scv

import io.ktor.server.application.*
import io.ktor.server.application.log
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Application.configureRouting() {
    routing {
        get("/") {
            call.application.log.info("The root route has been reached!")
            call.respondText("Ktor server is running")
        }

        get("/report") {
            call.application.log.info("Generating a report log and sending it to New Relic APM with automatic instrumentation...")

            // Simulate a blocking operation that takes 1 second
            Thread.sleep(1000L)

            call.respondText("Report generated successfully!")
        }
    }
}
