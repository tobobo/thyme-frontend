ApplicationAdapter = DS.RESTAdapter.extend
  host: window.ENV.THYME_BACKEND_URL
  ajaxOptions: (url, type, hash) ->
    hash = hash || {}
    hash.xhrFields = hash.xhrFields || {}
    hash.xhrFields.withCredentials = true
    @_super.call @, url, type, hash

`export default ApplicationAdapter`
