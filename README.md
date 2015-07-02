base-cloudinary-widget
======================
All you need to make your own cloudinary-js upload widget.

Explanation
-----------
Here you have an example of a minimum widget with ```semantic:ui-progress``` and ```juliancwirko:s-alert```:

```html
<template name="demo">
    {{> upload id='file' settings=settings}}
</template>

<template name="upload">
    <div>
        <label for="{{id}}" class="ui icon button">
            <i class="file icon"></i>
            Open File</label>
        <input type="file" name="file" id="{{id}}" style="display:none">
        <div class="ui teal progress" id="{{id}}-bar">
            <div class="bar"></div>
            <div class="label">my upload</div>
        </div>
        <div class="drop-zone">
            drop here!
        </div>
    </div>
</template>
```

and

```coffee
Template.upload.inheritsHooksFrom('uploadCloudinary')

Template.upload.events
  'dragenter .drop-zone': (e,t) ->
    $(t.find('.drop-zone')).css('background-color':'yellow')
  'dragleave .drop-zone': (e, t) ->
    $(t.find('.drop-zone')).css('background-color':'white')

settings =
  cloud_name: Meteor.settings.public.cloud_name
  preset: Meteor.settings.public.preset
  start: (self, data) ->
    bar = self.$('#' + self.data.id + '-bar')
    bar.progress(percent: 0)
  done: (self, data) ->
    #Images.insert({public_id: data.result.public_id})
    sAlert.success('File uploaded!', {position: 'top-right', timeout: 5000})
  progress: (self, data) ->
    bar = self.$('#' + self.data.id + '-bar')
    x = Math.round((data.loaded * 100.0) / data.total)
    bar.progress(percent: x)

Template.demo.helpers
  settings: -> settings
```