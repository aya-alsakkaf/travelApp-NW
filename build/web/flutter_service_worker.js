'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "fed17bca0c65206a6ceb9408b95688c5",
"index.html": "aa76d6f38dbb14accadb8d29f9bfb2e1",
"/": "aa76d6f38dbb14accadb8d29f9bfb2e1",
"main.dart.js": "d04c79cba2947a1346f72995ea774841",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "41aed3438c7f05df5670b4b783ffb08a",
"assets/AssetManifest.json": "c25ee8659430ac041a1652bc73f25371",
"assets/NOTICES": "c2fe2ae6b0f3c20da4f09b8608b16f8e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "722c9ffca5173e3628df2c5ae6b36fe4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "fe7d69be33cb57db5d692dea77ef916a",
"assets/fonts/MaterialIcons-Regular.otf": "88c72b98cdb1e01bf2e7ce701c1d1478",
"assets/assets/blueprofile.png": "7e7f48ad692bb5271bba83bc3d546bd7",
"assets/assets/chicago.jpeg": "6d5c4227d21bba8006bfc7cffca9fa41",
"assets/assets/nyc.jpeg": "c39366191b7aad7fce4353ae9a7ef66c",
"assets/assets/UAE.png": "8ea040cacf3a627e578a564691d759d8",
"assets/assets/Zambia.png": "8c9d09b898934edf38a7e76ef4004ed0",
"assets/assets/riyadh.jpeg": "819698db4deb6e567d0a20c3bc2357bf",
"assets/assets/ToyotaCorolla.jpeg": "1a0fc87e2b6f2dcb1198b71da48fe4ad",
"assets/assets/ChevroletCamaro.jpeg": "9a538182b7592e45f556090a7186fc1a",
"assets/assets/southK.jpeg": "3af72d21429672d5804352482e033db4",
"assets/assets/teslamodelS.jpeg": "8f98285f0186fabaf16cd7f682bfe8fb",
"assets/assets/tokoyo.jpeg": "0ac56aff492a0befc5ebdbad0f40eaa6",
"assets/assets/singaporeAirlines.png": "a194ea4564aac72829fb65994063c84c",
"assets/assets/japanair.png": "45fcbf06336732deb96e2e030abd9640",
"assets/assets/jazeeraAirlines.png": "4b9d418029d2fce6d7801b26597b60a7",
"assets/assets/cairo.jpeg": "0fda24c646e3c9c09f4d0ad7a218a09f",
"assets/assets/koreanair.png": "52966842eed3a15edc9c5cb6507314c3",
"assets/assets/grandhayyat.jpeg": "e2e3629939eb268f00062ac0d53d2fd7",
"assets/assets/logo.png": "71934f9ec6bbdeca858a8fbc0cef9419",
"assets/assets/portugalAirlines.png": "97d7623b85d6bac215c6f4c8ba71d6f9",
"assets/assets/Mercedesbenz.jpeg": "4d7f4136cc57fcf9c5cca283b3294314",
"assets/assets/HondaCivic.jpeg": "0db47aa16ebc22fb92f09e4d5135d098",
"assets/assets/paris.jpeg": "8889aaca7e5cf7c2706ff0559c56adb4",
"assets/assets/bejin.jpeg": "6ccad8f0a51aa7e96c0913cacd6f58d1",
"assets/assets/qatarAirlines.jpeg": "c72354ced7ed2328ea2ec1e16401763c",
"assets/assets/BMWX5.jpeg": "36532ec8bc9dbf2bb9a2b5735a5eafe5",
"assets/assets/Beijing.jpeg": "bce5dc818ef77ed0376e371084369ad6",
"assets/assets/grandhayyatbeds.jpeg": "f087f57259c9e2535848323aa0f3d5d2",
"assets/assets/kuwaitAirlines.png": "03f99da918dea5b18a8cd3b38c7a222c",
"assets/assets/grandhayyatpool.jpeg": "e371733b8aa74f98c65376a33d8a9bd4",
"assets/assets/MandarinOrientalDoha.webp": "e082430aa700e7c2bfb880d94a10d019",
"assets/assets/logo-nobg.png": "eb93a57464c531bdf0a57618b22bd91e",
"assets/assets/mozaAirlines.png": "c1fc90c4d38162e935bf5ea1c67955fe",
"assets/assets/signielsouel.jpeg": "91e60fd6e10b6a2f75021d4ebc829222",
"assets/assets/Mada.png": "d6c654ae0fdcb626b9dc9e293fa1ade6",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
