# Trident OAuth2

config =
	serverURL: ''
	authorizePath: '/m/oauth2/auth/'
	tokenPath: '/m/oauth2/token/'
	identityPath: '/m/oauth2/api/me/'
	addAutopublishFields:
		forLoggedInUser: ['services.trident']
		forOtherUsers: ['services.trident.name']

Trident = new CustomOAuth 'trident', config

class TridentOnCreateUser
	constructor: (options, user) ->
		if user.services?.trident?.name?
			user.username = user.services.trident.name
		return user

if Meteor.isServer
	Meteor.startup ->
		RocketChat.models.Settings.find({ _id: 'API_Trident_URL' }).observe
			added: (record) ->
				config.serverURL = RocketChat.settings.get 'API_Trident_URL'
				Trident.configure config
			changed: (record) ->
				config.serverURL = RocketChat.settings.get 'API_Trident_URL'
				Trident.configure config

		if RocketChat.settings.get 'API_Trident_URL'
			data =
				buttonLabelText: RocketChat.settings.get 'Accounts_OAuth_Trident_button_label_text'
				buttonColor: RocketChat.settings.get 'Accounts_OAuth_Trident_button_color'
				buttonLabelColor: RocketChat.settings.get 'Accounts_OAuth_Trident_button_label_color'
				clientId: RocketChat.settings.get 'Accounts_OAuth_Trident_id'
				secret: RocketChat.settings.get 'Accounts_OAuth_Trident_secret'
				loginStyle: RocketChat.settings.get 'Accounts_OAuth_Trident_login_style'

			ServiceConfiguration.configurations.upsert {service: 'trident'}, $set: data

	RocketChat.callbacks.add 'beforeCreateUser', TridentOnCreateUser, RocketChat.callbacks.priority.HIGH
else
	Meteor.startup ->
		Tracker.autorun ->

			if RocketChat.settings.get 'API_Trident_URL'
				config.serverURL = RocketChat.settings.get 'API_Trident_URL'
				Trident.configure config

