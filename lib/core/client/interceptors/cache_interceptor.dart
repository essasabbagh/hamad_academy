import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

/* 
 ? https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control
 */

final cacheOptions = CacheOptions(
  // A default store is required for interceptor.
  store: MemCacheStore(),

  // store: HiveCacheStore(dir),
  policy: CachePolicy.forceCache,
  // Returns a cached response on error but for statuses 401 & 403.
  // and allows to return cached response on network errors (e.g. offline usage)
  // Defaults to [null].
  hitCacheOnErrorCodes: [401, 403, 404, 422, 500],
  // Overrides any HTTP directive to delete entry past this duration.
  // Useful only when origin server has no cache config or
  // custom behaviour is desired.
  // Defaults to [null].
  maxStale: const Duration(days: 1),
  // Default. Allows 3 cache sets and ease cleanup.
  priority: CachePriority.high,
  // Default. Body and headers encryption with your own algorithm.
  cipher: null,
  // Default. Key builder to retrieve requests.
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  // Default. Allows to cache POST requests.
  // Overriding [keyBuilder] is strongly recommended when [true].
  allowPostMethod: false,
  // hitCacheOnNetworkFailure: true
);
