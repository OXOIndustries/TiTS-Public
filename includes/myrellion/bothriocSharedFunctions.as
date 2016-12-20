// Addiction is entirely related to receiving Bothrioc eggs.
public function bothriocAddiction():Number
{
	if (flags["BOTHRIOC_ADDICTION"] == undefined) flags["BOTHRIOC_ADDICTION"] = 0;
	return flags["BOTHRIOC_ADDICTION"];
}