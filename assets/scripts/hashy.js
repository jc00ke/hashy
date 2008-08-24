var copy = function(inElement) {
	if (inElement.createTextRange) {
		var range = inElement.createTextRange();
		if (range && BodyLoaded==1)
		range.execCommand('Copy');
	} else {
		var flashcopier = $('flashcopier');
		flashcopier.innerHTML = '';
		var divinfo = '<embed src="http://cryptoassets/flash/_clipboard.swf" FlashVars="clipboard='+encodeURIComponent(inElement.value)+'" width="0" height="0" type="application/x-shockwave-flash"></embed>';
		flashcopier.innerHTML = divinfo;
	}
	new Effect.Highlight(inElement);
	inElement.blur();
};

var hashMe = function(text) {

	var url = new Template('/do/#{type}/#{text}');
	var md5 = {type: 'md5', text: text };
	
	performRequest(url.evaluate(md5), 'md5');
};

var performRequest = function(url, updateContainer) {
	new Ajax.Request(url, {
		method: 'get',
		onSuccess: function(transport) {
			$(updateContainer).value = transport.responseText;
		}
	});
};