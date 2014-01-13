{**
 * Стена
 *}

{extends file='layouts/layout.user.tpl'}

{block name='layout_user_page_title'}{$aLang.user_menu_profile_wall}{/block}

{block name='layout_content'}
	{* Форма добавления записи *}
	{if $oUserCurrent}
		{include 'actions/ActionProfile/wall.form.tpl'}
	{else}
		{include 'alert.tpl' sAlertStyle='info' mAlerts=$aLang.wall_add_quest}
	{/if}

	{if ! count($aWall)}
		{include 'alert.tpl' mAlerts=$aLang.wall_list_empty sAlertStyle='empty' sAlertAttributes='id="wall-empty"'}
	{/if}

	{* Список записей *}
	<div class="js-wall-entry-container" data-id="0">
		{include 'actions/ActionProfile/wall.posts.tpl'}
	</div>

	{* Кнопка подгрузки записей *}
	{if $iCountWall - count($aWall)}
		<div class="get-more js-wall-get-more" data-id="0">
			{$aLang.wall_load_more} (<span class="js-wall-get-more-count">{$iCountWall - count($aWall)}</span>)
		</div>
	{/if}
{/block}