<h1>183 Gradebook</h1>
<pre>
<?php
// Connect to the MySQL db
$conn = mysql_connect("localhost", "root") or die(mysql_error());
// Select the cs183 database
mysql_select_db("cs183") or die(mysql_error());
// SQL query
$result = mysql_query("select * from grades order by grade desc;") or die(mysql_error());
// Display the result
while ($row = mysql_fetch_assoc($result)) {
printf("%10s: %d\n", $row["name"], $row["grade"]);
}
// Free up resources
mysql_free_result($result);
mysql_close($conn);
?>
</pre>    
