# UNA OAuth2

config =
	serverURL: ''
	authorizePath: '/m/oauth2/auth/'
	tokenPath: '/m/oauth2/token/'
	identityPath: '/m/oauth2/api/me/'
	scope: 'basic'
	addAutopublishFields:
		forLoggedInUser: ['services.una']
		forOtherUsers: ['services.una.name']

Una = new CustomOAuth 'una', config

class UnaOnCreateUser
	constructor: (options, user) ->
		if user.services?.una?.name?
			user.username = user.services.una.name
		return user

if Meteor.isServer
	Meteor.startup ->
		RocketChat.models.Settings.find({ _id: 'Accounts_OAuth_UNA_URL' }).observe
			added: (record) ->
				config.serverURL = RocketChat.settings.get 'Accounts_OAuth_UNA_URL'
				Una.configure config
			changed: (record) ->
				config.serverURL = RocketChat.settings.get 'Accounts_OAuth_UNA_URL'
				Una.configure config

		if RocketChat.settings.get 'Accounts_OAuth_UNA_URL'
			data =
				buttonLabelText: RocketChat.settings.get 'Accounts_OAuth_UNA_button_label_text'
				buttonColor: RocketChat.settings.get 'Accounts_OAuth_UNA_button_color'
				buttonLabelColor: RocketChat.settings.get 'Accounts_OAuth_UNA_button_label_color'
				clientId: RocketChat.settings.get 'Accounts_OAuth_UNA_id'
				secret: RocketChat.settings.get 'Accounts_OAuth_UNA_secret'
				loginStyle: RocketChat.settings.get 'Accounts_OAuth_UNA_login_style'

			ServiceConfiguration.configurations.upsert {service: 'una'}, $set: data

	RocketChat.callbacks.add 'beforeCreateUser', UnaOnCreateUser, RocketChat.callbacks.priority.HIGH
else
	Meteor.startup ->
		Tracker.autorun ->

			if RocketChat.settings.get 'Accounts_OAuth_UNA_URL'
				config.serverURL = RocketChat.settings.get 'Accounts_OAuth_UNA_URL'
				Una.configure config

