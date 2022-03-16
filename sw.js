const CACHE = "diogocorrea_v8";

self.addEventListener("install", (event) => {
	caches.keys().then((names) => {
		for (let name of names) {
			if (name !== CACHE) {
				caches.delete(name);
			}
		}
	});
	event.waitUntil(
		caches
			.open(CACHE)
			.then((cache) =>
				cache.addAll([
					"/",
					"/index.html",
					"/montserrat.woff2",
					"/bg.svg",
				])
			)
	);
});

self.addEventListener("fetch", (event) => {
	event.respondWith(
		caches
			.match(event.request)
			.then((response) => response || fetch(event.request))
	);

	event.waitUntil((event) =>
		caches
			.open(CACHE)
			.then((cache) =>
				fetch(event.request).then((response) =>
					cache.put(request, response)
				)
			)
	);
});
