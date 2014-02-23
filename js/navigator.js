'use strict';

(function(document, window) {
	var api = impress();
	api.init();
	document.getElementById('arrowLeft').addEventListener('click', function() {
		api.prev();
		event.stopPropagation();
	});
	document.getElementById('arrowRight').addEventListener('click', function() {
		api.next();
		event.stopPropagation();
	});
})(document, window);
