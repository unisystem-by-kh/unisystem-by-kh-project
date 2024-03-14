document.getElementById("eventForm").addEventListener("submit", function(event) {
            event.preventDefault();
            const formData = new FormData(this);
            const eventDetails = {
                summary: formData.get("summary"),
                startDateTime: formData.get("startDateTime"),
                endDateTime: formData.get("endDateTime")
            };
            fetch("/admin/calender", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(eventDetails)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Failed to create event");
                }
                alert("Event created successfully!");
            })
            .catch(error => {
                console.error(error);
                alert("Failed to create event");
            });
        });