let eventSource = null;
let reconnectTimeout = null;
const reconnectDelay = 2000; // Delay before attempting to reconnect in milliseconds
export function setupSSE() {
    eventSource = new EventSource('/api/notifications');
    eventSource.addEventListener('update', function (event) {
        resetTimeout();
        const data = JSON.parse(event.data);
        console.log("JS", data);
        app.ports.ssmReceiver.send(data);
    })
    eventSource.addEventListener('ping', function (event) {
        resetTimeout();
        // Todo: also send pings so the app knows the connection is still alive
    })

    eventSource.onerror = function (event) {
        console.log("ERROR", event);

    }

    // Set up a timeout to check for inactivity
    resetTimeout();
}

function resetTimeout() {
    if (reconnectTimeout) {
        clearTimeout(reconnectTimeout);
    }
    reconnectTimeout = setTimeout(reconnect, reconnectDelay);
}

function reconnect() {
    if (reconnectTimeout) {
        clearTimeout(reconnectTimeout);
    }
    if (eventSource) {
        eventSource.close();
        eventSource = null;
    }


    setupSSE();
}