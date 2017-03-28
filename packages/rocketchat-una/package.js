
Package.describe({
    name: 'rocketchat:una',
    version: '0.0.3',
    summary: 'RocketChat settings for UNA Oauth'
});

Package.onUse(function(api) {
    api.versionsFrom('1.0');
    api.use('coffeescript');
    api.use('service-configuration');
    api.use('rocketchat:lib@0.0.1');
    api.use('rocketchat:custom-oauth');
    api.addFiles('common.coffee');
    api.addFiles('login-button.css', 'client');
    api.addFiles('startup.coffee', 'server');

	api.use('templating', 'client');
});
