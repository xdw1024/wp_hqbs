/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    // config.removedButtons = 'Underline,JustifyCenter';
    // config.removeplugins = 'Underline,JustifyCenter';
    // config.removeButtons = 'Underline,JustifyCenter';
    config.toolbar = [

        [ 'Source', '-', 'Preview', '-'],

        [ 'PasteText', 'PasteFromWord', '-', 'SpellChecker', 'Scayt' ],

        [ 'SelectAll','RemoveFormat' ],

        [ 'Form', 'Radio', 'TextField','Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ],

        '/',

        [ 'Bold', 'Italic', 'Underline', 'Strike', '-'],

        [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent','Blockquote', 'CreateDiv' ],

        [ 'Link', 'Unlink', 'Anchor' ],

        ['Image', 'Flash', 'Table','HorizontalRule', 'Smiley','SpecialChar'],

        '/',

        [ 'Styles', 'Format', 'Font', 'FontSize' ],

        [ 'TextColor', 'BGColor' ],

        [ 'Maximize', 'ShowBlocks', '-', 'About' ] ];

    // config.toolbar = [
    //
    //     [ 'Source', '-', 'Preview', '-', 'Templates' ],
    //
    //     [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Print', 'SpellChecker', 'Scayt' ],
    //
    //     [ 'Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll','RemoveFormat' ],
    //
    //     [ 'Form', 'Checkbox', 'Radio', 'TextField','Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ],
    //
    //     '/',
    //
    //     [ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript' ],
    //
    //     [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent','Blockquote', 'CreateDiv' ],
    //
    //     [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
    //
    //     [ 'Link', 'Unlink', 'Anchor' ],
    //
    //     ['Image', 'Flash', 'Table','HorizontalRule', 'Smiley','SpecialChar', 'PageBreak' ],
    //
    //     '/',
    //
    //     [ 'Styles', 'Format', 'Font', 'FontSize' ],
    //
    //     [ 'TextColor', 'BGColor' ],
    //
    //     [ 'Maximize', 'ShowBlocks', '-', 'About' ] ];
};
