document.addEventListener("DOMContentLoaded", () => {
    const getStartedButton = document.getElementById("getStarted");

    // History stack to track previous pages
    const historyStack = [];

    const mainContent = document.getElementById("mainContent");

    getStartedButton.addEventListener("click", () => {
        // Save the current content to the history stack before navigating
        historyStack.push(mainContent.innerHTML);

        // Navigate to the search screen
        mainContent.innerHTML = `
            <div id="searchScreen">
                <div id="searchSection">
                    <input type="text" id="searchBar" placeholder="Search for a video game...">
                    <button id="searchButton">Search</button>
                    <button id="backButton">&larr; Back</button>
                </div>
                <h2>Find Your Favorite Video Game</h2>
                <div id="categories">
                    <h3>Categories</h3>
                    <ul>
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Adventure</a></li>
                        <li><a href="#">RPG</a></li>
                        <li><a href="#">Sports</a></li>
                        <li><a href="#">Strategy</a></li>
                        <li><a href="#">Puzzle</a></li>
                    </ul>
                </div>
            </div>
        `;

        // Add functionality to the back button
        const backButton = document.getElementById("backButton");
        backButton.addEventListener("click", () => {
            // Check if there's any content in the history stack
            if (historyStack.length > 0) {
                // Load the last page from the stack
                mainContent.innerHTML = historyStack.pop();

                // Reattach event listeners
                reattachListeners();
            }
        });
    });

    // Function to reattach listeners after navigating back
    function reattachListeners() {
        const getStartedButton = document.getElementById("getStarted");

        if (getStartedButton) {
            getStartedButton.addEventListener("click", () => {
                // Save the current content to the history stack before navigating
                historyStack.push(mainContent.innerHTML);

                // Navigate to the search screen
                mainContent.innerHTML = `
                    <div id="searchScreen">
                        <div id="searchSection">
                            <input type="text" id="searchBar" placeholder="Search for a video game...">
                            <button id="searchButton">Search</button>
                            <button id="backButton">&larr; Back</button>
                        </div>
                        <h2>Find Your Favorite Video Game</h2>
                        <div id="categories">
                            <h3>Categories</h3>
                            <ul>
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Adventure</a></li>
                                <li><a href="#">RPG</a></li>
                                <li><a href="#">Sports</a></li>
                                <li><a href="#">Strategy</a></li>
                                <li><a href="#">Puzzle</a></li>
                            </ul>
                        </div>
                    </div>
                `;

                // Add functionality to the back button
                const backButton = document.getElementById("backButton");
                backButton.addEventListener("click", () => {
                    // Check if there's any content in the history stack
                    if (historyStack.length > 0) {
                        // Load the last page from the stack
                        mainContent.innerHTML = historyStack.pop();

                        // Reattach event listeners
                        reattachListeners();
                    }
                });
            });
        }
    }
});
