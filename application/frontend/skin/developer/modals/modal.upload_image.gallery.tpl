{**
 * Добавление медиа-файла / Список файлов
 *
 * @styles css/modals.css
 *}

<div id="upload-gallery-image">
	{* Drag & drop зона *}
	<label for="upload-file" class="form-input-file form-input-file-media js-media-upload-area">
		<span>Перетащите сюда файлы или кликните по этому тексту</span>
		<input type="file" name="filedata" class="js-media-upload-file" id="upload-file" multiple>
	</label>

	{* Галерея *}
	<div class="modal-upload-image-gallery">
		<div id="media-empty" class="alert alert-empty">Нет загруженных файлов</div>

		{* Список файлов *}
		<ul class="modal-upload-image-gallery-list js-media-upload-gallery-list"></ul>

		{* Информация о выделенном файле *}
		<div class="modal-upload-image-gallery-info js-media-item-info">
			{* Блок отображаемый когда нет выделенных файлов *}
			<div class="media-item-info-empty js-media-item-info-empty" style="display: none;">
				Выберите файл
			</div>

			{* Основная информация о файле *}
			<div class="js-media-detail-area" style="display: none;">
				{* Превью *}
				<img src="" alt="" class="js-media-detail-preview" width="100" height="100">

				{* Информация *}
				<ul class="mb-20">
					<li><strong class="js-media-detail-name"></strong></li>
					<li class="js-media-detail-date"></li>
					<li><span class="js-media-detail-dimensions"></span>, <span class="js-media-detail-file-size"></span></li>
					<li><a href="#" onclick="if (confirm('Удалить текущий файл?')) { ls.media.removeCurrentFile(); }; return false;">Удалить файл</a></li>
				</ul>

				{* Описание *}
				{include file='forms/fields/form.field.text.tpl'
						 sFieldName  = 'title'
						 sFieldLabel = $aLang.uploadimg_title}
	        </div>

			{* Основные настройки *}
			<div class="js-media-settings-mode" id="media-settings-mode-insert" style="display: none;">
				Опции вставки
				{* Выравнивание *}
	            <p>
	                <label>{$aLang.uploadimg_align}:</label>
	                <select name="align" class="width-full">
	                    <option value="">{$aLang.uploadimg_align_no}</option>
	                    <option value="left">{$aLang.uploadimg_align_left}</option>
	                    <option value="right">{$aLang.uploadimg_align_right}</option>
	                    <option value="center" selected="selected">{$aLang.uploadimg_align_center}</option>
	                </select>
	            </p>

	            {* Размер *}
				<p>
	                <label>Размер:</label>
	                <select name="size" class="width-full">
						{$aImageSizes = Config::Get('module.media.image_sizes')}
						{foreach $aImageSizes as $aSize}
	                        <option value="{$aSize.w}{if $aSize.crop}crop{/if}">{$aSize.w} × {if $aSize.h}{$aSize.h}{else}*{/if}</option>
						{/foreach}
	                    <option value="original">Оригинал</option>
	                </select>
				</p>
			</div>

			{* Опции фотосета *}
	        <div class="js-media-settings-mode" id="media-settings-mode-create-photoset" style="display: none;">
				Опции фотосета
				<br><br>

				{* Показывать ленту с превьюшками *}
				{include file='forms/fields/form.field.checkbox.tpl'
						 sFieldName    = 'use_thumbs'
						 bFieldChecked = true
						 sFieldLabel   = 'Показывать ленту с превьюшками'}

				{* Показывать описания фотографий *}
				{include file='forms/fields/form.field.checkbox.tpl'
						 sFieldName    = 'show_caption'
						 sFieldLabel   = 'Показывать описания фотографий'}
	        </div>
		</div>
	</div>
</div>