{extends file='components/email/email.tpl'}

{block name='content'}
	Пользователь <a href="{$oUserTopic->getUserWebPath()}">{$oUserTopic->getDisplayName()}</a> опубликовал в блоге <b>«{$oBlog->getTitle()|escape:'html'}»</b> новый топик &mdash; <a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a>
{/block}