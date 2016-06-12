{foreach from=$vysledky key=cislo item=vysledek}
<h3><a href="{$vysledek.url|escape}">{$vysledek.title|escape}</a></h3>
<p>{$vysledek.content|escape}</p>
{/foreach}
