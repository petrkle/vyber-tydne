{$envelope.hlavicka}
{foreach from=$vysledky key=cislo item=vysledek}
<div class="vyber">
<h2><a href="{$vysledek.url|escape}">{$vysledek.title|escape}</a></h2>
<p>{$vysledek.content}</p>
</div>
{/foreach}
{$envelope.paticka}
