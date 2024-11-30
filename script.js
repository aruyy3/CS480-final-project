document.addEventListener("DOMContentLoaded", () => {
    const mainContent = document.getElementById("mainContent");
    const historyStack = []; // History stack to track previous pages

    // Function to fetch games by genre
    function fetchGamesByGenre(genre) {
        fetch(`http://localhost:3000/search?genre=${encodeURIComponent(genre)}`)
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Failed to fetch games");
                }
                return response.json();
            })
            .then((games) => {
                displayGames(games, genre);
            })
            .catch((error) => {
                console.error("Error fetching games by genre:", error);
                mainContent.innerHTML = `<p>Failed to load games for the genre "${genre}".</p>`;
            });
    }
    
    // Function to display the fetched games
    function displayGames(games, genre) {
        historyStack.push(mainContent.innerHTML); // Save the current content to history
        if (games.length === 0) {
            mainContent.innerHTML = `
                <h3>No games found for "${genre}"</h3>
                <button id="backButton">&larr; Back</button>
            `;
        } else {
            mainContent.innerHTML = `
                <h3>Games in "${genre}" Genre</h3>
                <ul>
                    ${games
                        .map(
                            (game) => `
                            <li>
                                <strong>${game.Title}</strong> (${game.Genre})
                                <br>Developer: ${game.Developer}
                                <br>Publisher: ${game.Publisher}
                                <br>Release Year: ${game.ReleaseYear}
                            </li>`
                        )
                        .join("")}
                </ul>
                <button id="backButton">&larr; Back</button>
            `;
        }
    
        document.getElementById("backButton").addEventListener("click", navigateBack);
    }
    

    // Function to navigate to the search screen
    function navigateToSearchScreen() {
        historyStack.push(mainContent.innerHTML); // Save current content to history
    
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
                        <li><a href="#" data-genre="Action">Action</a></li>
                        <li><a href="#" data-genre="Adventure">Adventure</a></li>
                        <li><a href="#" data-genre="RPG">RPG</a></li>
                        <li><a href="#" data-genre="Sports">Sports</a></li>
                        <li><a href="#" data-genre="Strategy">Strategy</a></li>
                        <li><a href="#" data-genre="Puzzle">Puzzle</a></li>
                    </ul>
                </div>
            </div>
        `;
        attachSearchAndCategoryListeners(); // Attach listeners for search and categories
        attachBackButtonListener(); // Attach listener to back button
    }
    

    // Function to go back to the previous screen
    function navigateBack() {
        if (historyStack.length > 0) {
            mainContent.innerHTML = historyStack.pop();
            reattachListeners(); // Reattach necessary listeners after restoring content
        }
    }

    // Attach event listeners for search and category links
    function attachSearchAndCategoryListeners() {
        const searchButton = document.getElementById("searchButton");
        const searchBar = document.getElementById("searchBar");
        const categoryLinks = document.querySelectorAll("#categories a");

        // Search button click listener
        searchButton.addEventListener("click", () => {
            const genre = searchBar.value.trim();
            if (!genre) {
                alert("Please enter a genre to search.");
                return;
            }
            fetchGamesByGenre(genre);
        });

        // Category links click listener
        categoryLinks.forEach((link) => {
            link.addEventListener("click", (event) => {
                event.preventDefault();
                const genre = event.target.dataset.genre; // Get genre from data attribute
                fetchGamesByGenre(genre);
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

    // Reattach the "Get Started" button listener and others
    function reattachListeners() {
        const getStartedButton = document.getElementById("getStarted");
        if (getStartedButton) {
            getStartedButton.addEventListener("click", navigateToSearchScreen);
        }

        attachBackButtonListener(); // Attach back button if it exists
        attachSearchAndCategoryListeners(); // Reattach category listeners
    }

    // Initial "Get Started" button click listener
    reattachListeners();
});
