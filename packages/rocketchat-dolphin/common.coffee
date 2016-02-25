config =
	serverURL: ''
	authorizePath: '/m/oauth2/auth/'
	tokenPath: '/m/oauth2/token/'
	identityPath: '/m/oauth2/api/me/'
	addAutopublishFields:
		forLoggedInUser: ['services.dolphin']
		forOtherUsers: ['services.dolphin.name']

Dolphin = new CustomOAuth 'dolphin', config

class DolphinOnCreateUser
	constructor: (options, user) ->
		if user.services?.dolphin?.NickName?
			user.username = user.services.dolphin.NickName
		return user

if Meteor.isServer
	Meteor.startup ->
		RocketChat.models.Settings.find({ _id: 'API_Dolphin_URL' }).observe
			added: (record) ->
				config.serverURL = RocketChat.settings.get 'API_Dolphin_URL'
				Dolphin.configure config
			changed: (record) ->
				config.serverURL = RocketChat.settings.get 'API_Dolphin_URL'
				Dolphin.configure config

	RocketChat.callbacks.add 'beforeCreateUser', DolphinOnCreateUser, RocketChat.callbacks.priority.HIGH
else
	Meteor.startup ->
		Tracker.autorun ->
			if RocketChat.settings.get 'API_Dolphin_URL'
				config.serverURL = RocketChat.settings.get 'API_Dolphin_URL'
				Dolphin.configure config
