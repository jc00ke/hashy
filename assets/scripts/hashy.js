var copy = function(inElement) {
	if (inElement.createTextRange) {
		var range = inElement.createTextRange();
		if (range && BodyLoaded==1)
		range.execCommand('Copy');
	} else {
		var flashcopier = $('flashcopier');
		flashcopier.innerHTML = '';
		var divinfo = '<embed src="http://hashyassets/flash/_clipboard.swf" FlashVars="clipboard='+encodeURIComponent(inElement.value)+'" width="0" height="0" type="application/x-shockwave-flash"></embed>';
		flashcopier.innerHTML = divinfo;
	}
	new Effect.Highlight(inElement);
	inElement.blur();
};

var hash = function(text) {
	if (text != null && text.length > 0) {
		var url = '/h/' + text;
		new Ajax.Request(url, {
			method: 'get',
			onSuccess: function(transport) {
				//$(updateContainer).value = transport.responseText;
			}
		});
	}
	else {
		$('results').select('input').each(function(i) { i.value = ''; });
	}
};

var init = function() {
	new Form.Element.Observer('hashMe', 0.2, function(el, value){ hash(value); });
	$('hashMe').value = 'ha$hy';	
};

document.observe('dom:loaded', function() {
	setTimeout("new Effect.Highlight('hashMe');", 250);
	setTimeout("new Effect.Highlight('results');", 750);
	$('results').select('input').invoke('observe', 'click', function(){copy(this)});
	setTimeout("init();", 1250);
});
