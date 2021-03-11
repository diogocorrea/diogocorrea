self.addEventListener("install", (event) => {
	event.waitUntil(
		caches
			.open("diogocorrea_v3")
			.then((cache) =>
				cache.addAll(["/", "/index.html", "/montserrat.woff2"])
			)
	);
});
self.addEventListener("fetch", (event) => {
	event.respondWith(
		caches
			.match(event.request)
			.then((response) => response || fetch(event.request))
	);
});
