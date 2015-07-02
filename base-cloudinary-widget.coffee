Template.uploadCloudinary.hooks
  rendered: ->
    this.$('input').unsigned_cloudinary_upload(this.data.settings.preset,{ cloud_name: this.data.settings.cloud_name}, {dropZone: this.$('.drop-zone')})
    start = this.data.settings.start
    done = this.data.settings.done
    progress = this.data.settings.progress
    self = this
    this.$('input').bind 'cloudinarystart', (e, data) ->
      if start
        start self, data
    this.$('input').bind 'cloudinarydone', (e,data) ->
      if done
        done self, data
    this.$('input').bind 'cloudinaryprogress', (e, data) ->
      if progress
        progress self, data