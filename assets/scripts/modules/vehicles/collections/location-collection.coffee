define [
  './../models/location-model'
],  (LocationModel)->

  App.module "Vehicles", (Module, App, Backbone, Marionette, $, _) ->

    class Module.LocationCollection extends Backbone.Collection
      model: LocationModel

      toArray:->
        result = _.map @models, (model)-> name: model.get('id'), abbreviation: model.get('name')
        result.unshift name:"", abbreviation: ""
        result

  App.Vehicles.LocationCollection
