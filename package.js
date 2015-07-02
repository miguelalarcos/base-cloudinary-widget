Package.describe({
  name: 'miguelalarcos:base-cloudinary-widget',
  version: '0.1.0',
  // Brief, one-line summary of the package.
  summary: '',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.2');
  api.use('coffeescript');
  api.use('jquery');
  api.use('templating');
  api.use('aldeed:template-extension@3.4.3');
  api.use('nekojira:cloudinary-jquery-upload@0.1.0');
  api.addFiles('base-cloudinary-widget.html', 'client');
  api.addFiles('base-cloudinary-widget.coffee', 'client');
});

//Package.onTest(function(api) {
//  api.use('tinytest');
//  api.use('miguelalarcos:base-cloudinary-widget');
  //api.addFiles('base-cloudinary-widget-tests.js');
//});
