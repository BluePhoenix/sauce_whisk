# Major Version 0
### 0.0.18
* @tommeier is a champion and bumped rest_client to 1.8.0 to avoid a security flaw (Fixes #42).

### 0.0.17
* Added `asset_fetch_retries=` and `rest_retries=` methods to `SauceWhisk` object.  These are used in preference to any other configuration value.

### 0.0.16
* Don't try using 'puts' for the logger

### 0.0.15
* Allowed for use of the HTTP_PROXY environment variable for uh, configuring proxies
* Added 'saucewhisk' and 'sauce-whisk' require files

### 0.0.14
* Added `fetch!` to fail when jobs don't fetch assets
* Made `fetch` succeed in all cases
* Added retries for all 404s
* Added `delete` for assets (Thanks, @dmfranko!)

### 0.0.13
* Sauce storage support added (Thanks @bootstraponline)
* Various gem build quality fixes (Thanks @bootstraponline)
* Added `Jobs.delete_job` (Thanks, @seanknox!)

### 0.0.12
* Added additional minute types

### 0.0.8
* Correctly read Sauce Config

### 0.0.6
* Correct RestClient -- Actually require it

### 0.0.5
* Added Sauce class

### 0.0.4
* Added configuration loading from the Sauce gem, if present
