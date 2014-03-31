ApplicationAdapter = DS.RESTAdapter.extend
  host: 'localhost:8888'
  ajaxOptions: (url, type, hash) ->
    hash = hash || {}
    hash.xhrFields = hash.xhrFields || {}
    hash.xhrFields.withCredentials = true
    @_super.call @, url, type, hash

`export default ApplicationAdapter`
