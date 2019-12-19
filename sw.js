self.addEventListener("install", event => {
	event.waitUntil(
		caches.open("airhorner").then(cache => {
			return cache.addAll(["/", "/index.html", "/montserrat.woff2"]);
		})
	);
});
self.addEventListener("fetch", event => {
	event.respondWith(
		caches.match(event.request).then(response => {
			return response || fetch(event.request);
		})
	);
});
