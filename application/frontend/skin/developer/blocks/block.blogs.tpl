{**
 * Блок со списоком блогов
 *
 * @styles css/blocks.css
 *}

{extends 'blocks/block.aside.base.tpl'}

{block 'block_title'}{$aLang.block_blogs}{/block}
{block 'block_type'}blogs{/block}

{block 'block_nav'}
	<ul class="nav nav-pills js-block-nav" data-type="tabs">
		<li data-type="tab" data-tab-url="{router page='ajax'}blogs/top" data-tab-target="js-tab-pane-blogs" class="active"><a href="#">{$aLang.block_blogs_top}</a></li>

		{if $oUserCurrent}
			<li data-type="tab" data-tab-url="{router page='ajax'}blogs/join" data-tab-target="js-tab-pane-blogs"><a href="#">{$aLang.block_blogs_join}</a></li>
			<li data-type="tab" data-tab-url="{router page='ajax'}blogs/self" data-tab-target="js-tab-pane-blogs"><a href="#">{$aLang.block_blogs_self}</a></li>
		{/if}
	</ul>
{/block}

{block 'block_content'}
	<div id="js-tab-pane-blogs">
		{$sBlogsTop}
	</div>
{/block}

{block 'block_footer'}
	<a href="{router page='blogs'}">{$aLang.block_blogs_all}</a>
{/block}