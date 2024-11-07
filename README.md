# CS480-final-project
Video Game Review system


Project Requirements
Overview:
The goal of this system is to support the management and lending of video games within a library context. The application will handle game inventory, track borrowing by clients, and allow staff to manage both client information and game data. There are two primary user roles within this application: librarians and clients.

Librarians will manage inventory, register clients, and track game lending. Clients will have the ability to search for games, check out available titles, and manage overdue fees, with the ability to make payments directly through the system. This system's data model should be scalable to support the storage of large numbers of game titles with extensive details, and to handle high transaction volumes due to lending activities.

User Roles and Actions
Librarians

Game Management: Librarians can add new games, update game details (e.g., adding additional copies), and remove games if all copies are returned and the title is no longer needed in the library's inventory.
Client Registration: Librarians can register clients by recording their name, contact details, address, and payment information. Updates and deletions to client accounts are also within librarian privileges.
Game Lending Tracking: Librarians can retrieve data on current and past game checkouts for tracking and auditing purposes.
Clients

Game Search: Clients can search for games in the library’s inventory using criteria such as title, developer, release year, and genre. The search feature supports filtering, sorting, and limiting results.
Borrowing Games: Clients can borrow games if available. Each checkout lasts four weeks. Clients can renew a game or return it when finished.
Fee Management: Clients pay overdue fees through the system, using a payment method stored on their account.
Payment Management: Clients can add, update, or remove payment methods associated with their account.
Data Requirements
Librarians

Attributes: Name, Employee ID, Email, Salary
Librarians are identified by their Employee ID.
Clients

Attributes: Name, Client ID, Email, Address, Payment Methods
Clients are identified by a unique Client ID and email.
Video Games

Attributes: Game ID, Title, Developer, Publisher, Genre, Release Year, Platform, Number of Copies
Video games are identified by their Game ID. Different copies of a game are tracked by copy number, and availability status is updated when a copy is borrowed.
Game Lending Transactions

Attributes: Transaction ID, Game Copy ID, Client ID, Borrow Date, Due Date, Return Date, Fee
Each game transaction records the borrowing period, client details, and any fees accrued for late returns.
