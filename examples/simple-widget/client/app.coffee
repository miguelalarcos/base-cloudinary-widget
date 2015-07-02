Template.upload.inheritsHooksFrom('uploadCloudinary')

Template.upload.events
  'dragenter .drop-zone': (e,t) ->
    $(t.find('.drop-zone')).css('background-color':'yellow')
  'dragleave .drop-zone, drop .drop-zone': (e, t) ->
    $(t.find('.drop-zone')).css('background-color':'white')

settings =
  cloud_name: Meteor.settings.public.cloud_name
  preset: Meteor.settings.public.preset
  start: (self, data) ->
    bar = self.$('#' + self.data.id + '-bar')
    bar.progress(percent: 0)
  done: (self, data) ->
    #Images.insert({public_id: data.result.public_id})
    sAlert.success(Blaze.toHTMLWithData(Template.fileUploadedAlert, {id: data.result.public_id}), {html: true, position: 'top-right', timeout: 5000})
  progress: (self, data) ->
    bar = self.$('#' + self.data.id + '-bar')
    x = Math.round((data.loaded * 100.0) / data.total)
    bar.progress(percent: x)
    console.log 'percent', x
  fail: (self, data) ->
    sAlert.error('Error!', {position: 'top-right', timeout: 5000})
    console.log data

Template.xbody.helpers
  settings: -> settings