require [
  'app'
  'layout-view'
  'router'
  'controller'
  'app-config'
], (
  App,
  AppLayoutView,
  AppRouter,
  AppController,
  AppConfig
) ->

  window.App = new App()
  window.App.on 'start', ->
    new AppLayoutView().render()
    new AppRouter controller: new AppController()
    Backbone.history.start()

  window.appConfig = new AppConfig()

  $.ajaxSetup
    statusCode:
      401: ->
        channel = Backbone.Radio.channel 'user'
        channel.trigger "unauthorized"
      404: (response, status, error) ->

  require [
    "modules/authentication/api"
    "modules/dashboard/api"
  ], ->
    window.App.start()
    return
