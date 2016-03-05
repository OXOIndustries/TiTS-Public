<?php

$latest_time = 0;
$latest_filename = '';

$d = dir(".");
while (false !== ($entry = $d->read()))
{
	if (is_file($entry) && strpos($entry, "TiTS_") !== false && strpos($entry, "InternalPreloader") !== false && strpos($entry, ".swf") !== false && filemtime($entry) > $latest_time)
	{
		$latest_time = filemtime($entry);
		$latest_filename = $entry;
	}
}

if (is_file($latest_filename))
{
	if (isset($_SERVER["HTTP_IF_MODIFIED_SINCE"]) && strtotime($_SERVER["HTTP_IF_MODIFIED_SINCE"]) == filemtime($latest_filename))
	{
		header($_SERVER["SERVER_PROTOCOL"] . " 304 Not Modified");
		header("Cache-Control: public", true);
		header("Last-Modified: " . gmdate("D, d M Y H:i:s \G\M\T", filemtime($latest_filename)), true);
		header("Pragma: cache", true);
		exit;
	}
	else
	{
		header($_SERVER["SERVER_PROTOCOL"] . " 200 OK");
		header("Cache-Control: public", true);
		header("Content-Type: application/x-shockwave-flash", true);
		header("Accept-Ranges: bytes", true);
		header("Content-Length: " . filesize($latest_filename), true);
		header("Last-Modified: " . gmdate("D, d M Y H:i:s \G\M\T", filemtime($latest_filename)), true);
		header("Connection: keep-alive", true);
		header("Content-Disposition: inline; filename=$latest_filename");
		readfile($latest_filename);
	}
}

?>