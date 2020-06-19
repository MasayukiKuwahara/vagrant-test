<html>
<head><title>test tasuLife</title></head>
<body>
<?php
echo "PostgreSQL接続テスト", PHP_EOL;
$link = pg_connect("host=localhost dbname=postgres user=postgres");
if (!$link) {
echo "DBに接続できません。";
} else {
echo "DB接続成功！";
}
pg_close($link);
?>
</body>
</html>