{**
 * Теги
 *
 * @styles css/blocks.css
 *}

{extends file='blocks/block.aside.base.tpl'}

{block name='block_title'}{$aLang.block_tags}{/block}
{block name='block_type'}tags{/block}

{block name='block_nav'}
	<ul class="nav nav-pills" data-type="tabs">
		<li class="active" data-type="tab" data-tab-target="js-tab-pane-all"><a href="#">{$aLang.topic_favourite_tags_block_all}</a></li>
		{if $oUserCurrent}
			<li data-type="tab" data-tab-target="js-tab-pane-my"><a href="#">{$aLang.topic_favourite_tags_block_user}</a></li>
		{/if}

		{hook run='block_tags_nav_item'}
	</ul>
{/block}

{block name='block_content'}
	{include file='forms/form.search.tags.tpl'}
	
	<div data-type="tab-panes">
		<div class="tab-pane" data-type="tab-pane" id="js-tab-pane-all" style="display: block">
			{include file='tag_cloud.tpl' aTags=$aTags sTagsUrl='{router page=\'tag\'}{$oTag->getText()|escape:\'url\'}/'}
		</div>

		{if $oUserCurrent}
			<div class="tab-pane" data-type="tab-pane" id="js-tab-pane-my">
				{include file='tag_cloud.tpl' aTags=$aTagsUser sTagsUrl='{router page=\'tag\'}{$oTag->getText()|escape:\'url\'}/'}
			</div>
		{/if}
	</div>
{/block}