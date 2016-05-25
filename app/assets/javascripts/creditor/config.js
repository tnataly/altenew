CKEDITOR.editorConfig = function( config )
{
    // Configure font sizes

    var fontSizes = "";
    for (i=6; i <= 240; i++)
    {
        fontSizes += i + '/' + i + 'px;';
    }
    config.fontSize_sizes = fontSizes;

    // Common configuration options

    config.removePlugins =  'magicline,maximize,resize,elementspath,save,document,tools,forms,image,dragdrop,basket,flash,' +
                            'colordialog,filebrowser,find,newpage,pagebreak,pastefromword,scayt,tabletools,' +
                            'about,a11yhelp,blockquote,dialogadvtab,horizontalrule,popup,print,smiley,stylescombo,table,' +
                            'removeformat,showblocks,showborders,templates,specialchar,div,iframe,link,wsc,liststyle,menubutton,contextmenu,language';

    config.extraPlugins = 'lineheight,letterspacing,paragraphspacing,colorbutton_dynamic,sharedspace,sourcearea';

    config.extraAllowedContent = 'span[id]{position,top};p{color}';
    config.disallowedContent = 'font';
    config.disableNativeSpellChecker = false;

//    config.scayt_autoStartup = true;
//    config.scayt_contextCommands = 'off';

    config.enterMode = CKEDITOR.ENTER_BR;
    config.shiftEnterMode = CKEDITOR.ENTER_P;
    config.forcePasteAsPlainText = true;

    config.toolbar =
    [
        { name: 'font', items : [ 'Font','FontSize' ] },
        { name: 'color', items: [ 'DynamicTextColor' ] },
        { name: 'align', items : [ 'JustifyLeft','JustifyCenter','JustifyRight'/*,'JustifyBlock'*/ ] },
        { name: 'paragraph', items : [ 'Outdent','Indent' ] },
        { name: 'paragraph-spacing', items: [ 'ParagraphSpacing_Less','ParagraphSpacing_More' ] },
        /*{ name: 'clipboard', items : [ 'Cut','Copy','PasteText','-','Undo','Redo','PasteText','PasteFromWord'] },*/
        { name: 'history', items : [ 'Undo','Redo'] },
        { name: 'letter-spacing', items: [ 'LetterSpacing' ] },
        { name: 'line-height', items: [ 'LineHeight' ] }
    ];

    // Configure color picker choices

    config.colorButton_colors = getPersonalizationTextColors();
    config.colorButton_enableMore = false;

    // Configure font names

    config.font_names = getPersonalizationFonts();
    /*config.font_style = {
      element: 'span',
      styles: { 'font-family': 'proximanovalight'},
      overrides : [ { element : 'font', attributes : { 'face' : null } } ]
    }*/

    //Set's the default selected font.
    //config.font_defaultLabel = 'Proxima Nova Light';
    if (typeof(getAdditionalEditorConfig) === "function")
    {
        config.customConfig = getAdditionalEditorConfig();
    }
};