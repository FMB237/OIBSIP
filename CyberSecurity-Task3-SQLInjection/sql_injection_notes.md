# 📝 SQL Injection Technical Notes

## 🔍 What is SQL Injection (SQLi)?
SQL Injection is a vulnerability where an attacker can interfere with the queries that an application makes to its database. It typically occurs when an application uses unvalidated user input directly in a SQL query.

## 🛠️ The Vulnerable Code (Conceptual)
In DVWA (Low Security), the PHP code looks something like this:
```php
$id = $_GET['id'];
$query = "SELECT first_name, last_name FROM users WHERE user_id = '$id';";
```
Because `$id` is not sanitized, if I enter `' OR '1'='1`, the query becomes:
`SELECT first_name, last_name FROM users WHERE user_id = '' OR '1'='1';`
Since `'1'='1'` is always **TRUE**, the database returns every single record in the table.

##  Attack Vectors Used in this Task

### 1. The "Always True" Bypass
- **Payload**: `' OR '1'='1`
- **Goal**: Retrieve all records from the current table.
- **Result**: The application displays all users instead of just one.

### 2. UNION-Based SQLi (Data Extraction)
- **Payload**: `' UNION SELECT user, password FROM users -- `
- **Goal**: Steal data from other tables or columns.
- **Explanation**: 
    - `UNION` combines the result of the original query with a new query.
    - `SELECT user, password FROM users` tells the DB to give us the credentials.
    - `-- ` (with a space) comments out the rest of the original query to prevent syntax errors.

## 🛡️ How to Prevent SQLi (The Fix)
To stop these attacks, developers should use **Prepared Statements (Parameterized Queries)**.

**❌ Bad (Vulnerable):**
```php
$db->query("SELECT * FROM users WHERE id = " . $_GET['id']);
```

**✅ Good (Secure):**
```php
$stmt = $pdo->prepare('SELECT * FROM users WHERE id = :id');
$stmt->execute(['id' => $_GET['id']]);
$user = $stmt->fetch();
```
By using parameters, the database treats the input as **literal data**, not as executable code.
