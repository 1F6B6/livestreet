/**
 * Топик
 * 
 * @module ls/topic
 * 
 * @license   GNU General Public License, version 2
 * @copyright 2013 OOO "ЛС-СОФТ" {@link http://livestreetcms.com}
 * @author    Denis Shakhov <denis.shakhov@gmail.com>
 */

var ls = ls || {};

ls.topic = (function ($) {
	"use strict";

	/**
	 * Дефолтные опции
	 */
	var defaults = {
		// Роутеры
		oRouters: {
			preview: aRouter['content'] + 'ajax/preview/'
		},

		// Селекторы
		selectors: {
			previewTopicTextButton:     '.js-topic-preview-text-button',
			previewTopicTextHideButton: '.js-topic-preview-text-hide-button',
			addTopicTitle:              '.js-topic-add-title'
		}
	};

	/**
	 * Инициализация
	 *
	 * @param  {Object} options Опции
	 */
	this.init = function(options) {
		var self = this;

		this.options = $.extend({}, defaults, options);

		// Превью текста
		$(this.options.selectors.previewTopicTextButton).on('click', function (e) {
			self.showPreviewText('form-topic-add', 'topic-text-preview');
		});

		// Закрытие превью текста
		$(document).on('click', this.options.selectors.previewTopicTextHideButton, function (e) {
			self.hidePreviewText();
		});

		// Подгрузка информации о выбранном блоге при создании топика
		$(this.options.selectors.addTopicTitle).on('change', function (e) {
			ls.blog.loadInfo($(this).val());
		});

		ls.blog.loadInfo($(this.options.selectors.addTopicTitle).val());
	};

	/**
	 * Превью текста
	 *
	 * @param  {String} sFormId ID формы
	 * @param  {String} sPreviewId ID блока превью
	 */
	this.showPreviewText = function(sFormId, sPreviewId) {
		var oForm = $('#' + sFormId);
		var oPreview = $('#' + sPreviewId);
		var oButton = oForm.find(this.options.selectors.previewTopicTextButton);

		ls.hook.marker('previewBefore');

		ls.ajax.submit(this.options.oRouters.preview, oForm, function(result) {
			if (result.bStateError) {
				ls.msg.error(null, result.sMsg);
			} else {
				oPreview.show().html(result.sText);

				ls.hook.run('ls_topic_preview_after', [oForm, oPreview, result]);
			}
		}, {
			submitButton: oButton
		});
	};

	/**
	 * Закрытие превью
	 */
	this.hidePreviewText = function() {
		$('#topic-text-preview').hide();
	};

	return this;
}).call(ls.topic || {}, jQuery);