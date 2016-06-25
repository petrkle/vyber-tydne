{$envelope.hlavicka}
{include file="form.tpl"}
{foreach from=$vysledky key=cislo item=vysledek}
<div class="vyber">
<h2><a href="{$vysledek.url}">{$vysledek.datum}</a></h2>
<h3><a href="{$vysledek.link_url|escape}">{$vysledek.link_text}</a></h3>
<p>{$vysledek.author}</p>
</div>
{/foreach}
{$envelope.paticka}
