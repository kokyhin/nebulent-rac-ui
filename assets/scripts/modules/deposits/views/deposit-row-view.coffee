define ['./templates/deposit-row-template'], (template)->

  App.module "Deposits", (Module, App, Backbone, Marionette, $, _) ->

    class Module.DepositsRowView extends Marionette.ItemView
      className:  "item-view rent-agreement-row"
      tagName:    "tr"
      template: template

      events:
        "click .return-deposit":  "onReturnClick"

      initialize: (options)->
        @index = options.index
        @channel = Backbone.Radio.channel 'deposits'
        @listenTo @model, "change", @render, @

      templateHelpers: ->
        modelIndex: @index

      onClick: (e)->
        return true if $(e.target).prop('tagName') in ["I", "A"]

      onReturnClick: (e)->
        e.preventDefault()
        debugger

  App.Deposits.DepositsRowView