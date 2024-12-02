document.addEventListener("DOMContentLoaded", () => {
    const mainContent = document.getElementById("mainContent");
    const historyStack = []; // History stack to track previous pages

    // Mock data
    const mockData = [
        { GameID: 1, Name: "The Legend of Zelda", Genre: "Adventure", Price: 59.99, AvailabilityStatus: 1 },
        { GameID: 2, Name: "Call of Duty", Genre: "Action", Price: 49.99, AvailabilityStatus: 0 },
        { GameID: 3, Name: "FIFA 24", Genre: "Sports", Price: 39.99, AvailabilityStatus: 1 },
        { GameID: 4, Name: "The Sims 4", Genre: "Simulation", Price: 19.99, AvailabilityStatus: 1 },
        { GameID: 5, Name: "Minecraft", Genre: "Sandbox", Price: 29.99, AvailabilityStatus: 0 },
        { GameID: 6, Name: "Mock Game 6", Genre: "Adventure", Price: 55.00, AvailabilityStatus: 1 },
        { GameID: 7, Name: "Mock Game 7", Genre: "Sports", Price: 45.00, AvailabilityStatus: 0 },
        { GameID: 8, Name: "Mock Game 8", Genre: "Simulation", Price: 30.00, AvailabilityStatus: 1 },
        { GameID: 9, Name: "Mock Game 9", Genre: "Sandbox", Price: 40.00, AvailabilityStatus: 0 },
        { GameID: 10, Name: "Mock Game 10", Genre: "Action", Price: 25.00, AvailabilityStatus: 1 },
        { GameID: 11, Name: "Mock Game 11", Genre: "Adventure", Price: 35.00, AvailabilityStatus: 0 },
        { GameID: 12, Name: "Mock Game 12", Genre: "Sports", Price: 55.00, AvailabilityStatus: 1 },
        { GameID: 13, Name: "Mock Game 13", Genre: "Simulation", Price: 45.00, AvailabilityStatus: 0 },
        { GameID: 14, Name: "Mock Game 14", Genre: "Sandbox", Price: 20.00, AvailabilityStatus: 1 },
        { GameID: 15, Name: "Mock Game 15", Genre: "Action", Price: 30.00, AvailabilityStatus: 1 },
        { GameID: 16, Name: "Mock Game 16", Genre: "Adventure", Price: 40.00, AvailabilityStatus: 1 },
        { GameID: 17, Name: "Mock Game 17", Genre: "Sports", Price: 60.00, AvailabilityStatus: 0 },
        { GameID: 18, Name: "Mock Game 18", Genre: "Simulation", Price: 25.00, AvailabilityStatus: 1 },
        { GameID: 19, Name: "Mock Game 19", Genre: "Sandbox", Price: 30.00, AvailabilityStatus: 0 },
        { GameID: 20, Name: "Mock Game 20", Genre: "Action", Price: 20.00, AvailabilityStatus: 1 },
        { GameID: 21, Name: "Mock Game 21", Genre: "Adventure", Price: 50.00, AvailabilityStatus: 1 },
        { GameID: 22, Name: "Mock Game 22", Genre: "Sports", Price: 35.00, AvailabilityStatus: 0 },
        { GameID: 23, Name: "Mock Game 23", Genre: "Simulation", Price: 40.00, AvailabilityStatus: 1 },
        { GameID: 24, Name: "Mock Game 24", Genre: "Sandbox", Price: 55.00, AvailabilityStatus: 0 },
        { GameID: 25, Name: "Mock Game 25", Genre: "Action", Price: 60.00, AvailabilityStatus: 1 },
    ];


     // Function to navigate to the game library table
    function navigateToSearchScreen() {
        historyStack.push(mainContent.innerHTML); // Save current content to history

        // Create the table structure
        let tableHTML = `
            <h2>Game Library</h2>
            <table>
                <thead>
                    <tr>
                        <th>GameID</th>
                        <th>Name</th>
                        <th>Genre</th>
                        <th>Price ($)</th>
                        <th class="checkbox-center">Available</th>
                        <th>Lending Date</th>
                        <th>Return Date</th>
                    </tr>
                </thead>
                <tbody>
                    ${mockData
                        .map(
                            (game, index) => `
                            <tr>
                                <td>${game.GameID}</td>
                                <td>${game.Name}</td>
                                <td>${game.Genre}</td>
                                <td>${game.Price.toFixed(2)}</td>
                                <td class="checkbox-center">
                                    <input type="checkbox" data-index="${index}" ${
                                        game.AvailabilityStatus ? "checked" : ""
                                    }>
                                </td>
                                <td>${game.LendedDate || "N/A"}</td>
                                <td>${game.ReturnDate || "N/A"}</td>
                            </tr>
                        `
                        )
                        .join("")}
                </tbody>
            </table>
            <button id="backButton">&larr; Back</button>
        `;

        mainContent.innerHTML = tableHTML;

        attachBackButtonListener(); // Attach listener to back button
        attachCheckboxListeners(); // Attach listeners to checkboxes
    }

    // Function to toggle availability status
    function toggleAvailability(index) {
        const game = mockData[index];
        game.AvailabilityStatus = !game.AvailabilityStatus;

        // Update dates based on availability
        if (game.AvailabilityStatus) {
            game.LendedDate = null;
            game.ReturnDate = null;
        } else {
            const today = new Date();
            game.LendedDate = today.toISOString().split("T")[0]; // Today's date
            game.ReturnDate = new Date(today.setDate(today.getDate() + 30)) // 30 days from now
                .toISOString()
                .split("T")[0];
        }

        // Re-render the table
        navigateToSearchScreen();
    }

    // Attach event listeners to the checkboxes
    function attachCheckboxListeners() {
        const checkboxes = document.querySelectorAll("input[type='checkbox']");
        checkboxes.forEach((checkbox) => {
            checkbox.addEventListener("click", (event) => {
                const index = event.target.dataset.index;
                toggleAvailability(index);
            });
        });
    }

    // Attach event listener to the back button
    function attachBackButtonListener() {
        const backButton = document.getElementById("backButton");
        if (backButton) {
            backButton.addEventListener("click", navigateBack);
        }
    }

    // Function to go back to the previous screen
    function navigateBack() {
        if (historyStack.length > 0) {
            mainContent.innerHTML = historyStack.pop();
            const getStartedButton = document.getElementById("getStarted");
            if (getStartedButton) {
                getStartedButton.addEventListener("click", navigateToSearchScreen);
            }
        }
    }

    // Attach event listener to the "Get Started" button
    const getStartedButton = document.getElementById("getStarted");
    if (getStartedButton) {
        getStartedButton.addEventListener("click", navigateToSearchScreen);
    }
});